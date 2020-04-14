package com.st.service.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.User;
import com.st.bean.UserLogin;
import com.st.dao.UserDao;
import com.st.service.IUserService;
import com.st.util.Page;

@Service("userService")

public class User_service implements IUserService {
	@Autowired
	UserDao userDao;

	@Override
	public List<User> getUser(String checkinfo) {
		// 将参数封装成Map形式，传给下一步
		Map map = new HashMap();
		map.put("checktest", checkinfo);
		// 将封装好的map传入给Dao执行查询并返回list
		List list = userDao.getUser(map);
		return list;
	}

	@Override
	public List<User> getUser(Map params) {
		// 将封装好的map传入给Dao执行查询并返回list
		Page.pageParams(params);
		List list = userDao.getUser(params);
		return list;
	}

	/**
	 * 查询总共的数据条数
	 */
	@Override
	public int getCount(Map params) {
		int count = userDao.getCount(params);
		return count;
	}

	@Override
	public void addUser(UserLogin user) {
		userDao.addUser(user);

	}

	@Override
	public void deleteUser(UserLogin user) {
		userDao.deleteUser(user);
	}

	@Override
	public void deleteUser(String userid) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUser(Map params) {
		// TODO Auto-generated method stub
		userDao.updateUser(params);

	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUser(UserLogin user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void fenghao(Map params) {
		// TODO Auto-generated method stub
		userDao.fenghao(params);
		
	}

	@Override
	public void jiefeng(Map params) {
		// TODO Auto-generated method stub
		userDao.jiefeng(params);
	}



	/**
	 * 查询总共的数据条数
	 */
	/*
	 * @Override public int getCount(Map params) { // TODO Auto-generated method
	 * stub int count=userDao.getCount(params); return 0; }
	 */

}
