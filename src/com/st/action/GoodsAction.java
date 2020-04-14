package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.st.bean.Goods;
import com.st.bean.layJson;
import com.st.service.IGoodsservice;
import com.st.service.Pro_Service;

@Controller
public class GoodsAction {
	@Autowired
	IGoodsservice Goodsservice;
	@Autowired
	Pro_Service proservice;

//增加
	@RequestMapping("/insertgoods")
	@ResponseBody
	public String goodslist(Goods goods) {
		Goodsservice.addGoods(goods);
		return "userlist";
	}

//查询
	@RequestMapping("/checkgoods")
	@ResponseBody
	public layJson checkgoods(@RequestParam Map params) {
		int count = Goodsservice.getCount(params);
		/* int count=Goodsservice.getcount(params); */
		// 需要service接收map类型的参数
		List listgoods = Goodsservice.checkGoods(params);
		layJson ts = new layJson();
		String json =JSONObject.toJSONString(listgoods);
		ts.setData(listgoods);
		ts.setCount(count);
		return ts;
	}

	@RequestMapping("/goods/findAll")
	@ResponseBody
	public List findAll() {
		List listgoods = Goodsservice.findAll();
		return listgoods;
	}

//删除
	@RequestMapping("/delgoods")
	@ResponseBody
	public String delgoods(Goods goods) {
		Goodsservice.deleteGoods(goods);
		return "userlist";
	}

//修改
	@RequestMapping("/updategoods")
	@ResponseBody
	public String updategoods(@RequestParam Map params) {
		Goodsservice.updatagoods(params);
		return "userlist";
	}

	// 商品上架
	@RequestMapping("/shangjia")
	@ResponseBody
	public void shangjia(@RequestParam Map params) {
		Goodsservice.shangjia(params);
	}

	// 商品下架
	@RequestMapping("/xiajia")
	@ResponseBody
	public void xiajia(@RequestParam Map params) {
		Goodsservice.xiajia(params);
	}
}
