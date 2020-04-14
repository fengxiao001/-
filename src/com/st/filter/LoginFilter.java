package com.st.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.st.bean.UserLogin;

public class LoginFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			// 获得在下面代码中要用的request,response,session对象
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			HttpSession session = req.getSession();
			// 从session里取用户
			UserLogin user = (UserLogin) session.getAttribute("userlogin");
			// 登陆页面无需过滤
			if (user != null) {
				chain.doFilter(request, response);
				// 判断如果没有取到用户信息,说明这个请求是没有登录就在请求 就跳转到登陆页面
				// 跳转到登陆页面
			} else {
				// 获得用户请求的URI
				String path = req.getContextPath();
				String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ path + "/";
				//System.out.println(basePath);
				// 已经登陆,继续此次请求
				resp.sendRedirect(basePath + "qianlogin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	

}