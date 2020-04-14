package com.st.bean;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
@Alias("Goods")
public class Goods implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private Integer goodsid;
private String classname;
private String classinfo;
private Integer state;
public Integer getGoodsid() {
	return goodsid;
}
public void setGoodsid(Integer goodsid) {
	this.goodsid = goodsid;
}
public String getClassname() {
	return classname;
}
public void setClassname(String classname) {
	this.classname = classname;
}
public String getClassinfo() {
	return classinfo;
}
public void setClassinfo(String classinfo) {
	this.classinfo = classinfo;
}
public Integer getState() {
	return state;
}
public void setState(Integer state) {
	this.state = state;
}


}
