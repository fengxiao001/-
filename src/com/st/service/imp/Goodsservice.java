package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.Goods;
import com.st.bean.User;
import com.st.dao.IGoodsDao;
import com.st.service.IGoodsservice;
import com.st.util.Page;

@Service("Goodsservice")
public class Goodsservice implements IGoodsservice {
	@Autowired
	IGoodsDao GoodsDao;
	@Override
	public void addGoods(Goods goods) {
		GoodsDao.addGoods(goods);
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteGoods(Goods goods) {
		// TODO Auto-generated method stub
		GoodsDao.deleteGoods(goods);

	}

	@Override
	public List checkGoods(Map params) {
		// 将封装好的map传入给Dao执行查询并返回list
		Page.pageParams(params);
		List list = GoodsDao.checkGoods(params);
		return list;
		
	}

	@Override
	public void updatagoods(Map params) {
		GoodsDao.updataGoods(params);

	}

	@Override
	public int getCount(Map params) {
		int count =GoodsDao.getcount(params);
		return count;
	}

	@Override
	public void shangjia(Map params) {
		// TODO Auto-generated method stub
		GoodsDao.shangjia(params);
		
	}

	@Override
	public void xiajia(Map params) {
		// TODO Auto-generated method stub
		GoodsDao.xiajia(params);
		
	}

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return GoodsDao.findAll();
	}

	/*
	 * @Override public int getcount(Map params) { // TODO Auto-generated method
	 * stub return 0; }
	 */
}
