package com.shuyue.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shuyue.book.mapper.UserMapper;
import com.shuyue.book.pojo.NewPassword;
import com.shuyue.book.pojo.PagingInput;
import com.shuyue.book.pojo.PagingOutput;
import com.shuyue.book.pojo.User;
import com.shuyue.book.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper usermapper;
	@Override
	public int register(User user) {
		if(usermapper.findname(user.getName())>0) {
			return 0;
		}
		if(usermapper.register(user)>0) {
			return 1;
		}
		return 2;
	}

	@Override
	public User login(User user) {
		User resultuser=usermapper.login(user);
		if (resultuser.getId()==0) {
			return null;
		}
		if(resultuser.getPassword().equals(user.getPassword())) {
			return resultuser;
		}
		return null;
		
	}

	@Override
	public User userInfo(Long id) {
		return usermapper.userInfo(id);
	}

	@Override
	public User userinfo(Long id) {
		return usermapper.userinfo(id);
	}

	@Override
	public PagingOutput authorList(PagingInput pi) {
		PagingOutput po=new PagingOutput();
		po.setSelectresult(usermapper.authorList(pi));
		po.setAll(usermapper.authorCount(pi));
		
		return po;
	}

	@Override
	public User authorInfo(Long id) {
		return usermapper.authorInfo(id);
	}

	@Override
	public int updarteauthorlevel(User user) {
		return usermapper.updateauthorlevel(user);
	}

	@Override
	public List<User> editList() {
		return usermapper.editList();
	}

	@Override
	public int addEdit(Long id) {
		return usermapper.addEdit(id);
	}

	@Override
	public int delEdit(Long id) {
		return usermapper.delEdit(id);
	}

	@Override
	public List<User> searchuser(User user) {
		return usermapper.searchuser(user);
	}

	@Override
	public User writeInfo(Long id) {
		return usermapper.writeInfo(id);
	}

	@Override
	public PagingOutput searchUser(PagingInput pi) {
		PagingOutput po=new PagingOutput();
		po.setSelectresult(usermapper.searchUser(pi));
		po.setAll(usermapper.searchUsercount(pi));
		return po;
	}

	@Override
	public User user(Long id) {
		return usermapper.user(id);
	}

	@Override
	public int adminupdateuser(User user) {
		return usermapper.adminupdateuser(user);
	}

	@Override
	public int resetpsw(Long id) {
		return usermapper.resetpsw(id);
	}

	@Override
	public int updateUser(User user) {
		return usermapper.updateUser(user);
	}

	@Override
	public int beauthor(User user) {
		return usermapper.beauthor(user)*usermapper.upauthor(user.getId());
	}

	@Override
	public int updatepic(User user) {
		return usermapper.updatepic(user);
	}

	@Override
	public int updatepassword(NewPassword newPassword) {
		if (usermapper.getpassword(newPassword.getId()).equals(newPassword.getOldpassword())) {
			return usermapper.updatepassword(newPassword);
		}
		return 2;
	}

}
