package com.shuyue.book.pojo;

public class Book {
	private Long id;
	private String bookName;
	private Long bookAuthorId;
	private String bookPic;
	private String newChapterName;
	private Long newChapter;
	private Long bookFollow;
	private String authorName;
	private String authorPic;
	private String bookPath;
	private String bookBrief;
	private String category;
	private int bsId;
	private int status;
	public String getBookBrief() {
		return bookBrief;
	}
	public void setBookBrief(String bookBrief) {
		this.bookBrief = bookBrief;
	}
	public String getBookPath() {
		return bookPath;
	}
	public void setBookPath(String bookPath) {
		this.bookPath = bookPath;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Long getBookAuthorId() {
		return bookAuthorId;
	}
	public void setBookAuthorId(Long bookAuthorId) {
		this.bookAuthorId = bookAuthorId;
	}
	public String getBookPic() {
		return bookPic;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", bookName=" + bookName + ", bookAuthorId=" + bookAuthorId + ", bookPic=" + bookPic
				+ ", bookFollow=" + bookFollow + "]";
	}
	public void setBookPic(String bookPic) {
		this.bookPic = bookPic;
	}
	public Long getBookFollow() {
		return bookFollow;
	}
	public void setBookFollow(Long bookFollow) {
		this.bookFollow = bookFollow;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAuthorPic() {
		return authorPic;
	}
	public void setAuthorPic(String authorPic) {
		this.authorPic = authorPic;
	}
	public Long getNewChapter() {
		return newChapter;
	}
	public void setNewChapter(Long newChapter) {
		this.newChapter = newChapter;
	}
	public String getNewChapterName() {
		return newChapterName;
	}
	public void setNewChapterName(String newChapterName) {
		this.newChapterName = newChapterName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getBsId() {
		return bsId;
	}
	public void setBsId(int bsId) {
		this.bsId = bsId;
	}
	
}

