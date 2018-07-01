package com.shuyue.book.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.shuyue.book.mapper.BookMapper;
import com.shuyue.book.pojo.Book;
import com.shuyue.book.pojo.BookCatalog;
import com.shuyue.book.pojo.BookChapter;
import com.shuyue.book.pojo.ChapterContent;
import com.shuyue.book.pojo.Check;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.PagingOutput;
import com.shuyue.book.pojo.Readed;
import com.shuyue.book.service.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/bookinfo/{id}")
	public ModelAndView bookinfo(@PathVariable("id")String id,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		PagingInput pi=new PagingInput();
		pi.setParam(id);
		pi.setPage(1);
		Book bookinfo=bookService.bookinfo(Long.parseLong(id));
		bookinfo.setBookPic("../"+bookinfo.getBookPic());
		mv.setViewName("bookinfo");
		PagingOutput po=bookService.bookcatalog(pi);
		mv.addObject("bookinfo", bookinfo);
		mv.addObject("bookcatalog",po);
		
		Readed readed=new Readed();
		Date date=new Date();
		Timestamp time=new Timestamp(date.getTime());
		readed.setReadTime(time);
		readed.setbId(Long.parseLong(id));
		readed.setuId((Long)session.getAttribute("userId"));
		System.out.println(readed.toString());
		int addReaded=bookService.addbookReaded(readed);
		
		return mv;
	}
	
	@RequestMapping("/chapter/{id}")
	public ModelAndView chapter(@PathVariable("id")Long id,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		ChapterContent content=bookService.chapterContent(id);
		System.out.println(content.toString());
		mv.addObject("chapterContent", content);
		BookCatalog bc=new BookCatalog();
		bc.setId(id);
		bc.setStatus(-1);
		mv.addObject("pChapter", bookService.npChpater(bc));
		bc.setStatus(1);
		mv.addObject("nChapter", bookService.npChpater(bc));
		mv.setViewName("chapter");
		Readed readed=new Readed();
		Date date=new Date();
		Timestamp time=new Timestamp(date.getTime());
		readed.setReadTime(time);
		readed.setBcId(content.getId());
		readed.setbId(content.getBookId());
		readed.setuId((Long)session.getAttribute("userId"));
		System.out.println(readed.toString());
		int addReaded=bookService.addReaded(readed);
		System.out.println(addReaded);
		return mv;
	}
	
	@RequestMapping("/addbook")
	public ModelAndView addbook(Book book,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		book.setBookAuthorId((Long)session.getAttribute("userId"));
		if (bookService.addBook(book)==0) {
			mv.setViewName("redirect:addbookpage");
			mv.addObject("result", "新建作品失败！");
		}else {
			mv.setViewName("redirect:bookmanager");
		}
		return mv;
	}
	
	@RequestMapping("/ajaxaddbook")
	@ResponseBody
	public JSONObject ajaxaddbook(@RequestBody Book book,HttpSession session) {
		JSONObject json=new JSONObject();
		book.setBookAuthorId((Long)session.getAttribute("userId"));
		if(bookService.addBook(book)>0) {
			json.put("result", "添加作品成功！");
		}else {
			json.put("result", "添加作品失败！");
		}
		return json;
	}
	
	@RequestMapping("updatebook")
	public ModelAndView updatebook(Book book) {
		ModelAndView mv=new ModelAndView();
		if (bookService.updateBook(book)>0) {
			mv.addObject("result", "成功！");
			mv.setViewName("redirect:bookmanager");
		}else {
			mv.addObject("result", "失败！");
			mv.setViewName("redirect:bookInfo/"+book.getId());
		}		
		return mv;
	}
	
	@RequestMapping("/ajaxupdatebook")
	@ResponseBody
	public JSONObject ajaxupdatebook(@RequestBody Book book) {
		JSONObject json=new JSONObject();
		if(bookService.updateBook(book)>0) {
			json.put("result", "修改作品成功！");
		}else {
			json.put("result", "修改作品失败！");
		}
		return json;
	}
	
	@RequestMapping("/addchapter")
	public ModelAndView addchapter(ChapterContent chapterContent) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("chapter", chapterContent);
		if (bookService.addChapter(chapterContent)==0) {
			mv.setViewName("writer/addchapter");
			mv.addObject("result", "新建章节失败！");
		}else {
			
			mv.addObject("result", "新建章节成功！");
			mv.setViewName("writer/addchapter");
		}
		return mv;
	}
	
	@RequestMapping("/updatechapter")
	public ModelAndView updatechapter(ChapterContent chapterContent) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("result", chapterContent);
		if (bookService.updateChpater(chapterContent)==0) {
			mv.setViewName("writer/updatechapter");
			mv.addObject("upresult", "更新章节失败！");
		}else {
			mv.addObject("upresult", "更新章节成功！");
			mv.setViewName("writer/updatechapter");
		}
		return mv;
	}
	
	@RequestMapping("/searchbook")
	public ModelAndView searchbook(PagingInput pi) {
		ModelAndView mv=new ModelAndView();
		if (pi.getPage()==0) {
			pi.setPage(1);
		}
		pi.setType(1);
		PagingOutput po=bookService.booklists(pi);
		po.setAllpage((int)Math.ceil((double)po.getAll()/10.0));
		if (po.getAllpage()==0) {
			po.setAllpage(1);
		}
		mv.addObject("result", po);
		mv.addObject("param", pi.getParam());
		mv.setViewName("edit/bookcheck");
		return mv;
	}
	
	@RequestMapping("/updateBookShelf")
	@ResponseBody
	public JSONObject updateBookShelf(@RequestBody Check check,HttpSession session) {
		JSONObject json=new JSONObject();
		check.setuId((Long)session.getAttribute("userId"));
		if(bookService.updateBookShelf(check)>0) {
			json.put("result", "成功！");
		}else {
			json.put("result", "失败！");
		}
		return json;
	}
	
	
	@RequestMapping("/starbook")
	@ResponseBody
	public JSONObject starbook(@RequestBody Check check) {
		JSONObject json=new JSONObject();
		if(bookService.starbook(check)>0) {
			json.put("result", "成功！");
		}else {
			json.put("result", "失败！");
		}
		return json;
	}
	
	@RequestMapping("/delshelf")
	@ResponseBody
	public JSONObject delshef(@RequestBody Check check) {
		JSONObject json=new JSONObject();
		if(bookService.delshelf(check)>0) {
			json.put("result", "删除成功！");
		}else {
			json.put("result", "删除失败！");
		}
		return json;
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public JSONObject check(@RequestBody Check check) {
		JSONObject json=new JSONObject();
		if(bookService.checkBook(check)>0) {
			json.put("result", "成功！");
		}else {
			json.put("result", "失败！");
		}
		return json;
	}
	
	
	@RequestMapping("/upload")
	@ResponseBody
	public JSONObject upload(HttpServletRequest request) {
		
		MultipartHttpServletRequest mhsr=(MultipartHttpServletRequest) request;
		MultipartFile file=mhsr.getFile("file");
		String id=mhsr.getParameter("id");
		System.out.println(id);
		JSONObject json=new JSONObject();
		String filename=file.getOriginalFilename();
        String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
        String newfilename = String.valueOf(System.currentTimeMillis())+ "." + extensionName;
		File dest=new File("/book/"+newfilename);
		System.out.println(filename+","+extensionName+","+newfilename);
		try {
			file.transferTo(dest);
			Book book=new Book();
			book.setId(Long.valueOf(id));
			book.setBookPic("static/images/book/"+newfilename);
			int a=bookService.updatepic(book);
			if (a>0) {
				json.put("result", "修改封面成功！");
				json.put("newPic", "static/images/book/"+newfilename);
			}else {
				json.put("result", "修改封面失败！");
			}
			
		} catch (IllegalStateException | IOException e) {
			json.put("result", "修改封面失败！");
			e.printStackTrace();
		}
		
		return json;
	}
}
