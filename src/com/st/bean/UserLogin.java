package com.st.bean;

import org.apache.ibatis.type.Alias;

@Alias("userlogin")
public class UserLogin {
private int faceid;
private String facename;
private String password;
private String brithday;
private String tel;
private int state;
private String sex;
private String userage;
public int getFaceid() {
	return faceid;
}
public void setFaceid(int faceid) {
	this.faceid = faceid;
}
public String getFacename() {
	return facename;
}
public void setFacename(String facename) {
	this.facename = facename;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getBrithday() {
	return brithday;
}
public void setBrithday(String brithday) {
	this.brithday = brithday;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getUserage() {
	return userage;
}
public void setUserage(String userage) {
	this.userage = userage;
}



}
