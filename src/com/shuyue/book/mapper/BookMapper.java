package com.shuyue.book.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.shuyue.book.pojo.Book;
import com.shuyue.book.pojo.BookCatalog;
import com.shuyue.book.pojo.BookChapter;
import com.shuyue.book.pojo.Check;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.PagingOutput;
import com.shuyue.book.pojo.Readed;
import com.shuyue.book.pojo.User;

@Repository
public interface BookMapper {
	//首页推荐书籍
	List<Book> recommendbook();
	//按分类查找书籍总数
	int count(PagingInput pagingInput);
	//按分类查找书籍
	List<Book> categorybook(PagingInput pagingInput);
	//搜索
	List<Book> searchcategorybook(PagingInput pi);
	//搜索总数
	int searchcategorybookcount(PagingInput pi);
	//书籍名查询书籍
	List<Book> searchbookbyname(PagingInput pagingInput);
	//书籍信息
	Book bookinfo(Long id);
	//简单书籍信息
	Book bookInfo(Long id);
	//书籍章节总数
	int chaptercount(Long id);
	//书籍目录
	List<BookCatalog> bookCatalogs(PagingInput pagingInput);
	//获取章节信息
	BookChapter bookChapter(Long id);
	//获取上下章节
	BookCatalog npChapter(BookCatalog bookCatalog);
	//创建书籍
	int addBook(Book book);
	//删除书籍
	int delBook(Long id);
	//修改书籍
	int updateBook(Book book);
	//创建章节
	int addChapter(BookChapter bookChapter);
	//删除章节
	int delChpater(Long id);
	//修改章节
	int updateChpater(BookChapter bookChapter);
	//获取书籍地址
	String bookPath(Long id);
	
	String bookpath(Long id);
	//作者作品
	List<Book> authorBook(Long id);
	//我的作品
	List<Book> myBook(PagingInput pi);
	//我的作品
	int myBookcount(PagingInput pi);
	//最新章节
	BookCatalog newChapter(Long id);
	//书籍章节
	List<BookCatalog> bookchapter(Long id);
	//审核书籍
	int checkBook(Check check);
	//审核章节
	int checkChapter(Check check);
	//查询阅读记录是否存在
	int findReaded(Readed readed);
	//更新阅读记录
	int updateReaded(Readed readed);
	//添加阅读记录
	int addReaded(Readed readed);
	//获取阅读记录
	List<Book> readed(Long id);
	//获取书架
	List<Book> bookShelf(Long id);
	//更新书架
	int updateBookShelf(Check check);
	//获取书籍列表
	List<Book> booklists(PagingInput pi);
	//获取书籍列表总数
	int booklistscount(PagingInput pi);
	//获取未审核书籍
	List<Book> unCheckBook();
	//推荐、
	int starbook(Check check);
	//审核
	int check(Check check);
	//书籍封面
	int updatepic(Book book);
	//
	int delshelf(Check check);
	
	
}
