package com.sc.bean;

public class Prod {
private int proid;
private String proname;
private double  proprice;
private String classid;
private String prostock;
private String imgname;
private int state;
public int getProid() {
	return proid;
}
public void setProid(int proid) {
	this.proid = proid;
}
public String getProname() {
	return proname;
}
public void setProname(String proname) {
	this.proname = proname;
}
public double getProprice() {
	return proprice;
}
public void setProprice(double proprice) {
	this.proprice = proprice;
}
public String getClassid() {
	return classid;
}
public void setClassid(String classid) {
	this.classid = classid;
}
public String getProstock() {
	return prostock;
}
public void setProstock(String prostock) {
	this.prostock = prostock;
}
public String getImgname() {
	return imgname;
}
public void setImgname(String imgname) {
	this.imgname = imgname;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
@Override
public String toString() {
	return "Prod [proid=" + proid + ", proname=" + proname + ", proprice=" + proprice + ", classid=" + classid
			+ ", prostock=" + prostock + ", imgname=" + imgname + ", state=" + state + "]";
}



}
