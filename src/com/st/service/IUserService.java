package com.st.service;

import java.util.List;
import java.util.Map;

import com.st.bean.User;
import com.st.bean.UserLogin;

public interface IUserService {
	int getCount(Map params);

//在接口中定义好需要完成的事情（方法）
	// 增删改查
	// 增
	void addUser(UserLogin user);

	// 删
	void deleteUser(UserLogin user);

	void deleteUser(String userid);

	// 改
	void updateUser(Map params);

	// 查询
	// 1、所有用户都查询出来
	List<User> getAllUser();

	// 2、查询某一个单独的属性
	List<User> getUser(UserLogin user);

	// 3、匹配所有字段是否类似传入的值
	List<User> getUser(String checkinfo);

	// 4、匹配内容
	List<User> getUser(Map params);
	
	void fenghao(Map params);
	
	void jiefeng(Map params);


}
