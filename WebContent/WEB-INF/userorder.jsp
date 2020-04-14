<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/index2.css" />
<link rel="stylesheet" type="text/css" href="css/dibu.css" />
<link rel="icon" href="img/mi.png">

<title>订单列表</title>
<style type="text/css">
.layui-row {
	height: 300px;
	width: 800px;
	margin-top: 30px;
}
.grid-c{
	position: absolute;
}
</style>
</head>
<body style="background-color: white;">
	<div class="page_top">
		<!-- 最上层黑色导航 -->
		<div class="page_left">
			<a href="index">小米商城</a><span class="sep">|</span> <a href="#">MIUI</a><span
				class="sep">|</span> <a href="#">loT</a><span class="sep">|</span> <a
				href="#">云服务</a><span class="sep">|</span> <a href="#">金融</a><span
				class="sep">|</span> <a href="#">有品</a><span class="sep">|</span> <a
				href="#">小爱开放平台</a><span class="sep">|</span> <a href="#">企业团购</a><span
				class="sep">|</span> <a href="#">资质证照</a><span class="sep">|</span>
			<a href="#">协议规则</a><span class="sep">|</span> <a href="#">下载app</a><span
				class="sep">|</span> <a href="top/userorder">订单列表</a>
		</div>
		<div class="page_right">
			<a href="denglu">${sessionScope.us.username}</a>
			<span class="sep">|</span>
			<a href="top/gouwuche"><img
				src="img/shopping_basket_72px_1230836_easyicon.net.ico"
				style="transform: translateY(0);" height="18px">购物车</a>
		</div>
	</div>
	<div class="div_dh" style="background-color: white; height: 100px">
		<div class='div_img'>
			<img src="img/mi.png">
		</div>
		<div class='div_ul_dh'>
			<ul class="ul_dh">
				<li><span style=""><h1>订单列表</h1></span></li>
				<li></li>
			</ul>
		</div>
	</div>
	<!-- 在这些 -->
	<!-- 主体 -->
	<div style="width: 1300px; margin: 0 auto;">
		<table class="layui-table">
			<thead>
				<tr>
					<th>下单时间</th>
					<th>商品名称</th>
					<th>商品详情</th>
					<th>商品单价</th>
					<th>商品数量</th>
					<th>订单金额</th>
					<th>收货地址</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listorder}" var="list">
					<tr>
						<td>${list.xdtime}</td>
						<td>${list.proname}</td>
						<td><img style="width: 50px; height: 50px"
							src="file/${list.imgname}"></td>
						<td>${list.proprice}</td>
						<td>${list.procount}</td>
						<td>${list.procount*list.proprice}</td>
						<td>${list.dddz}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
		

	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>