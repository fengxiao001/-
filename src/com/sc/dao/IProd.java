package com.sc.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository
public interface IProd {
   List checkname();
 List checkclas();
 List checkphone(Map params);
 String checkcount(Map params);
 void insertgouwu(Map params);
 //购物车数量减
 void jian(Map params);
 
 //购物车加
 void jia(Map params);
 //往订单增加数据
 void insertord(Map params);
void addDizhi(Map params);
 

}
