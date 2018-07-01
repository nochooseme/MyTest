package com.shuyue.book.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.PortableServer.POA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shuyue.book.pojo.BookCatalog;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.PagingOutput;
import com.shuyue.book.pojo.User;
import com.shuyue.book.service.BookService;
import com.shuyue.book.service.UserService;

@Controller
public class IndexController {
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		mv.addObject("recommendbook", bookService.recommendbook());
		return mv;
	}
	
	@RequestMapping("/loginpage")
	public String loginpage() {
		return "login";
	}
	
	@RequestMapping("/updatepswpage")
	public String updatepswpage() {
		return "user/updatepsw";
	}
	
	@RequestMapping("/VerifyCode")
    public void VerifyCode(HttpServletRequest request, HttpServletResponse response) {

        // 创建一个宽100,高50,且不带透明色的image对象 100 50
        BufferedImage bi = new BufferedImage(100, 50, BufferedImage.TYPE_INT_RGB);
        Graphics g = bi.getGraphics();
        //RGB色彩
        Color c = new Color(200, 150, 255);
        // 框中的背景色
        g.setColor(c);
        // 颜色填充像素
        g.fillRect(0, 0, 100, 50);

        // 定义验证码字符数组
        char[] ch = "ABCDEFGHIJKLMNPQRSTUVWXYZ0123456798".toCharArray();
        Random r = new Random();
        int len = ch.length;
        int index;
        StringBuffer sb = new StringBuffer();
        // 取出四个数字
        for (int i = 0; i < 4; i++) {
            // 循环四次随机取长度定义为索引
            index = r.nextInt(len);
            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt(255)));
            Font font = new Font("Times New Roman", Font.ITALIC, 18);
            g.setFont(font);
            g.drawString(ch[index] + "", (i * 18) + 10, 30);
            sb.append(ch[index]);
        }
        //放入Session中
        request.getSession().setAttribute("piccode", sb.toString());
        try {
            ImageIO.write(bi, "JPG", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	@RequestMapping("/registerpage")
	public String registerpage() {
		return "register";
	}
	
	@RequestMapping("/checkAuthor")
	public String checkAuthor() {
		return "edit/checkAuthor";
	}
	
	@RequestMapping("/{category}")
	public ModelAndView category(@PathVariable("category") String category,@RequestParam("page") int page) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("category");
		PagingInput pi=new PagingInput();
		pi.setType(1);
		pi.setParam(category);
		System.out.println(page);
		if(page==0) {
			page=1;
		}	
		pi.setPage(page);
		mv.addObject("result",bookService.categorybook(pi));
		return mv;
	}
	
	
	@RequestMapping("/search")
	public ModelAndView search(PagingInput pi) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("search");
		if (pi.getPage()==0) {
			pi.setPage(1);
		}
		PagingOutput po=bookService.searchcategorybook(pi);
		po.setPage(pi.getPage());
		po.setAllpage((int)Math.ceil((double)po.getAll()/10.0));
		if (po.getAllpage()==0) {
			po.setAllpage(1);
		}
		mv.addObject("param", pi);
		mv.addObject("result", po);
		return mv;
	}
	
	@RequestMapping("/writeInfo")
	public ModelAndView writeInfo(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		if(session.getAttribute("userStatus").equals(1)) {
			mv.setViewName("writer/writeInfo");
			mv.addObject("writeInfo", userService.writeInfo((Long)session.getAttribute("userId")));
		}else {
			mv.setViewName("writer/beauthor");
		}		
		return mv;
	}
	
	@RequestMapping("/beauthor")
	public ModelAndView beauthor(User user,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		user.setId((Long) session.getAttribute("userId"));
		if (userService.beauthor(user)>0) {
			mv.addObject("result", "申请成功");
			session.setAttribute("userStatus", 1);
		}else {
			mv.addObject("result", "申请失败");
		}
		mv.setViewName("redirect:writeInfo");
		return mv;
	}
	
	@RequestMapping("/bookmanager")
	public ModelAndView write(PagingInput pi,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("writer/bookmanager");
		if (pi.getPage()==0) {
			pi.setPage(1);
		}
		pi.setId((Long)session.getAttribute("userId"));
		PagingOutput po=bookService.myBook(pi);
		po.setPage(pi.getPage());
		po.setAllpage((int)Math.ceil((double)po.getAll()/10.0));
		mv.addObject("result",po);
		mv.addObject("param", pi.getParam());
		return mv;
	}
	
	@RequestMapping("/addbookpage")
	public String addbookpage() {
		return "writer/addbook";
	}
	
	@RequestMapping("/bookchapter/{id}")
	public ModelAndView bookchapter(@PathVariable("id") Long id) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("writer/bookchapter");
		mv.addObject("id",id);
		List<BookCatalog> bc=bookService.bookchapter(id);
		mv.addObject("result", bc);
		return mv;
	}
	
	@RequestMapping("/addchapterpage")
	public ModelAndView addchapterpage(@RequestParam("id") Long id) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("writer/addchapter");
		mv.addObject("id", id);
		return mv;
	}
	
	@RequestMapping("/updatechapterpage/{id}")
	public ModelAndView updatechapterpage(@PathVariable("id") Long id,@RequestParam("bookId")Long Bookid) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("writer/updatechapter");
		mv.addObject("bid", Bookid);
		mv.addObject("result", bookService.updateChapterContent(id));
		return mv;
	}
	
	@RequestMapping("/edit")
	public ModelAndView edit(PagingInput pi) {
		ModelAndView mv=new ModelAndView();
		if (pi.getPage()==0) {
			pi.setPage(1);
		}
		PagingOutput po=bookService.booklists(pi);
		po.setAllpage((int)Math.ceil((double)po.getAll()/10.0));
		if (po.getAllpage()==0) {
			po.setAllpage(1);
		}
		mv.addObject("result", po);
		mv.addObject("param", pi.getParam());
		mv.setViewName("edit/bookmanager");
		return mv;
	}
	
	@RequestMapping("/checkbook")
	public ModelAndView checkbook() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("edit/checkBook");
		return mv;
	}
	
	@RequestMapping("/bookInfo/{id}")
	public ModelAndView bookInfo(@PathVariable("id") Long id) {
			ModelAndView mv=new ModelAndView();
			mv.addObject("result", bookService.bookInfo(id));
			mv.setViewName("writer/bookInfo");
			return mv;
		
	}
	
	@RequestMapping("/authorInfo/{id}")
	public ModelAndView authorInfo(@PathVariable("id") Long id) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("result", userService.authorInfo(id));
		mv.setViewName("edit/authorInfo");
		return mv;
	}
	
	@RequestMapping("/admin")
	public ModelAndView admin() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("result", userService.editList());
		mv.setViewName("admin/editmanager");
		return mv;
	}
	
	@RequestMapping("/addEditPage")
	public String addEditPage() {
		return "admin/addedit";
	}
}
