package com.st.service.imp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.User;
import com.st.bean.UserLogin;
import com.st.dao.LoginDao;
import com.st.service.ILoginService;

@Service("loginS")
public class LoginSlmp implements ILoginService {
	@Autowired
	LoginDao logindao;

	@Override
	public boolean userLogin(HttpSession session, Map params) {
		// TODO Auto-generated method stub
		params.put("state", 1);
		UserLogin ul=logindao.getfaceuser(params);
		//判断是否有正确数据(是否有相应的facename的数据)
		if(ul!=null && ul.getFacename()!=null && ul.getFacename().equals(params.get("facename"))) {
			//判断密码是否一致
			if(ul.getPassword()!=null &&ul.getPassword().equals(params.get("password")) ) {
				//将登录信息保存到session中
				session.setAttribute("userlogin",ul );
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean sysLogin(HttpSession session, Map params) {
		// 通过前台传输的username查询User信息，封装成User对象
		User user = logindao.getuser(params);
		// 判断是否有正确数据(是否有相对应的username数据)
		if (user != null && user.getUsername() != null && user.getUsername().equals(params.get("username"))) {
			// 判断密码是否一致
			if (user.getPassword() != null && user.getPassword().equals(params.get("password"))) {
				// 将登录信息保存到session中
				session.setAttribute("system", user);
				return true;
			}
		}
		return false;
	}

	@Override
	public void updatepassword(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		User user=(User) session.getAttribute("system");
		if (params.get("password").equals(user.getPassword())) {
			logindao.updatepassword(params);
		}else {
			System.out.println("未传入");
		}
	}

	@Override
	public void reg(Map params) {
		// TODO Auto-generated method stub
		logindao.reg(params);
		
	}

	@Override
	public List checkname(Map params) {
		List list=logindao.checkname(params);
		return list;
	}

	@Override
	public List checkclas() {
		List  list=logindao.checkclas();
		return list;
	}

	@Override
	public List checkpro(Map param) {
		List list= logindao.checkpro(param);
		return list;
	}

	@Override
	public List checkgou(Map params) {
		// TODO Auto-generated method stub
		List list=logindao.checkgou(params);
		return list;
	}

	@Override
	public List checkcar(Map params) {
		// TODO Auto-generated method stub
		List list=logindao.checkcar(params);
		return list;
	}

	@Override
	public void delete(Integer shoppingid) {
		// TODO Auto-generated method stub
		logindao.deletegou(shoppingid);
		
	}

	@Override
	public void addorder(Map params) {
		// TODO Auto-generated method stub
		System.out.println("service"+params);
		logindao.addorder(params);
		
	}
//查询订单信息
	@Override
	public List getDizhi(Map params) {
		// TODO Auto-generated method stub
	List list =logindao.getDizhi(params);
		return list;
	}

	@Override
	public List selectUserorder(Map map) {
		List list=logindao.selectUserorder(map);
		return list;
	}

}
