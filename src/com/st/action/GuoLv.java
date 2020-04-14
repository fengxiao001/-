package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.bean.UserLogin;
import com.st.service.ILoginService;
@RequestMapping("/top")
@Controller
public class GuoLv {
	@Autowired
	ILoginService loginS;
	 //购物车跳转
	 @RequestMapping("/gouwuche")
	 public String gouwuche(HttpSession session,Map params) {
	  //判断购物车的用户显示
	  UserLogin user=new  UserLogin();
	  user=	(UserLogin) session.getAttribute("userlogin"); 
	  params.put("faceid", user.getFaceid());
	  List list= loginS.checkcar(params);
	  System.out.println(list);
	   session.setAttribute("checkcar",list);
	   return "gouwuche";
	 }
	 
	 @RequestMapping("/car_fukuan")
		public void logn_fukuan(@RequestParam Map params, HttpSession session, HttpServletRequest request) {
		 UserLogin user=(UserLogin)session.getAttribute("userlogin");
			System.out.println(params+"---------------money----------------");
			if (user != null) {
				params.put("user_id", user.getFaceid());
				System.out.println(params+"--------------加入id-money----------------");
				loginS.addorder(params);
				request.setAttribute("dz", params.get("shdz"));
				session.setAttribute("mana_id", params.get("proid"));
				request.setAttribute("gcmoney", params.get("sfk"));
			} else {
				System.out.println("用户未登录");
			}
		}

	 
	 
	 
	 
	 
	 
}
