package com.shuyue.book.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.shuyue.book.pojo.NewPassword;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.User;
@Repository
public interface UserMapper {
	//注册时账号是否存在
	int findname(String name);
	//注册用户
	int register(User user);
	//登录
	User login(User user);
	//获取用户信息
	User userInfo(Long id);
	//个人中心
	User userinfo(Long id);
	//修改用户信息
	int updateUser(User user);
	
	//
	int adminupdateuser(User user);
	//修改密码
	int updatePassword(User user);
	//
	int resetpsw(Long id);
	//修改状态
	int updateStatus(User user);
	//获取作者列表
	List<User> authorList(PagingInput pi);
	//获取作者总数
	int authorCount(PagingInput pi);
	//作者信息
	User authorInfo(long id);
	//修改作者等级
	int updateauthorlevel(User user);
	//编辑列表
	List<User> editList();
	//新增编辑
	int addEdit(Long id);
	//删除编辑
	int delEdit(Long id);
	//用户列表
	List<User> searchuser(User user);
	//搜索用户列表
	List<User> searchUser(PagingInput pi);
	//用户总数
	int searchUsercount(PagingInput pi);
	//作者信息
	User writeInfo(Long id);
	//
	User user(Long id);
	//
	int beauthor(User user);
	
	//
	int upauthor(Long id);
	//
	int updatepic(User user);
	//
	String getpassword(Long id);
	int updatepassword(NewPassword newPassword);
}
