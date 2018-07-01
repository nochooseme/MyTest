package com.shuyue.book.pojo;

public class BookChapter {
	private Long id;
	private Long bookId;
	private String bookPath;
	private String chapterName;
	private Long chapterStart;
	private Long chapterRows;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getBookId() {
		return bookId;
	}
	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public Long getChapterStart() {
		return chapterStart;
	}
	public void setChapterStart(Long chapterStart) {
		this.chapterStart = chapterStart;
	}
	public Long getChapterRows() {
		return chapterRows;
	}
	public void setChapterRows(Long chapterRows) {
		this.chapterRows = chapterRows;
	}
	public String getBookPath() {
		return bookPath;
	}
	public void setBookPath(String bookPath) {
		this.bookPath = bookPath;
	}
}
