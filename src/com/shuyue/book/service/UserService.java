package com.shuyue.book.service;

import java.util.List;

import com.shuyue.book.pojo.NewPassword;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.PagingOutput;
import com.shuyue.book.pojo.User;

public interface UserService {
	//注册
	int register(User user);
	//登录
	User login(User user);
	//用户信息
	User userInfo(Long id);
	//个人中心
	User userinfo(Long id);
	//作者列表
	PagingOutput authorList(PagingInput pi);
	//作者信息
	User authorInfo(Long id);
	
	int updateUser(User user);
	//
	int adminupdateuser(User user);
	//修改作者等级
	int updarteauthorlevel(User user);
	//编辑列表
	List<User> editList();
	//新增编辑
	int addEdit(Long id);
	//删除编辑
	int delEdit(Long id);
	//用户列表
	List<User> searchuser(User user);
	//搜索用户
	PagingOutput searchUser(PagingInput pi);
	//作者信息
	User writeInfo(Long id);
	//
	User user(Long id);
	//
	int resetpsw(Long id);
	//
	int beauthor(User user);
	int updatepic(User user);
	int updatepassword(NewPassword newPassword);
}
