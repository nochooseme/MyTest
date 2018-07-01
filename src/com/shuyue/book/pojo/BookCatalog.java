package com.shuyue.book.pojo;

public class BookCatalog {
	private long id;
	private long bookId;
	private String chapterName;
	private int status;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getBookId() {
		return bookId;
	}
	public void setBookId(long bookId) {
		this.bookId = bookId;
	}
	@Override
	public String toString() {
		return "BookCatalog [id=" + id + ", bookId=" + bookId + ", chapterName=" + chapterName + ", status=" + status
				+ "]";
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
