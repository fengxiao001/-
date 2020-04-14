package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.st.bean.User;

public interface ILoginService {
	/**
	 * 前台用户的登录
	 * @param session
	 * @param params
	 * @return
	 */
boolean userLogin(HttpSession session,Map params);
/**
 * 后台用户的登录
 * @param session
 * @param params
 * @return
 */
boolean sysLogin(HttpSession session,Map map);

void updatepassword(Map params,HttpSession session);

void reg(Map params);

List checkname(Map params);
List checkclas();
List checkpro(Map param); 
List checkgou(Map params);

List checkcar(Map params);

//删除购物车信息
void delete(Integer shoppingid);
void addorder(Map params);
List getDizhi(Map params);
List selectUserorder(Map map);

}
