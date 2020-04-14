package com.st.service.imp;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.Config;
import com.st.dao.IPro_Dao;
import com.st.service.Pro_Service;
import com.st.util.Page;

@Service("proservice")
public class Proservice implements Pro_Service {
	@Autowired
	IPro_Dao prodao;

//查询
	@Override
	public List checkpro(Map params) {
		Page.pageParams(params);
		List list = prodao.checkpro(params);
		return list;
	}

//增加
	@Override
	public void insertpro(Map params) {
		// TODO Auto-generated method stub
		prodao.insertpro(params);
	}

	@Override
	public void delpro(Map params) {
		// TODO Auto-generated method stub
		prodao.dlepro(params);

	}

	@Override
	public void update(Map params) {
		// TODO Auto-generated method stub
		prodao.update(params);

	}

	@Override
	public void shangjia1(Map params) {
		// TODO Auto-generated method stub
		prodao.shangjia1(params);

	}

	@Override
	public void xiajia1(Map params) {
		// TODO Auto-generated method stub
		prodao.xiajia1(params);

	}

	@Override
	public int getcount(Map params) {
		// TODO Auto-generated method
		int count = prodao.getcount1(params);
		return count;
	}

	
	/**
	 * 新增商品信息
	 */
	@Override
	public void creatPro(Map params,HttpSession session) {
		String uuid=UUID.randomUUID().toString();
		params.put("uuid", uuid);
		//id 商品名 价格 类目 库存
		// TODO Auto-generated method stub
		//保存表单数据到pro表
		
		//获取商品图片的信息（文件名）保存到product表中
		List imglist=(List)session.getAttribute(Config.GOODS_UP_LIST_KEY);
		if(imglist!=null&&imglist.size()>0) {
			for(int i=0;i<imglist.size();i++) {
				//保存每一条图片信息
			 params.put("imgname", imglist.get(i));
			 prodao.creatPro(params);
				/* prodao.saveimg(params); */
			}
		}
		//清空session中文件名list---不要被垃圾图片处理给处理掉已经正确的文件
		session.removeAttribute(Config.GOODS_UP_LIST_KEY);
	}
}
