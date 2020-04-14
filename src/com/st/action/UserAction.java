package com.st.action;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.User;
import com.st.bean.UserLogin;
import com.st.service.IUserService;
//@Controller
//定义该类是一个控制器 并且将该类纳入spring的管理
public class UserAction {
	@Autowired
	IUserService userservice;
	@RequestMapping("/addUser")
	public String addUser(UserLogin user) {
		userservice.addUser(user);
		return "user";
	}
	@RequestMapping("/userlist")
	public String userlist(ServletRequest request) {
		List<User> userlist=userservice.getUser(new HashMap());
		request.setAttribute("userlist", userlist);
		return "userlist";
	}
	@RequestMapping("/deleteUser")
	public String deleteUser(UserLogin user) {
		return "user";
	}
	@RequestMapping("/usertest")
	public String test(User user) {
		System.out.println("----用户名-----"+user.getUsername());
		System.out.println("----密码-----"+user.getPassword());
		userservice.getAllUser();
		return "index";
	}
	@RequestMapping("/index")
	//spring会将作用域对象通过参数的方式注入到方法中
	public String index(ServletRequest request) {
		System.out.println("----index");
		//向request中添加一个键值对
		request.setAttribute("username","张三");
		return "index";
		
	}
	//定义一个getuser方法,自定义路径,在方法中自行封装一个user对象,将该对象封装到session中,然后在页面中显示出user的内容
	@RequestMapping("/user")
	public String user(UserLogin user,HttpSession session) {
		System.out.println("session-----------");
		session.setAttribute("user",user);
		return "index";
	}
	@RequestMapping("/user1")
	public String getuser(UserLogin user,Map map) {
		map.put("user",user);
		return "index";
	}
	@RequestMapping("/info")
	@ResponseBody
	public String getInfo() {
		return "info";
	}
//	@ExceptionHandler(java.lang.ArithmeticException.class)
//	public String testEHandler() {
//		return "error1";
//		
//	}
	//在Controller中定义的ExceptionHandler只在当前类生效
//	@ExceptionHandler(java.lang.Exception.class)
//	public String testEHandler1() {
//		return "error1";
//	}
}
