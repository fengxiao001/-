<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米10pro立即购买-小米商城</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<style>
		#jieshao{
		position: relative;
		top: -107%;
		left:20%;
		}
		</style>
	</head>
	<body>
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="http://www.mi.com/" target="_blank">小米商城</a></li>
						<li>|</li>
						<li><a href="">MIUI</a></li>
						<li>|</li>
						<li><a href="">米聊</a></li>
						<li>|</li>
						<li><a href="">游戏</a></li>
						<li>|</li>
						<li><a href="">多看阅读</a></li>
						<li>|</li>
						<li><a href="">云服务</a></li>
						<li>|</li>
						<li><a href="">金融</a></li>
						<li>|</li>
						<li><a href="">小米商城移动版</a></li>
						<li>|</li>
						<li><a href="">问题反馈</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="top/gouwuche">购物车</a></div>
					<div class="fr">
						<ul>
							<li><a href="./register.html" target="_blank" >用户名:${sessionScope.userlogin.facename}</a></li>
							<li>|</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
			<!-- <a href=""><div class="ad_top fl"></div></a> -->
			<div class="nav fl">
				<ul>
					<li><a href="">小米手机</a></li>
					<li><a href="">红米</a></li>
					<li><a href="">平板·笔记本</a></li>
					<li><a href="">电视</a></li>
					<li><a href="">盒子·影音</a></li>
					<li><a href="">路由器</a></li>
					<li><a href="">智能硬件</a></li>
					<li><a href="">服务</a></li>
					<li><a href="">社区</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="小米10pro&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->

	
	<!-- xiangqing -->
	<form action="post" method="">
	<div class="xiangqing">
		<div class="neirong w">
		 <c:forEach items="${checkpro}" var="pro">
			<div class="xiaomi6 fl">${pro.proname}</div>
			</c:forEach>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
	      <!-- 轮播-->
		  <div class="layui-carousel" id="test1">
		  <c:forEach items="${checkpro}" var="pro">
		    <div carousel-item>
		      <div><img src="file/${pro.imgname }" style="height: 650px;width:700px" ></div>
		      <div><img src="file/${pro.imgname }" style="height: 650px;width:700px" ></div>
		        <!--   <div><img src="image/lb3.png" ></div>
		      <div><img src="image/lb4.png" ></div>
		      <div><img src="image/lb5.png" ></div> -->
		    </div>
		    </c:forEach>
		  </div>
		<div class="right fr" id="jieshao">
		 <c:forEach items="${checkpro}" var="pro">
			<div class="h3 ml20 mt20">${pro.proname}</div>
			<div class="jianjie mr40 ml20 mt10">变焦双摄，4 轴防抖 / 骁龙835 旗舰处理器，6GB 大内存，最大可选128GB 闪存 / 5.15" 护眼屏 / 四曲面玻璃/陶瓷机身</div>
			<div class="jiage ml20 mt10">${pro.proprice}元</div>
			<div class="ft20 ml20 mt20">选择版本</div>
			</c:forEach>
			<div class="xzbb ml20 mt10">
				<div class="banben fl">
				<c:forEach  items="${checkpro}" var="pro">
					<a>
						<span>全网通版 6GB+64GB </span>
						<span>${pro.proprice}元</span>
					</a>
					</c:forEach>
				</div>
				<div class="banben fr">
					<a>
						<span>全网通版 6GB+128GB</span>
						<span>2899元</span>
					</a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="ft20 ml20 mt20">选择颜色</div>
			<div class="xzbb ml20 mt10">
				<div class="banben">
					<a>
						<span class="yuandian"></span>
						<span class="yanse">珍珠白</span>
					</a>
				</div>
				
			</div>
		
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<c:forEach  items="${checkpro}" var="pro">
					<div class="left1 fl">${pro.proname} 全网通版 6GB内存 64GB 珍珠白</div>
					<div class="right1 fr">${pro.proprice}.00元</div>
					<div class="clear"></div>
					</c:forEach>
				</div>
				<c:forEach  items="${checkpro}" var="pro">
				<div class="bot mt20 ft20 ftbc">总计：${pro.proprice}元</div>
				</c:forEach>
				
			</div>
			<div class="xiadan ml20 mt20">
			<c:forEach  items="${checkpro}" var="pro">
			<a href="dingdan?params=${pro.proid}"><input class="jrgwc"  type="button" name="jrgwc" value="立即选购" /></a>	
			</c:forEach>
			
			<input class="jrgwc" type="button" name="jrgwc"  id="gouwu" value="加入购物车"/>
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
	</form>
	<!-- footer -->
	<footer class="mt20 center">
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		 <script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script>
		var layer = layui.layer;
		var table = layui.table;
		
		
		layui.use('carousel', function(){
		  var carousel = layui.carousel;
		  //建造实例
		  carousel.render({
		    elem: '#test1'
		    ,width: '54%' //设置容器宽度
		    ,arrow: 'always' //始终显示箭头
		    //,anim: 'updown' //切换动画
			,height:'580px'
			,interval:'1000'
		  });
		});
		
		
       $("#gouwu").click(function(){
    	   $.ajax({
   			type : "post",
   			url : "insertgouwu",
   			dataType : "json",
   			success : function() {
   			layer.msg("购物车添加成功");
   			}
   		})
       });
		</script>
	</body>
</html>