package com.shuyue.book.pojo;

import java.util.List;


public class PagingOutput {
	private List<?> selectresult;
	private String param;
	private int page;
	private int all;
	private int allpage;
	public List<?> getSelectresult() {
		return selectresult;
	}
	public void setSelectresult(List<?> selectresult) {
		this.selectresult = selectresult;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getAll() {
		return all;
	}
	public void setAll(int all) {
		this.all = all;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}

	
}
