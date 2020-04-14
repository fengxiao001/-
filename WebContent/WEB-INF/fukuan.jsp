<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/buyConfirm.css" />
<link rel="stylesheet" type="text/css" href="css/首页底部菜单.css" />
<link rel="stylesheet" type="text/css" href="css/index1.css" />
<link rel="icon" href="img/mi.png">
<title>订单支付</title>
</head>
<body>
	<div class="div_dh" style="background-color: white;">
		<div class='div_img'>
			<img src="img/mi.png">
		</div>
		<div class='div_ul_dh'>
			<ul class="ul_dh">
				<li><span style="color: black;"><h1>立即支付</h1></span></li>
				<li></li>
				<li><span>温馨提示：为了尽快给您发货,请尽快结算哟 </span></li>
			</ul>
		</div>
	</div>
	<!--订单提交body部分开始-->
	<div class="border_top_cart">

		<div class="container payment-con">
			<form target="_blank" action="#" id="pay-form" method="post">
				<div class="order-info">
					<div class="msg">
						<h3>您的订单已提交成功！付款咯～</h3>
						<p></p>

						<p class="post-date">成功付款后，7天发货</p>
					</div>
					<div class="info">
						<p>
							金额：<span class="pay-total">${money}</span>
						</p>
						<p>订单：1150505740045173</p>

					</div>
					<div class="icon-box">
						<i class="iconfont"><img style="margin-top: 0"
							src="img/yes_ok.png"></i>
					</div>
				</div>

				<div class="xm-plain-box">
					<!-- 选择支付方式 -->
					<div class="box-hd bank-title clearfix">
						<div id="titleWrap" class="title-wrap">
							<h2 class="title">选择支付方式</h2>
							<span class="tip-tag"></span>
						</div>
					</div>
					<div class="box-bd" id="bankList">
						<div class="payment-bd">
							<form name="ck">
								<dl class="clearfix payment-box">
									<dt>
										<strong>支付平台</strong>
										<p>手机等大额支付推荐使用支付宝快捷支付</p>
									</dt>
									<dd>
										<fieldset id="test4-input-input_tab1-input_tab2"
											style="border: none;">
											<ul class="payment-list clearfix">
												<li><input class="input_tab2" name="myradio" id="r2"
													type="radio" checked="checked" /><label for="r2"><img
														src="img/zfb.png" alt="" /></label></li>
												<li><input class="input_tab2" name="myradio" id="r2"
													type="radio" /><label for="r2"><img
														src="img/yck.png" alt="" /></label></li>
												<li><input class="input_tab2" name="myradio" id="r2"
													type="radio" /><label for="r2"><img
														src="img/zxzf.png" alt="" /></label></li>
											</ul>
											<div>
												<div id="test4_1">
													<ul class="payment-list clearfix"
														style="background-color: #f3f3f3;">
														<div class="xhw">
															<div class="whx_banner">
																<div style="clear: both">
																	<p class="p1">${dz}</p>
																</div>
																<div style="clear: both">
																	<p class="p1">短信效验码</p>
																	<input id="mobileCode" name="mobileCode" type="text"
																		value=""><input id="send" type="button"
																		style="cursor: hand" value="点击获取手机验证码">
																</div>
															</div>
														</div>
													</ul>
												</div>
												<div id="test4_2" style="display: none;"></div>
												<div id="test4_3" style="display: none;"></div>
												<div id="test4_4" style="display: none;"></div>



											</div>
										</fieldset>
									</dd>
								</dl>
							</form>

							<dl class="clearfix payment-box">
								<dt>
									<strong>银行网银</strong>
									<p>支持以下各银行借记卡及信用卡</p>

								</dt>
								<dd>
									<ul class="payment-list clearfix">
										<li><label for="CMB"><input type="radio"
												name="myradio" id="CMB" value="CMB" /> <img
												src="http://s1.mi.com/images/payOnline_zsyh.gif" alt="" /></label></li>
										<li><label for="ICBCB2C"><input type="radio"
												name="myradio" id="ICBCB2C" value="ICBCB2C" /> <img
												src="http://s1.mi.com/images/payOnline_gsyh.gif" alt="" /></label></li>
										<li><label for="CCB"><input type="radio"
												name="myradio" id="CCB" value="CCB" /> <img
												src="http://s1.mi.com/images/payOnline_jsyh.gif" alt="" /></label></li>
										<li><label for="ABC"><input type="radio"
												name="myradio" id="ABC" value="ABC" /> <img
												src="http://s1.mi.com/images/payOnline_nyyh.gif" alt="" /></label></li>
										<li><label for="BOCB2C"><input type="radio"
												name="myradio" id="BOCB2C" value="BOCB2C" /> <img
												src="http://s1.mi.com/images/payOnline_zgyh.gif" alt="" /></label></li>
										<li><label for="COMM"><input type="radio"
												name="myradio" id="COMM" value="COMM" /> <img
												src="http://s1.mi.com/images/payOnline_jtyh.gif" alt="" /></label></li>
										<li><label for="PSBC-DEBIT"><input type="radio"
												name="myradio" id="PSBC-DEBIT" value="PSBC-DEBIT" /> <img
												src="http://s1.mi.com/images/payOnline_youzheng.gif" alt="" /></label></li>
										<li><label for="GDB"><input type="radio"
												name="myradio" id="GDB" value="GDB" /> <img
												src="http://s1.mi.com/images/payOnline_gfyh.gif" alt="" /></label></li>
										<li><label for="SPDB"><input type="radio"
												name="myradio" id="SPDB" value="SPDB" /> <img
												src="http://s1.mi.com/images/payOnline_pufa.gif" alt="" /></label></li>
										<li><label for="CEBBANK"><input type="radio"
												name="myradio" id="CEBBANK" value="CEBBANK" /> <img
												src="http://s1.mi.com/images/payOnline_gdyh.gif" alt="" /></label></li>
										<li><label for="SPABANK"><input type="radio"
												name="myradio" id="SPABANK" value="SPABANK" /> <img
												src="http://s1.mi.com/images/payOnline_payh.gif" alt="" /></label></li>
										<li><label for="CIB"><input type="radio"
												name="myradio" id="CIB" value="CIB" /> <img
												src="http://s1.mi.com/images/payOnline_xyyh.gif" alt="" /></label></li>
										<li><label for="CMBC"><input type="radio"
												name="myradio" id="CMBC" value="CMBC" /> <img
												src="http://s1.mi.com/images/payOnline_msyh.gif" alt="" /></label></li>
										<li><label for="BOB"><input type="radio"
												name="myradio" id="BOB" value="BOB" /> <img
												src="http://s1.mi.com/images/payOnline_bjyh.gif" alt="" /></label></li>
										<li><label for="CITIC"><input type="radio"
												name="myradio" id="CITIC" value="CITIC" /> <img
												src="http://s1.mi.com/images/payOnline_zxyh.gif" alt="" /></label></li>
										<li><label for="SDB"><input type="radio"
												name="myradio" id="SDB" value="SDB" /> <img
												src="http://s1.mi.com/images/payOnline_sfyh.gif" alt="" /></label></li>
										<li><label for="SHBANK"><input type="radio"
												name="myradio" id="SHBANK" value="SHBANK" /> <img
												src="http://s1.mi.com/images/payOnline_shyh.gif" alt="" /></label></li>
										<li><label for="BJRCB"><input type="radio"
												name="myradio" id="BJRCB" value="BJRCB" /> <img
												src="http://s1.mi.com/images/payOnline_bjnsyh.gif" alt="" /></label></li>
										<li><label for="NBBANK"><input type="radio"
												name="myradio" id="NBBANK" value="NBBANK" /> <img
												src="http://s1.mi.com/images/payOnline_nbyh.gif" alt="" /></label></li>
										<li><label for="HZCBB2C"><input type="radio"
												name="myradio" id="HZCBB2C" value="HZCBB2C" /> <img
												src="http://s1.mi.com/images/payOnline_hzyh.gif" alt="" /></label></li>
										<li><label for="SHRCB"><input type="radio"
												name="myradio" id="SHRCB" value="SHRCB" /> <img
												src="http://s1.mi.com/images/payOnline_shnsyh.gif" alt="" /></label></li>
										<li><label for="FDB"><input type="radio"
												name="myradio" id="FDB" value="FDB" /> <img
												src="http://s1.mi.com/images/payOnline_fcyh.gif" alt="" /></label></li>
									</ul>
								</dd>
							</dl>




						</div>
					</div>
					<div class="box-ft clearfix">
						<input type="button" href="success" class="btn btn-primary" onclick="zhifu()"
							value="确认支付" id="payBtn">
						<!-- <a href="dingdan"
							class="btn btn-lineDakeLight">修改订单</a> -->
						<span class="tip"></span>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--订单提交body部分结束-->
	<br>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
	function zhifu(){
	var val=$('input:radio[name="myradio"]:checked').val();
	            if(val==null){
	                alert("请选择支付方式");
	            }
	            else{
					var code='${ddcode[0].order_code}'
	               window.location.href ="success?order_code="+code+"";
	            }
	}
	
	</script>
</body>
</html>