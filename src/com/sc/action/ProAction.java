package com.sc.action;

import java.io.UnsupportedEncodingException;
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
import com.sc.bean.layJson;
import com.sc.service.IProService;
import com.st.bean.UserLogin;


@Controller
public class ProAction {
	@Autowired
	IProService proservice;

	@RequestMapping("checkphone")
	public String checkphone(HttpSession session,@RequestParam Map params,HttpServletRequest request) {
		//查出总数count
		params.put("state", 1);
	   String count = proservice.checkcount(params);
	    String pagesize=10+"";
	    String nowpage;
	    if(params.get("nowpage")==null) {
	    	 nowpage=0+"";
	    }else {
	         nowpage=params.get("nowpage")+"";
	    }
	    String lensize=5+"";
	    String len=(int)Math.ceil(Integer.parseInt(count)/Integer.parseInt(lensize))+"";
	    String page=(int)Math.ceil(Integer.parseInt(count)/Integer.parseInt(pagesize))+"";
	    params.put("page", page);
	    params.put("nowpage", nowpage);
	    params.put("pagesize", pagesize);
	    session.setAttribute("count", count);
	    List list = new ArrayList();
		list = proservice.checkphone(params);
		session.setAttribute("phone",list);
		session.setAttribute("page",page);
		session.setAttribute("proname", params.get("proname")+"");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "liebiao1";
	}
	
	//新增购物车
	@RequestMapping("/insertgouwu")
	@ResponseBody
	public layJson insertgouwu(Map<String, Integer> params,HttpSession session) {
		UserLogin user=new UserLogin();
		user= (UserLogin) session.getAttribute("userlogin");
	    List list=(List)session.getAttribute("checkpro");
	    params=(Map)list.get(0);
	    params.put("faceid", user.getFaceid());
	    System.out.println("新增购物车---"+params);
	    proservice.insertgouwu(params);
	    layJson json=new layJson();
	    json.setData(list);
	    String json1=JSONObject.toJSONString(json);
	    return json;
	}
	
	
	//购物车数量减
	@RequestMapping("/jian_num")
	@ResponseBody
	public void jian(@RequestParam Map params,HttpSession session) {
		UserLogin user=(UserLogin)session.getAttribute("userlogin");
        if(user!=null) {
        	params.put("faceid",user.getFaceid());
        	System.out.println(params);
        }else {
        	System.out.println("123");
        }
	}
	
	//购物车加
	@RequestMapping("/jia_num")
	@ResponseBody
	public void jia(@RequestParam Map params,HttpSession session) {
		UserLogin user=(UserLogin)session.getAttribute("userlogin");
	      if(user!=null) {
	    	  params.put("faceid", user.getFaceid());
	    	  proservice.jia(params);
	      }
	}
	//第二个首页跳转
	
	@RequestMapping("/shouye")
	public String shouye() {
		return "faceye2";
	}
//增加进数据库内的地址
	@RequestMapping("/order_add_dz")
	@ResponseBody
	public void order_add_dz(@RequestParam Map params, HttpSession session) {
		UserLogin user=(UserLogin)session.getAttribute("userlogin");
		if (user != null) {
			params.put("user_id",user.getFaceid());
			System.out.println(params + "------添加user_id  params_dizhi----------");
			proservice.addDizhi(params);
		} else {
			System.out.println("111");
		}

	}
	//跳转已登录的首页
	@RequestMapping("qianshou")
	public String qianshou() {
		return "faceye";
	}
	
	@RequestMapping("/fukuan1")
public String fukuan1() {
		return "fukuan";
	}
	
	@RequestMapping("/success")
	public String success() {
		return "success";
	}
}