package com.shuyue.book.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.List;

import org.eclipse.jdt.internal.compiler.parser.diagnose.DiagnoseParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookMapper;
	@Override
	public List<Book> recommendbook() {
		return bookMapper.recommendbook();
	}
	@Override
	public PagingOutput categorybook(PagingInput pagingInput) {
		PagingOutput po=new PagingOutput();
		po.setPage(pagingInput.getPage());
		po.setSelectresult(bookMapper.categorybook(pagingInput));
		po.setAll(bookMapper.count(pagingInput));
		po.setParam(pagingInput.getParam());
		return po;
	}
	@Override
	public PagingOutput searchbookbyname(PagingInput pagingInput) {
		PagingOutput po=new PagingOutput();
		po.setPage(pagingInput.getPage());
		po.setAll(bookMapper.count(pagingInput));
		po.setSelectresult(bookMapper.searchbookbyname(pagingInput));
		return po;
	}
	@Override
	public Book bookinfo(Long id) {
		return bookMapper.bookinfo(id);
	}
	@Override
	public PagingOutput bookcatalog(PagingInput pi) {
		PagingOutput po=new PagingOutput();
		po.setAll(bookMapper.chaptercount(Long.parseLong(pi.getParam())));
		if (po.getAll()!=0) {
			po.setSelectresult(bookMapper.bookCatalogs(pi));
		}
		
		return po;
	}
	@Override
	public ChapterContent chapterContent(Long id) {
		String content="";
		BookChapter bookChapter=bookMapper.bookChapter(id);
		Long start=bookChapter.getChapterStart();
		Long rows=bookChapter.getChapterRows();
		try { 
            String pathname = bookChapter.getBookPath();
            System.out.println(pathname);
            File filename = new File(pathname); 
            InputStreamReader reader = new InputStreamReader(  
                    new FileInputStream(filename)); 
            BufferedReader br = new BufferedReader(reader); 
            String line = "";  
            Long i=1l;
            while ((line = br.readLine()) != null) {
            	if(i>start+rows-1) {break;}
            	if (i>=start){
            		content+="<p>"+line+"</p>";
            	}
            	i++;
            	}
            reader.close();   
            

        } catch (Exception e) {  
            e.printStackTrace();  
        }
		ChapterContent chapterContent=new ChapterContent();
		chapterContent.setId(bookChapter.getId());
		chapterContent.setBookId(bookChapter.getBookId());
		chapterContent.setChapterName(bookChapter.getChapterName());
		chapterContent.setContent(content.replaceAll(" ", "&nbsp;"));
		return chapterContent;
	}
	@Override
	public BookCatalog npChpater(BookCatalog bookCatalog) {
		return bookMapper.npChapter(bookCatalog);
	}
	@Override
	public int addBook(Book book) {
		try {
			String filename="D:/book/"+book.getBookName()+String.valueOf(System.currentTimeMillis())+".txt";
			File writename = new File(filename) ;   
	        writename.createNewFile(); 
	        book.setBookPath(filename);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookMapper.addBook(book);
	}
	@Override
	public int delBook(Long id) {
		return bookMapper.delBook(id);
	}
	@Override
	public int updateBook(Book book) {
		return bookMapper.updateBook(book);
	}
	@Override
	public int addChapter(ChapterContent chapterContent) {
		try {
			String bookPath=bookMapper.bookPath(chapterContent.getBookId());
			File writename = new File(bookPath);
			InputStreamReader reader = new InputStreamReader(  
                    new FileInputStream(bookPath)); 
            BufferedReader br = new BufferedReader(reader); 
            String line = "";  
            Long i=0l;
            while ((line = br.readLine()) != null) {
            	i++;
            	}
            System.out.println(i); 
	        BufferedWriter out = new BufferedWriter(new FileWriter(writename,true));  
	        String content=chapterContent.getContent().replaceAll("\n", "\r\n");
	        out.write(chapterContent.getChapterName()+"\r\n"+content+"\r\n");
	        System.out.println(chapterContent.getChapterName()+"\r\n"+content+"\r\n");
	        out.flush();  
	        out.close(); 
            Long rows=0l;
            while ((line = br.readLine()) != null) {
            	rows++;
            	}
	        reader.close();
	        BookChapter bookChapter=new BookChapter();
	        bookChapter.setBookId(chapterContent.getBookId());
	        bookChapter.setChapterName(chapterContent.getChapterName());
	        bookChapter.setChapterStart(i+2);
	        bookChapter.setChapterRows(rows-1);
	        
	        System.out.println(i+","+rows);
	        return bookMapper.addChapter(bookChapter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
         
        return 0;
	}
	@Override
	public int delChpater(Long id) {
		return bookMapper.delChpater(id);
	}
	@Override
	public int updateChpater(ChapterContent chapterContent) {
		try {
			String bookPath=bookMapper.bookpath(chapterContent.getId());
			File writename = new File(bookPath);
			InputStreamReader reader = new InputStreamReader(  
                    new FileInputStream(bookPath)); 
            BufferedReader br = new BufferedReader(reader); 
            String line = "";  
            Long i=0l;
            while ((line = br.readLine()) != null) {
            	i++;
            	}
            System.out.println(i); 
	        BufferedWriter out = new BufferedWriter(new FileWriter(writename,true));  
	        String content=chapterContent.getContent().replaceAll("\n", "\r\n");
	        out.write(chapterContent.getChapterName()+"\r\n"+content+"\r\n");  
	        out.flush();  
	        out.close(); 
            Long rows=0l;
            while ((line = br.readLine()) != null) {
            	rows++;
            	}
	        reader.close();
	        BookChapter bookChapter=new BookChapter();
	        bookChapter.setId(chapterContent.getId());
	        bookChapter.setBookId(chapterContent.getBookId());
	        bookChapter.setChapterName(chapterContent.getChapterName());
	        bookChapter.setChapterStart(i+2);
	        bookChapter.setChapterRows(rows-1);
	        
	        System.out.println(i+","+rows);
	        return bookMapper.updateChpater(bookChapter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
         
        return 0;
	}
	@Override
	public List<Book> authorBook(Long id) {
		return bookMapper.authorBook(id);
	}
	@Override
	public PagingOutput myBook(PagingInput pi) {
		PagingOutput po=new PagingOutput();
		po.setSelectresult(bookMapper.myBook(pi));
		po.setAll(bookMapper.myBookcount(pi));
		return po;
	}
	@Override
	public List<BookCatalog> bookchapter(Long id) {
		return bookMapper.bookchapter(id);
	}
	@Override
	public ChapterContent updateChapterContent(Long id) {
		String content="";
		BookChapter bookChapter=bookMapper.bookChapter(id);
		Long start=bookChapter.getChapterStart();
		Long rows=bookChapter.getChapterRows();
		try { 
            String pathname = bookChapter.getBookPath();
            System.out.println(pathname);
            File filename = new File(pathname); 
            InputStreamReader reader = new InputStreamReader(  
                    new FileInputStream(filename)); 
            BufferedReader br = new BufferedReader(reader); 
            String line = "";  
            Long i=1l;
            while ((line = br.readLine()) != null) {
            	if(i>start+rows-1) {break;}
            	if (i>=start){
            		if (line.trim().equals("")) {
						
					}else {
						content+=(line+"\n");
					}
            		
            	}
            	i++;
            	}
            System.out.println(content);
            reader.close();   
            

        } catch (Exception e) {  
            e.printStackTrace();  
        }
		ChapterContent chapterContent=new ChapterContent();
		chapterContent.setId(bookChapter.getId());
		chapterContent.setChapterName(bookChapter.getChapterName());
		chapterContent.setContent(content);
		return chapterContent;
	}
	@Override
	public int checkBook(Check check) {
		return bookMapper.checkBook(check);
	}
	@Override
	public int checkChapter(Check check) {
		return bookMapper.checkChapter(check);
	}
	@Override
	public int addReaded(Readed readed) {
		
		if (bookMapper.findReaded(readed)==0) {
			return bookMapper.addReaded(readed);
		}
		return bookMapper.updateReaded(readed);
	}
	@Override
	public int addbookReaded(Readed readed) {
		if (bookMapper.findReaded(readed)==0) {
			return bookMapper.addReaded(readed);
		}
		return 1;
	}
	@Override
	public List<Book> readed(Long id) {
		return bookMapper.readed(id);
	}
	@Override
	public List<Book> bookShelf(Long id) {
		return bookMapper.bookShelf(id);
	}
	@Override
	public PagingOutput booklists(PagingInput pi) {
		PagingOutput po=new PagingOutput();
		po.setAll(bookMapper.booklistscount(pi));
		po.setSelectresult(bookMapper.booklists(pi));
		po.setPage(pi.getPage());
		return po;
	}
	@Override
	public int addBookShelf(Readed readed) {
		return 0;
	}
	@Override
	public int updateBookShelf(Check check) {
		Readed readed=new Readed();
		readed.setbId(check.getId());
		readed.setuId(check.getuId());
		readed.setStatus(1);
		if (bookMapper.findReaded(readed)==0) {
			return bookMapper.addReaded(readed);
		}
		return bookMapper.updateBookShelf(check);
	}
	@Override
	public Book bookInfo(Long id) {
		return bookMapper.bookInfo(id);
	}
	@Override
	public int starbook(Check check) {
		return bookMapper.starbook(check);
	}
	@Override
	public PagingOutput searchcategorybook(PagingInput pi) {
		PagingOutput po=new PagingOutput();
		po.setSelectresult(bookMapper.searchcategorybook(pi));
		po.setAll(bookMapper.searchcategorybookcount(pi));	
		return po;
	}
	@Override
	public int updatepic(Book book) {
		return bookMapper.updatepic(book);
	}
	@Override
	public int delshelf(Check check) {
		return bookMapper.delshelf(check);
	}
	


}
