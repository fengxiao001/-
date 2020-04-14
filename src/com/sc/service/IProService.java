package com.sc.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface IProService {
 List checkname();
 List checkclas();
 List checkphone(Map params);
 String checkcount(Map params);
 void insertgouwu(Map params);
 //购物车数量减
 void jian(Map params);
 //购物车加
 void jia(Map params);
 void addDizhi(Map params);
}
