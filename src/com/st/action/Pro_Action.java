package com.st.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.st.bean.Config;
import com.st.bean.layJson;
import com.st.service.Pro_Service;
import com.st.service.imp.FileService;

@Controller
public class Pro_Action {
	@Autowired
	Pro_Service proservice;
	

	@RequestMapping("/checkpro")
	@ResponseBody
	public layJson checkpro(@RequestParam Map params) {
		int count = proservice.getcount(params);
		List list = proservice.checkpro(params);
		layJson ts = new layJson();
		ts.setCount(count);
		ts.setData(list);
		String jsonstr=JSONObject.toJSONString(ts);
		return ts;
	}

//增加
	@RequestMapping("/insertpro")
	@ResponseBody
	public void insertpro(@RequestParam Map params) {
		proservice.insertpro(params);
	}

//删除
	@RequestMapping("/delpro")
	@ResponseBody
	public void delpro(@RequestParam Map params) {
		proservice.delpro(params);
	}

//修改
	@RequestMapping("/uppro")
	@ResponseBody
	public void uppro(@RequestParam Map params) {
		proservice.update(params);
	}

//上架
	@RequestMapping("/shangjia1")
	@ResponseBody
	public void shangjia1(@RequestParam Map params) {
		proservice.shangjia1(params);
	}

//下架
	@RequestMapping("/xiajia1")
	@ResponseBody
	public void xiajia1(@RequestParam Map params) {
		proservice.xiajia1(params);
	}

	
//增加商品
	@RequestMapping("/creatPro")
	public String creatPro(HttpSession session, @RequestParam Map params) {
		// 保存表单数据到pro表
		// 获取商品图片的信息（文件名）保存到product表中
		params.put("state", 1);
		proservice.creatPro(params, session);
		return "product";
	}	
	
	//商品增加跳转
	@RequestMapping("/usertiao3")
	public String text5() {
		return "file";
	}

}
