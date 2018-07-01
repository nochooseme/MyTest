package com.shuyue.book.pojo;

import javax.validation.constraints.Size;

public class NewPassword {
	private Long id;	
	private String oldpassword;
	@Size(min=5, max=20, message="密码长度必须在5-20之间")
	private String newpassword;
	
	private String newpassword1;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOldpassword() {
		return oldpassword;
	}
	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String getNewpassword1() {
		return newpassword1;
	}
	public void setNewpassword1(String newpassword1) {
		this.newpassword1 = newpassword1;
	}
}
