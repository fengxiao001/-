package com.st.service.imp;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.st.bean.User;
import com.st.bean.UserLogin;
import com.st.dao.UserDao;
import com.st.service.IUserService;

//@Service("userService")

public class Userservice implements IUserService {
	@Autowired
	UserDao userDao;
	@Override
	public void addUser(UserLogin user) {
		// TODO Auto-generated method stub
		String uuid=UUID.randomUUID().toString();
		//缺一个东西
		userDao.addUser(user);
		
	}
	@Override
	public void deleteUser(UserLogin user) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteUser(String userid) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateUser(Map params) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<User> getAllUser() {
		System.out.println("----实现类");
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<User> getUser(UserLogin user) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<User> getUser(String checkinfo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<User> getUser(Map params) {
		// TODO Auto-generated method stub
		params.put("checktext", "赵");
		return userDao.checkUser(params);
	}
	@Override
	public int getCount(Map params) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void fenghao(Map params) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void jiefeng(Map params) {
		// TODO Auto-generated method stub
		
	}

	
}
