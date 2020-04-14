package com.sc.bean;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public class layJson {
	private String code="0";
	private String msg="";
	private int count=100;//总数据行数--并不是每次查询出来的数量
	private List data;
	public static String getJSON(List data) {
		layJson ts=new layJson();
		ts.setData(data);
		String json=JSONObject.toJSONString(ts);
		return json;
	}
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		/*
		 * if (data != null) { this.count = data.size(); }
		 * 总数据行数---并不是每次都查询到
		 */
		this.data = data;
	}
	
	
}
