package com.st.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sc.bean.layJson;
import com.st.bean.UserLogin;
import com.st.service.ILoginService;

@Controller
public class LoginAction {
	@Autowired
	ILoginService loginS;
	
	//跳转列表页面
	@RequestMapping("/liebiao")
	public String liebiao() {
		return "liebiao";
	}
	
	
	// 跳转jsp页面
	@RequestMapping("/login") 
	public String logn_page(HttpSession session) {
		 System.out.println("qianlogin");
		return "sys/login";
	}
	
	
	
	//删除购物车信息
	@RequestMapping("/delete/{shoppingid}")
	@ResponseBody
    public Integer delete(@PathVariable Integer shoppingid ) {
		loginS.delete(shoppingid);
		return 1;
	}
	@RequestMapping("/faceye2")
	public String faceye2(HttpSession session, @RequestParam Map params){
		  params.put("state",1);
		  List list=new ArrayList(); 
		  List list1=new ArrayList();
		  list1=loginS.checkclas(); 
		  list=loginS.checkname(params);
		  layJson json=new layJson();
		  String json1=JSONObject.toJSONString(list);
		  session.setAttribute("getname", list);
		  session.setAttribute("clas", list1);
		return "faceye2";
	}
	@RequestMapping("/dingdanlie")
	public String dingdanlie(@RequestParam Map map, HttpSession session){
		UserLogin user = (UserLogin) session.getAttribute("userlogin");
		if (user != null) {
			// System.out.println(user.getUserid());
			map.put("user_id", user.getFaceid());
			List list = loginS.selectUserorder(map);
			session.setAttribute("listorder", list);
		}
		return "userorder";
	}
	
	
	
/**
 * 前台登录
 * @param session
 * @param params
 * @return
 */
	@RequestMapping("/qianlogin")
	public String qianlogin(HttpSession session, @RequestParam Map params) {
		boolean b=loginS.userLogin(session,params);
		if(b==true) {
			//获取商品的信息以及商品分类的信息
			  params.put("state",1);
			  List list=new ArrayList(); 
			  List list1=new ArrayList();
			  list1=loginS.checkclas(); 
			  list=loginS.checkname(params);
			  layJson json=new layJson();
			  String json1=JSONObject.toJSONString(list);
			  session.setAttribute("getname", list);
			  session.setAttribute("clas", list1);
			//登录成功,并返回首页
			return "faceye";
		}else {
			//如果登录不成功，返回登录页面
			return "user/userlogin";
		}
	}
	
	
	/**
	 * 后台登录
	 * @param session
	 * @param params
	 * @return
	 */
	@RequestMapping("/userlogin")
	public String userlogin(HttpSession session, @RequestParam Map params) {
		// 通过service验证登录数据是否正确--boolean
		// 如果正确，将数据保存到session中
		boolean b = loginS.sysLogin(session, params);
		if (b == true) {
			// 登录成功，并返回管理页面
			return "userlist";
		} else {
			// 如果不正确返回登录页面
			return "sys/login";
		}
	}
	
	@RequestMapping("/out")
	public String out(HttpSession session) {
	    session.invalidate();
		return "sys/login";
	}
	
	/**
	 * 后台修改密码
	 * @param params
	 * @param session
	 */
	@RequestMapping("/updatepass")
    @ResponseBody
 	public void updatepass(@RequestParam Map params,HttpSession session) {
		loginS.updatepassword(params,session);
	}
	
	 @RequestMapping("/register")
	 public String register(@RequestParam Map params) {
		 loginS.reg(params);
		 return "user/userlogin";
	 }
	 //注册跳转
	 @RequestMapping("/zhuce")
	 public String zhuce() {
		 return "register";
	 }
	 //详情页跳转
	 @RequestMapping("/xiangqing")
	 public String xiangqing(@RequestParam Map param,HttpSession session) {
		List list=loginS.checkpro(param);
		//将商品信息存入session
		session.setAttribute("checkpro", list);
		 return "xiangqing";
	 }


	 //付款
	 @RequestMapping("/fukuan")
	 @ResponseBody
	 public List fukuan(@RequestBody JSONArray json,HttpSession session,Map map) {
		 List list=JSONObject.parseArray(json.toJSONString(),Map.class);
		 UserLogin user=(UserLogin)session.getAttribute("userlogin");
		 if(user!=null) {
			 map.put("did", user.getFaceid());
			 session.setAttribute("list", list);
		 }else {
			 System.out.println("未登录");
		 }
		 return list;
	 }
	 
	
	 
	 @RequestMapping("/dingdan1")
		public String getDizhi(@RequestParam Map params, HttpSession session) {
		
		 UserLogin user = (UserLogin) session.getAttribute("userlogin");
		 if (user !=null) {
			 params.put("user_id", user.getFaceid()); 
			 List listdizhi =loginS.getDizhi(params); 
			 System.out.println(params +"--------sadk---------"); 
			 session.setAttribute("dz", listdizhi); } 
		      else {
		      System.out.println("111"); }
			return "dingdan1";
		}
	 
	 
	 
	 
//订单详情跳转
	 @RequestMapping("/dingdan")
	 public String dingdan(@RequestParam Map params,HttpServletRequest request) {
		 System.out.println(params);
		 List list=loginS.checkgou(params);
		 request.setAttribute("checkding", list);
		 System.out.println("gouwuche"+list);
		 return "dingdanzhongxin";
	 } 
	 
	 
	 //首页退出
	 
	 @RequestMapping("/indexout")
	 public String indexout(HttpSession session) {
		 session.removeAttribute("userlogin");
		 return "user/userlogin";
	 }
	 
	 @RequestMapping("/fukuan12")
	 public String fukuan1() {
		 return "fukuan";
	 }
	 
	 
	 
}
