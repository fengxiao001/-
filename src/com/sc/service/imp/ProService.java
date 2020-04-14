package com.sc.service.imp;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.bean.GouWuChe;

import com.sc.dao.IProd;
import com.sc.service.IProService;
import com.st.bean.UserLogin;
@Service("prod")
public class ProService implements IProService {
	@Autowired
	IProd prod;
	
	@Override
	public List checkname() {
	List list=prod.checkname();
	return list;
	}

	@Override
	public List checkclas() {
		// TODO Auto-generated method stub
		List list=prod.checkclas();
		return list;
	}

	@Override
	public List checkphone(Map params) {
		// TODO Auto-generated method stub
		String start=(int)Math.ceil(Integer.parseInt(params.get("nowpage")+"")*Integer.parseInt(params.get("pagesize")+""))+"";
		String end=(int)Math.ceil(Integer.parseInt(start)+Integer.parseInt(params.get("pagesize")+""))+"";
		params.put("start", start);
		params.put("end", end);
		List list=prod.checkphone(params);
		return list;
	}

	@Override
	public String checkcount(Map params) {
	String count=prod.checkcount(params);
		return count;
	}

	@Override
	public void insertgouwu(Map params) {
		// TODO Auto-generated method stub
		prod.insertgouwu(params);
		
	}

	@Override
	public void jian(Map params) {
		// TODO Auto-generated method stub
		prod.jian(params);
		
	}

	@Override
	public void jia(Map params) {
		// TODO Auto-generated method stub
		prod.jia(params);
		
	}

	@Override
	public void addDizhi(Map params) {
		// TODO Auto-generated method stub
		prod.addDizhi(params);
		
	}

	
}
