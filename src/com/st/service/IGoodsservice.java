package com.st.service;

import java.util.List;
import java.util.Map;

import com.st.bean.Goods;
import com.st.bean.User;

public interface IGoodsservice {
	int getCount(Map params);
//在接口中定义好需要完成的事
	//增加
	void addGoods(Goods goods);
	//删除
	void deleteGoods(Goods goods);
	//查询
	List checkGoods(Map params);
	//修改
	void updatagoods(Map params);
	//商品上架
	void shangjia(Map params);
	//商品下架
	void xiajia(Map params);
	List findAll();
}
