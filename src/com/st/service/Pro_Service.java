package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface Pro_Service {
	//页码
	
	  int getcount(Map params);
//查
	List checkpro(Map params);

//增加
	void insertpro(Map params);

//删除
	void delpro(Map params);

//修改
	void update(Map params);

//上架
	void shangjia1(Map params);

//下架
	void xiajia1(Map params);
	
	//上传
	void creatPro(Map params,HttpSession session);
	

	
}
