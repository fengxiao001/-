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
<link rel="stylesheet" href="layui/css/layui.css">
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
	 	 		<a href=qianshou><input type="button"  class="btn btn-primary" value="返回首页" id="payBtn" style="margin-left: 80%"></a>
		</div>
	</div>
	<!--订单提交body部分结束-->
	<br>

	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>