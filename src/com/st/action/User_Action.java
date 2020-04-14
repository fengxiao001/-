package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.st.bean.User;
import com.st.bean.UserLogin;
import com.st.bean.layJson;
import com.st.service.IUserService;

@Controller
public class User_Action {
	@Autowired
	IUserService userservice;
	
	
	
	@RequestMapping("/tiao")
	public String text5() {
		return "promessage";
	}
	
	//商品表跳转
	@RequestMapping("/usertiao2")
	public String text4(HttpSession session) {
		return "product";
	}
	
	@RequestMapping("/goodstiao")
	public String text3() {
		return "goodstable";
	}

	@RequestMapping("/usertiao1")
	public String text2() {
		return "table";
	}

	@RequestMapping("/usertiao")
	public String text1() {
		return "userlist";
	}

	@RequestMapping("/listuser")
	@ResponseBody
	public layJson Userlist(@RequestParam Map params) {
		// 查询总的数据有多少行
		 int count = userservice.getCount(params); 
		// 需要service实现查询user数据，并且这个方法接收一个string值
		List listuser = userservice.getUser(params);
		// 将数据封装成前台所需要的结构
		layJson ts = new layJson();     
		ts.setCount(count);      
		ts.setData(listuser);    
		String json=JSONObject.toJSONString(ts);	
		return ts;       
	}

	@RequestMapping("/deluser")
	public String DelUser(UserLogin user, ServletRequest requset) {
		String json=JSONObject.toJSONString(user);
		System.out.println(json);
		userservice.deleteUser(user);
		return "userlist";
	}

	@RequestMapping("/updateuser")
	public String updateuser(@RequestParam Map params) {
		userservice.updateUser(params);
		return "userlist";
	}

	@RequestMapping("/insertuser")
	@ResponseBody
	public String insertuser(UserLogin user) {
		userservice.addUser(user);
		return "userlist";
	}

	
	@RequestMapping("/fenghao")
	@ResponseBody
	public void fenghao(@RequestParam Map params) {
		System.out.println(params);
		userservice.fenghao(params);
	}
	
	@RequestMapping("/jiefeng")
	@ResponseBody
	public void jiefeng(@RequestParam Map params) {
		userservice.jiefeng(params);
	}
}
