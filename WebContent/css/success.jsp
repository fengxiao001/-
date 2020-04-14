<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<link rel="stylesheet" href="static/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/buyConfirm.css" />
<link rel="stylesheet" type="text/css" href="css/dibu.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
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
				<li><span style="color: black;"><h1>支付成功</h1></span></li>
				<li></li>
				<li><span>感谢您对我们产品的信任和支持! </span></li>
			</ul>
		</div>
	</div>
	<!--订单提交body部分开始-->
	<div class="border_top_cart">

		<div class="container payment-con">
			<div class="order-info" style="height: 200px">
				<div class="msg" style="text-align: center; line-height: 200px">
					<span style="font-size: 60px">支付成功！</span>
				</div>
				<div class="icon-box">
					<i class="iconfont"><img style="margin-top: 0"
						src="img/yes_ok.png"></i>
				</div>
			</div>
	 	 		<a href="index2"><input type="button"  class="btn btn-primary" value="返回首页" id="payBtn" style="margin-left: 80%"></a>
		</div>
	</div>
	<!--订单提交body部分结束-->
	<br>
	<div class="ending" style="background-color: white;">
		<footer id="Customer">
			<ul class="">
				<li><a href=""><span></span>预约维修服务</a></li>
				<span>丨</span>
				<li><a href=""><span></span>7天无理由退货</a></li>
				<span>丨</span>
				<li><a href=""><span></span>15天免费换货</a></li>
				<span>丨</span>
				<li><a href=""><span></span>满150元包邮</a></li>
				<span>丨</span>
				<li><a href=""><span></span>520余家售后网点</a></li>
			</ul>
			<div id="hps">
				<div class="rt">
					<div>400-100-5678</div>
					<p>周一至周日 8:00-18:00</p>
					<p>（仅收市话费）</p>
					<a href="#" class="hv"> <img src="img/end/24h_03.jpg">
					</a>
				</div>
				<ul class="help">
					<li>
						<h4>帮助中心</h4> <a href="">账户管理</a> <a href="">购物指南</a> <a href="">订单操作</a>
					</li>
					<li>
						<h4>服务支持</h4> <a href="">售后政策</a> <a href="">自助服务</a> <a href="">相关下载</a>
					</li>
					<li>
						<h4>线下门店</h4> <a href="">小米之家</a> <a href="">服务网点</a> <a href="">零售网点</a>
					</li>
					<li>
						<h4>关于小米</h4> <a href="">了解小米</a> <a href="">加入小米</a> <a href="">联系我们</a>
					</li>
					<li>
						<h4>关注我们</h4> <a href="">新浪微博</a> <a href="">小米部落</a> <a href="">官方微信</a>
					</li>
					<li>
						<h4>特色服务</h4> <a href="">F码通道</a> <a href="">小米移动</a> <a href="">防伪查询</a>
					</li>
				</ul>
			</div>
		</footer>
		<footer id="ft">
			<div id="footer">
				<div class="rt">
					<a href="#"><img src="img/end/v-logo-4.gif"></a> <a href="#"><img
						src="img/end/v-logo-1.png"></a> <a href="#"><img
						src="img/end/v-logo-2.png"></a> <a href="#"><img
						src="img/end/v-logo-3.png"></a>
				</div>
				<p class="lt"></p>
				<div class="lt">
					<a href="#">小米商城</a>丨 <a href="#">MIUI</a>丨 <a href="#">米聊</a>丨 <a
						href="#">多看书城</a>丨 <a href="#">小米路由器</a>丨 <a href="#">视频电话</a>丨 <a
						href="#">小米后院</a>丨 <a href="#">小米天猫店</a>丨 <a href="#">小米淘宝直营店</a>丨
					<a href="#">小米网盟</a>丨 <a href="#">问题反馈</a>丨 <a href="#">Select
						Region</a>
					<p>
						&copy;<a href="#">mi.com</a>京ICP证110507号 <a href="#">
							京ICP备10046444号 </a> <a href="#"> 京公网安备11010802020134号</a> <a href="#">京网文[2014]0059-0009号</a>
					</p>
					违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试
				</div>
			</div>
			<div class="btm"></div>
		</footer>
	</div>

	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>