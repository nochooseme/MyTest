package com.shuyue.book.service;

import java.util.List;

import com.shuyue.book.pojo.Book;
import com.shuyue.book.pojo.BookCatalog;
import com.shuyue.book.pojo.BookChapter;
import com.shuyue.book.pojo.ChapterContent;
import com.shuyue.book.pojo.Check;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.PagingOutput;
import com.shuyue.book.pojo.Readed;

public interface BookService {
	//首页推荐书籍
	List<Book> recommendbook();
	//按分类查找书籍
	PagingOutput categorybook(PagingInput pagingInput);
	//搜索
	PagingOutput searchcategorybook(PagingInput pi);
	//书籍名查询书籍
	PagingOutput searchbookbyname(PagingInput pagingInput);
	//获取书籍信息
	Book bookinfo(Long id);
	//简单书籍信息
	Book bookInfo(Long id);
	//获取书籍目录
	PagingOutput bookcatalog(PagingInput pagingInput);
	//获取章节内容
	ChapterContent chapterContent(Long id);
	//编辑时获取章节内容
	ChapterContent updateChapterContent(Long id);
	//获取上下章节
	BookCatalog npChpater(BookCatalog bookCatalog);
	//创建书籍
	int addBook(Book book);
	//删除书籍
	int delBook(Long id);
	//修改书籍
	int updateBook(Book book);
	//创建章节
	int addChapter(ChapterContent chapterContent);
	//删除章节
	int delChpater(Long id);
	//修改章节
	int updateChpater(ChapterContent chapterContent);
	//作者作品
	List<Book> authorBook(Long id);
	//我的作品
	PagingOutput myBook(PagingInput pi);
	//书籍章节
	List<BookCatalog> bookchapter(Long id);
	//审核书籍
	int checkBook(Check check);
	//审核章节
	int checkChapter(Check check);
	//添加阅读记录
	int addReaded(Readed readed);
	//添加阅读记录
	int addbookReaded(Readed readed);
	//获取阅读记录
	List<Book> readed(Long id);
	//获取书架
	List<Book> bookShelf(Long id);
	//添加书架
	int addBookShelf(Readed readed);
	//修改书架
	int updateBookShelf(Check check);
	//获取书籍列表
	PagingOutput booklists(PagingInput pi);
	//推荐
	int starbook(Check check);
	//书籍封面
	int updatepic(Book book);
	//
	int delshelf(Check check);
}
