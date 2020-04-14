package com.st.bean;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("Img")
public class Img implements Serializable{
	private String imgid;
	private String imgname;
	public String getImgid() {
		return imgid;
	}
	public void setImgid(String imgid) {
		this.imgid = imgid;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

}
