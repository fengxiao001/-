package com.st.dao;

import java.util.List;
import java.util.Map;

import com.st.bean.User;
import com.st.bean.UserLogin;

public interface LoginDao {
	UserLogin getfaceuser(Map params);
	User getuser(Map map);
	void updatepassword(Map params);
	void reg(Map params);
	List checkname(Map params);
	List checkclas();
	List checkpro(Map param);
    List checkgou(Map params);
	List checkcar(Map params);
	//删除购物车
	void deletegou(Integer proid);
	void addorder(Map params);
	List getDizhi(Map params);
	List selectUserorder(Map map);
}
