package com.shuyue.book.pojo;

import java.sql.Timestamp;

public class Readed {
	private Long id;
	private Long uId;
	private Long bcId;
	private Long bId;
	private int status;
	private Timestamp readTime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getuId() {
		return uId;
	}
	public void setuId(Long uId) {
		this.uId = uId;
	}
	public Long getBcId() {
		return bcId;
	}
	public void setBcId(Long bcId) {
		this.bcId = bcId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Long getbId() {
		return bId;
	}
	public void setbId(Long bId) {
		this.bId = bId;
	}
	@Override
	public String toString() {
		return "Readed [id=" + id + ", uId=" + uId + ", bcId=" + bcId + ", bId=" + bId + ", status=" + status + "]";
	}
	public Timestamp getReadTime() {
		return readTime;
	}
	public void setReadTime(Timestamp readTime) {
		this.readTime = readTime;
	}
	
}
