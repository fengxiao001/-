package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.st.bean.User;
import com.st.bean.UserLogin;

@Repository("userDao")
public interface UserDao {
//1、定义接口方法
	void addUser(UserLogin user);
	
	void deleteUser(UserLogin user);
	
	void updateUser(Map params);
	
	List<User> selectAlluser();
	
	List<User> checkUser(Map params);
	//定义Dao层的业务方法
	List getUser(Map params);
	
	int getCount(Map params);
	
	void fenghao(Map params);
	void jiefeng(Map params);
	
}
