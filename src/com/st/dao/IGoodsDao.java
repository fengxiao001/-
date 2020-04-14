package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.st.bean.Goods;
import com.st.bean.User;
@Repository("GoodsDao")
public interface IGoodsDao {
//定义接口
	//增加
	void addGoods(Goods goods);
	//删除
	void deleteGoods(Goods goods);
	//修改
	void updataGoods(Map params);
	//查询
	List checkGoods(Map params);
	
	int getcount(Map params); 
	//商品上架
	void shangjia(Map params);
	//商品下架
	void xiajia(Map params);
	
	List findAll();
	
}
