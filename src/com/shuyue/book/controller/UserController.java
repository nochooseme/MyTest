package com.shuyue.book.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.shuyue.book.pojo.Book;
import com.shuyue.book.pojo.Check;
import com.shuyue.book.pojo.NewPassword;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.PagingOutput;
import com.shuyue.book.pojo.User;
import com.shuyue.book.service.BookService;
import com.shuyue.book.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;


	
	@RequestMapping("/register")
	public ModelAndView register(@Valid User user,BindingResult result) {
		ModelAndView mv=new ModelAndView();
		user.setUserpic("static/images/user.png");
		if (result.hasFieldErrors()) {
			mv.setViewName("register");			
		}else {
			switch (userService.register(user)) {
			case 0:
				mv.addObject("result", "用户名已存在！");
				mv.setViewName("redirect:registerpage");
				break;
			case 1:
				mv.addObject("result", "注册成功！");
				mv.setViewName("redirect:loginpage");
				break;
			case 2:
				mv.setViewName("redirect:registerpage");
				mv.addObject("result", "注册失败！");
				break;
			}
		}
		
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(User user,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		//Session中存好的验证码数值
		String piccode = (String) request.getSession().getAttribute("piccode");
		//前端用户输入的验证码值
		String verifycode = request.getParameter("verifycode");
		HttpSession session=request.getSession();
		User result=userService.login(user);
		if(result==null) {
			mv.setViewName("redirect:loginpage");
		}else {
			mv.addObject(result);
			session.setAttribute("userId", result.getId());
			session.setAttribute("userName", result.getUsername());
			if (result.getUserpic()==""||result.getUserpic()==null) {
				session.setAttribute("userPic", "static/images/user.png");
			}else {
				session.setAttribute("userPic", result.getUserpic());
			}
			
			session.setAttribute("userStatus", result.getStatus());
			if (verifycode.equals(piccode)) {
				session.removeAttribute("piccode");
				switch (result.getStatus()) {
				case 0:
					mv.setViewName("redirect:index");
					break;
				case 1:
					mv.setViewName("redirect:index");
					break;
				case 2:
					mv.setViewName("redirect:edit");
					break;
				case 3:
					mv.setViewName("redirect:admin");
					break;
				default:
					mv.setViewName("redirect:index");
					break;
				}
			}else {
				mv.addObject("coderesult", "验证码输入错误！");
			}
			
			
		}
		return mv;
	}
	
	@RequestMapping("/author/{id}")
	public ModelAndView author(@PathVariable("id") Long id) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("authorInfo", userService.userInfo(id));
		mv.addObject("authorBook", bookService.authorBook(id));
		mv.setViewName("author");
		return mv;
		
	}
	
	@RequestMapping("/userInfo")
	public ModelAndView userInfo(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("userinfo", userService.userinfo((Long)session.getAttribute("userId")));
		mv.setViewName("user/userInfo");
		return mv;
	}
	
	@RequestMapping("/readed")
	public ModelAndView readed(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("readed", bookService.readed((Long)session.getAttribute("userId")));
		mv.setViewName("user/readed");
		return mv;
	}
	
	@RequestMapping("bookShelf")
	public ModelAndView bookShelf(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("bookShelf", bookService.bookShelf((Long)session.getAttribute("userId")));
		mv.setViewName("user/bookShelf");
		return mv;
	}
	
	@RequestMapping("/searchAuthor")
	public ModelAndView searchAuthor(PagingInput pi) {
		ModelAndView mv=new ModelAndView();
		if (pi.getPage()==0) {
			pi.setPage(1);
		}
		PagingOutput po=userService.authorList(pi);
		po.setPage(pi.getPage());
		po.setAllpage((int)Math.ceil((double)po.getAll()/10.0));
		mv.addObject("result", po);
		mv.setViewName("edit/authormanager");
		return mv;
	}
	
	@RequestMapping("/updateauhtorlevel")
	public ModelAndView updateauthorlevel(User user) {
		ModelAndView mv=new ModelAndView();
		if (userService.updarteauthorlevel(user)>0) {
			mv.addObject("result", "成功！");
		}else {
			mv.addObject("result", "失败！");
		}
		mv.setViewName("redirect:authorInfo/"+user.getId());
		return mv;
	}
	
	@RequestMapping("/addEdit")
	public ModelAndView addEdit(@RequestParam("id") Long id) {
		ModelAndView mv=new ModelAndView();
		if (userService.addEdit(id)>0) {
			mv.addObject("result", "成功！");
		}else {
			mv.addObject("result", "失败！");
		}
		mv.setViewName("redirect:/admin");
		return mv;
	}
	
	@RequestMapping("/delEdit")
	public ModelAndView delEdit(@RequestParam("id") Long id) {
		ModelAndView mv=new ModelAndView();
		if (userService.delEdit(id)>0) {
			mv.addObject("result", "成功！");
		}else {
			mv.addObject("result", "失败！");
		}
		mv.setViewName("redirect:/admin");
		return mv;
	}
	
	@RequestMapping("/searchUser")
	public ModelAndView searchUser(PagingInput pi) {
		ModelAndView mv=new ModelAndView();
		if (pi.getPage()==0) {
			pi.setPage(1);
		}
		PagingOutput po=userService.searchUser(pi);
		po.setPage(pi.getPage());
		po.setAllpage((int)Math.ceil((double)po.getAll()/10.0));
		if (po.getAllpage()==0) {
			po.setAllpage(1);
		}
		mv.addObject("result", po);
		mv.addObject("param", pi);
		mv.setViewName("admin/addedit");
		return mv;
	}
	
	@RequestMapping("/searchuser")
	public ModelAndView searchuser(PagingInput pi) {
		ModelAndView mv=new ModelAndView();
		if (pi.getPage()==0) {
			pi.setPage(1);
		}
		PagingOutput po=userService.searchUser(pi);
		po.setPage(pi.getPage());
		po.setAllpage((int)Math.ceil((double)po.getAll()/10.0));
		if (po.getAllpage()==0) {
			po.setAllpage(1);
		}
		mv.addObject("result", po);
		mv.addObject("param", pi);
		mv.setViewName("admin/usermanager");
		return mv;
	}
	
	@RequestMapping("/user/{id}")
	public ModelAndView user(@PathVariable("id") Long id) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("user", userService.user(id));
		mv.setViewName("admin/user");
		return mv;
	}
	
	@RequestMapping("/updateuser")
	public ModelAndView updateuser(User user) {
		ModelAndView mv=new ModelAndView();
		if (userService.adminupdateuser(user)>0) {
			mv.addObject("result", "成功！");
		}else {
			mv.addObject("result", "失败！");
		}
		mv.setViewName("redirect:user/"+user.getId());
		return mv;
	}
	
	@RequestMapping("/updateUser")
	public ModelAndView updateUser(User user) {
		ModelAndView mv=new ModelAndView();
		if (userService.updateUser(user)>0) {
			mv.addObject("result", "成功！");
		}else {
			mv.addObject("result", "失败！");
		}
		mv.setViewName("redirect:user/"+user.getId());
		return mv;
	}
	
	@RequestMapping("/resetpsw")
	@ResponseBody
	public JSONObject resetpsw(@RequestBody Check check) {
		JSONObject json=new JSONObject();
		if (userService.resetpsw(check.getId())>0) {
			json.put("result", "重置成功！");
		}else {
			json.put("result", "重置失败！");
		}
		return json;
	}
	
	@RequestMapping("/logout")
	@ResponseBody
	public JSONObject logout(HttpSession session) {
		JSONObject json=new JSONObject();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userPic");
		session.removeAttribute("userStatus");
		json.put("result", "http://localhost:8080/shuyue/loginpage");
		return json;
	}
	
	@RequestMapping("/updatepassword")
	@ResponseBody
	public JSONObject updatepassword(@Valid @RequestBody NewPassword newPassword,BindingResult result,HttpSession session) {
		JSONObject json=new JSONObject();
		Long id=(Long)session.getAttribute("userId");
		newPassword.setId(id);
		if (result.hasFieldErrors()) {
			json.put("result", "密码长度必须在5-20之间！");		
		}else {
			if (newPassword.getNewpassword().equals(newPassword.getNewpassword1())) {
				switch (userService.updatepassword(newPassword)) {
				case 0:
					json.put("result", "密码修改失败！");
					break;
				case 1:
					json.put("result", "密码修改成功！");
					break;
				case 2:
					json.put("result", "原密码输入错误！");
					break;
				}
			}else {
				json.put("result", "两次新密码输入不同");
			}
		}
		
		return json;
	}
	
	@RequestMapping("/ajaxupdateuserpic")
	@ResponseBody
	public JSONObject ajaxupdateuserpic(HttpServletRequest request) {		
		MultipartHttpServletRequest mhsr=(MultipartHttpServletRequest) request;
		MultipartFile file=mhsr.getFile("file");
		String id=mhsr.getParameter("id");
		System.out.println(id);
		JSONObject json=new JSONObject();
		String filename=file.getOriginalFilename();
        String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
        String newfilename = String.valueOf(System.currentTimeMillis())+ "." + extensionName;
		File dest=new File("/user/"+newfilename);
		System.out.println(filename+","+extensionName+","+newfilename);
		try {
			file.transferTo(dest);
			User user=new User();
			user.setId(Long.valueOf(id));
			user.setUserpic("static/images/user/"+newfilename);
			int a=userService.updatepic(user);
			if (a>0) {
				json.put("result", "修改头像成功！");
				json.put("newPic", "static/images/user/"+newfilename);
			}else {
				json.put("result", "修改头像失败！");
			}
			
		} catch (IllegalStateException | IOException e) {
			json.put("result", "修改头像失败！");
			e.printStackTrace();
		}		
		return json;
	}
}
