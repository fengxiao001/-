package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.st.bean.Pro;

@Repository("ProDao")
public interface IPro_Dao {
	//页码
	int getcount1(Map params); 
//查询
	List checkpro(Map params);

//增加
	void insertpro(Map params);

// 删除
	void dlepro(Map params);

//修改
	void update(Map params);

//上架
	void shangjia1(Map params);

//下架 
	void xiajia1(Map params);
	
	void creatPro(Map params);
	/* void saveimg(Map params); */
	
}
