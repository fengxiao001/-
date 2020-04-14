<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米手机列表</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
	<body>
	<!-- start header -->
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
					<div class="gouwuche fr"><a href="">购物车</a></div>
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
						<input type="text" class="shuru"  placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
	<!-- start banner_y -->
	<!-- end banner -->

	<!-- start danpin -->
		<div class="danpin center" style="height:100%;">
			<div class="biaoti center">小米手机</div>
			 
			<div class="main center" style="height:100%; " >
			<c:forEach items="${phone}" var="name" varStatus="status">
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<div class="sub_mingxing"><a href="xiangqing?param=${name.proid}" target="_blank"><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="xiangqing?param=${name.proid}" target="_blank">${name.proname}</a></div>
					<div class="youhui">5.16早10点开售</div>
					<div class="jiage">2499.00元</div>
				</div>
	         </c:forEach>
				<%-- <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					 <c:forEach items="${phone}" var="name" varStatus="status" begin="1" end="1">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">搭载澎湃S1 八核高性能处理器</div>
					<div class="jiage">1499.00元</div>
					</c:forEach>
				</div>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					 <c:forEach items="${phone}" var="name" varStatus="status" begin="2" end="2">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">5月9日-20日 小米Note 2 享花呗12期分期免息</div>
					<div class="jiage">2799.00元</div>
					</c:forEach>
				</div>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					 <c:forEach items="${phone}" var="name" varStatus="status" begin="3" end="3">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">5月9日-20日小米MIX 享花呗12期分期免息</div>
					<div class="jiage">3499.00元</div>
					</c:forEach>
				</div>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					 <c:forEach items="${phone}" var="name" varStatus="status" begin="4" end="4">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">“暗夜之眼”超感光相机 / 无孔式超声波</div>
					<div class="jiage">1999.00元</div>
					</c:forEach>
				</div> --%>

				<!-- <div class="clear"></div>
 -->			</div>
		<%-- 	<div class="main center mb20">
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<c:forEach items="${phone}" var="name" varStatus="status" begin="5" end="5">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">骁龙820处理器 / UFS 2.0 闪存</div>
					<div class="jiage">1799.00元</div>
					</c:forEach>
				</div>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<c:forEach items="${phone}" var="name" varStatus="status" begin="6" end="6">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">十核旗舰处理器 / 全金属一体化机身 </div>
					<div class="jiage">1399.00元</div>
					</c:forEach>
				</div>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<c:forEach items="${phone}" var="name" varStatus="status" begin="7" end="7">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">5月9日-10日，下单立减100元</div>
					<div class="jiage">1799元</div>
					</c:forEach>
				</div>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<c:forEach items="${phone}" var="name" varStatus="status" begin="8" end="8">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">2.5D 玻璃，金属一体化机身</div>
					<div class="jiage">999.00元</div>
					</c:forEach>
				</div>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<c:forEach items="${phone}" var="name" varStatus="status" begin="9" end="9">
					<div class="sub_mingxing"><a href=""><img src="./file/${name.imgname}" alt=""></a></div>
					<div class="pinpai"><a href="">${name.proname}</a></div>
					<div class="youhui">多彩金属 / 4100mAh 超长续航</div>
					<div class="jiage">1299.00元</div>
					</c:forEach>
				</div>
				
				<div class="clear"></div>
			</div> --%>
		</div>
		
		<div  class="layui-col-xs12 layui-row layui-bg-red " style="bottom: 0px; height:40px;line-height: 40px;text-align: center;">
					<div class="layui-col-xs2" style="line-height: 40px;text-align: center;">第</div>
					<div id="pagelimit" class="layui-col-xs5" style="line-height: 40px;text-align: center;">
					
					</div>
					<div class="layui-col-xs5">
					<div class="layui-col-xs1">页</div>
					<div class="layui-col-xs2 layui-row">
					<div class="layui-col-xs4">共</div>
					<div class="layui-col-xs4"></div>
					<div class="layui-col-xs4">页</div>
					</div>
				</div>
				</div>

		<footer class="mt20 center"  style="bottom: 0px; display:block;height:60px;position:absolute;top:950px">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	var pagesize=20;//每页的显示的数量
	var nowpage=0;//当前页
	var lastpage;//最后页
	var fx=0;//方向
	var len;//总行数
	var lensize=5;//每行显示的数量
	var count;//总数量
	var page='${page}';//总页数
	var begin;//开始
	var end;//最后
	$().ready( function() {
		var i=1;
	for(;i<=page+1;i++){
		console.log(page);
		console.log(i);
			$("#pagelimit").append('<a href="javascript:;" id="jumppage'+i+'" onclick="jumppage(this)" style="margin-right:5px;">'+i+'</a>');
			if(i>=page+1){
				break;
			}
		}
	});
	
	function jumppage(e){
		var id=e.id;
		nowpage=$("#"+id).text()-1;
		var name="${proname}";
		alert("123");
		window.location.href = 'checkphone?proname='+name+'&nowpage='+nowpage+'';
	}

	
	
	
	
	</script>
	</body>
</html>