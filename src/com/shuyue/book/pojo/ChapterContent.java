package com.shuyue.book.pojo;

public class ChapterContent {
	private Long id;
	private Long bookId;
	private String chapterName;
	private String content;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getBookId() {
		return bookId;
	}
	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}
	@Override
	public String toString() {
		return "ChapterContent [id=" + id + ", bookId=" + bookId + ", chapterName=" + chapterName + ", content="
				+ content + "]";
	}
	
}
