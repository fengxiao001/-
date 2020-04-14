<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />

<style>
.check {
	height: 62px;
	width: 371px;
	position: relative;
	left: 74%;
	top: -80px
}

#shuru {
	height: 62px;
	width: 305px;
	font-size: 20px;
}

.tijiao {
	height: 70px;
	width: 60px;
	position: relative;
	left: 308px;
	top: -69px;
}

.first {
	height: 620px;
	width: 250px;
	position: absolute;
	top: -2px;
}

.first2 {
	height: 620px;
	width: 250px;
	position: absolute;
	margin-left: 250.5px;
	top: -0.5px;
}

.first3 {
	height: 620px;
	width: 250px;
	position: absolute;
	margin-left: 502px;
	top: -0.5px;
}

.first4 {
	height: 620px;
	width: 250px;
	position: absolute;
	margin-left: 753px;
	top: -0.5px;
}

.first5 {
	height: 620px;
	width: 250px;
	position: absolute;
	margin-left: 1004px;
	top: -0.5px;
}

#xianshi {
	height: 120px;
	width: 100px;
}
</style>
</head>
<body>
	<!-- <div class="page_top" align="center"> -->
	
		<div class="page_top">
			<div class="page_left">
				<a href="#">小米商城</a><span class="sep">|</span> <a href="#">MIUI</a><span
					class="sep">|</span> <a href="#">loT</a><span class="sep">|</span>
				<a href="#">云服务</a><span class="sep">|</span> <a href="#">金融</a><span
					class="sep">|</span> <a href="#">有品</a><span class="sep">|</span> <a
					href="#">小爱开放平台</a><span class="sep">|</span> <a href="#">企业团购</a><span
					class="sep">|</span> <a href="#">资质证照</a><span class="sep">|</span>
				<a href="#">协议规则</a><span class="sep">|</span> <a href="#">下载app</a><span
					class="sep">|</span> <a href="#">Select Locaton</a>
			</div>
			<div class="page_right">
			  <a href="#">用户名:${sessionScope.userlogin.facename}</a><span class="sep">|</span>
			    <a href="#">消息通知</a><span class="sep">|</span>
				<a href="top/gouwuche"><img
					src="img/shopping_basket_72px_1230836_easyicon.net.ico"
					height="28px">购物车</a><span class="sep">|</span>
					<a href="dingdanlie">订单列表</a><span class="sep">|</span>
					<a href="javascript:; parent.location.href='indexout'" onclick='return confirm("确定退出登录吗？")';>
					退出</a>
			</div>
		</div>
		<div class="mi_dh">
			<div class="mi_tb">
				<img src="img/tubiao.png" height="60px">
			</div>
			<ul class="ul_dh">
				<li onmouseover="show_nav()"><a class="text" href="liebiao.jsp">
						<span>小米手机</span>
				</a></li>
				<li><a class="text" href="#"> <span>Redmi红米</span>
				</a></li>
				<li><a class="text" href="#"> <span>电视</span>
				</a></li>
				<li><a class="text" href="#"> <span>笔记本</span>
				</a></li>
				<li><a class="text" href="#"> <span>家电</span>
				</a></li>
				<li><a class="text" href="#"> <span>路由器</span>
				</a></li>
				<li><a class="text" href="#"> <span>智能硬件</span>
				</a></li>
				<li><a class="text" href="#"> <span>服务</span>
				</a></li>
				<li><a class="text" href="#"> <span>社区</span>
				</a></li>

			</ul>
		</div>
		<div class="check">
		        <form action="checkphone" method='post'>
				<input type="text" name="proname" id="shuru" />
				<button class="tijiao">查询</button>
					</form>
		</div>
		<div id="nav_div" class="header-nav-menu" onmouseover="show_nav()"
			onmouseleave="hid_nav()">
			<ul class="nav-ul">
				<li><c:forEach items="${getname}" var="name" varStatus="status"
						begin="0" end="0">
						<div>
							<img id="xianshi" src="file/${name.imgname}" />
						</div>
						<div class="nav-li-name">${name.proname}</div>
						<div class="nav-li-price">2799元起</div>
					</c:forEach></li>
				<li><c:forEach items="${getname}" var="name" varStatus="status"
						begin="1" end="1">
						<div>
							<img id="xianshi" src="file/${name.imgname}" />
						</div>
						<div class="nav-li-name">${name.proname}</div>
						<div class="nav-li-price">2799元起</div>
					</c:forEach></li>
				<li><c:forEach items="${getname}" var="name" varStatus="status"
						begin="2" end="2">
						<div>
							<img id="xianshi" src="file/${name.imgname}" />
						</div>
						<div class="nav-li-name">${name.proname}</div>
						<div class="nav-li-price">1699元起</div>
					</c:forEach></li>
				<li><c:forEach items="${getname}" var="name" varStatus="status"
						begin="3" end="3">
						<div>
							<img id="xianshi" src="file/${name.imgname}" />
						</div>
						<div class="nav-li-name">${name.proname}</div>
						<div class="nav-li-price">1099元起</div>
					</c:forEach></li>
				<li><c:forEach items="${getname}" var="name" varStatus="status"
						begin="4" end="4">
						<div>
							<img id="xianshi" src="file/${name.imgname}" />
						</div>
						<div class="nav-li-name">${name.proname}</div>
						<div class="nav-li-price">1999元起</div>
					</c:forEach></li>
				<li><c:forEach items="${getname}" var="name" varStatus="status"
						begin="5" end="5">
						<div>
							<img id="xianshi" src="file/${name.imgname}" />
						</div>
						<div class="nav-li-name">${name.proname}</div>
						<div class="nav-li-price">2599元起</div>
					</c:forEach></li>
			</ul>
		</div>
		<div class="main">
			<div class="lb_div">
				<div class="leftBar">
				<!--类的遍历  -->
					<ul>
						<c:forEach items="${clas}" var="cname" varStatus="status" begin="0"
							end="9">
							<li id="${cname.goodsid}" onmouseover="show_phone(this)" onmouseleave="out_phone(this)"><span
								class="leftBar_name">${cname.classname}</span><span
								class="leftBar_r"></span></li>
						</c:forEach>
					</ul>
				</div>
				
				
				<!--弹出层的遍历  -->
				<c:forEach items="${clas}" var="clas">
				<div id="nav_i${clas.goodsid}" class="zcd" onmouseover="show_phone1(this)"
					onmouseleave="out_phone1(this)" style="display:none;" >
					    <div class="first">
					 	<ul class="ul_yb" style="width:1130px;height:200px">
					 		<c:forEach items="${getname}" var="name">
					    <c:if test="${clas.goodsid==name.classid }">
								<li style="display:block;float:left;margin-top:5px;margin-left:15px"><a href="#"><img src="file/${name.imgname}" style="width:90px;height:100px">
								</a><span><a
								href="xiangqing?param=${name.proid}"> ${name.proname}</a> </span></li>
						</c:if>
					</c:forEach>
						</ul>
					</div>

				</div>
				</c:forEach>
				
				<div id="lb_div_list" class="lb_div_list">
					<img class="lb_img" src="img/7.jpg"> <img class="lb_img"
						src="img/8.webp"> <img class="lb_img" src="img/9.webp">
					<img class="lb_img" src="img/10.webp"> <img class="lb_img"
						src="img/11.webp">
				</div>
			</div>
		</div>
		<script src="js/index.js">
			
		</script>


		<div class="zxm">
			<div class="miaosha">
				<div class="miao_1">
					<img src="img/21.png"><span class="ziti_miao_1"><a
						href="#">小米秒杀</a></span>
				</div>
				<div class="miao_2">
					<img src="img/22.png"><span class="ziti_miao_2"><a
						href="#">企业团购</a></span>
				</div>
				<div class="miao_3">
					<img src="img/23.png"><span class="ziti_miao_3"><a
						href="#">F码通道</a></span>
				</div>
				<div class="miao_4">
					<img src="img/24.png"><span class="ziti_miao_4"><a
						href="#">米粉卡</a></span>
				</div>
				<div class="miao_5">
					<img src="img/25.png"><span class="ziti_miao_5"><a
						href="#">以旧换新</a></span>
				</div>
				<div class="miao_6">
					<img src="img/26.png"><span class="ziti_miao_6"><a
						href="">话费充值</a></span>
				</div>

			</div>
			<div class="xm_cc">
				<img src="img/e.jpg">
			</div>
			<div class="rm_note">
				<img src="img/redmi%20note8.jpg">
			</div>
			<div class="rm_sh">
				<img src="img/shouhuan.jpg">
			</div>
		</div>
		<div class="shangou">
			<div class="mi_shan">
				<span class="shan_zt">小米闪购</span>
			</div>

			<div class="da_1">

				<div class="round">
					<span class="color_c">14:00 场</span>
				</div>
				<div class="p_shangou">
					<img src=img/shandian.png>
				</div>
				<div class="desc">
					<span class="da_1_ziti">距离结束还有</span>
				</div>
				<div class="daojishi_1">
					<span class="djs_1">01</span>
				</div>
				<span class="maohao_1">:</span>
				<div class="daojishi_2">
					<span class="djs_2">59</span>
				</div>
				<span class="maohao_2">:</span>
				<div class="daojishi_3">
					<span class="djs_3">59</span>
				</div>
			</div>



			<div id="lb_sgxh" class="lb_sgxh">
				<div class="da_2">
					<div class="yashua">
						<img src="img/yashua.jpg"><span class="ya_zi">贝医生儿童牙刷
							蓝色</span><span class="shua_zi">专业呵护宝宝智能牙齿</span> <span
							class="shua_price">1元</span>
						<del class="shua_jiangjia">19.9元</del>
					</div>
				</div>
				<div class="da_3">
					<div class="shouhuan">
						<img src="img/shouhuan3.png"><span class="shouh_zi">小米手环3
							热力橙</span><span class="huan_zi">全新OLED可触摸大屏</span> <span
							class="huan_price">99元</span>
						<del class="huan_jiangjia">139元</del>
					</div>
				</div>
				<div class="da_4">
					<div class="banxie">
						<img src="img/banxie.png"><span class="banx_zi">Free
							Tie真皮板鞋 米家定制</span><span class="ban_zi">做一双简单的板鞋</span> <span
							class="ban_price">99元</span>
						<del class="ban_jiangjia">199元</del>
					</div>
				</div>
				<div class="da_5">
					<div class="shxt">
						<img src="img/xiang.jpg"><span class="shex_zi">小米米家智能摄像机
							白色</span><span class="she_zi">智能侦测 安全守护</span> <span class="she_price">99元</span>
						<del class="she_jiangjia">129元</del>
					</div>
				</div>
			</div>

			
			<div class="da_6">
				<div class="mi_da">
					<img src="img/xiaomi9da.webp">
				</div>
			</div>
			<div class="da_7">
				<div class="shouji">
					<span class="sh">手机</span>
				</div>
			</div>
			<div class="da_8">
				<div class="mix">
					<img src="img/MIX.webp">
				</div>
			</div>
			<div class="mix_v_1">
				<div class="mix_1">
					<c:forEach items="${getname}" var="name" begin="0" end="0">
						<img src="file/${name.imgname}" />
						<span class="r1_zi">${name.proname} </span>
						<span class="r1_zhong">120Hz流速屏，全速热爱</span>
						<span class="r1_price">1599元起</span>
					</c:forEach>
				</div>
			</div>

			<div class="mix_v_2">
				<div class="mix_2">
					<c:forEach items="${getname}" var="name" begin="1" end="1">
						<img src="file/${name.imgname}">
						<span class="r2_zi">${name.proname} </span>
						<span class="r2_zhong">双模5G,120Hz流速屏</span>
						<span class="r2_price">1999元起</span>
					</c:forEach>
				</div>
			</div>

			<div class="mix_v_3">
				<div class="mix_3">
					<c:forEach items="${getname}" var="name" begin="2" end="2">
						<img src="file/${name.imgname}">
						<span class="r3_zi">${name.proname}</span>
						<span class="r3_zhong">1亿像素 五摄四闪</span>
						<span class="r3_price">2599元起</span>
						<del class="r3_p_jiang">2799元</del>
					</c:forEach>
				</div>
			</div>

			<div class="mix_v_4">
				<div class="mix_4">
					<c:forEach items="${getname}" var="name" begin="3" end="3">
						<img src="file/${name.imgname}">
						<span class="r4_zi">${name.proname}</span>
						<span class="r4_zhong">5G双卡全网通，骁龙855Plus</span>
						<span class="r4_price">3699元起</span>
					</c:forEach>
				</div>
			</div>

			<div class="mix_v_5">
				<div class="mix_5">
					<c:forEach items="${getname}" var="name" begin="4" end="4">
						<img src="file/${name.imgname}">
						<span class="r5_zi">${name.proname}</span>
						<span class="r5_zhong">5000mAh 超长续航</span>
						<span class="r5_price">699元起</span>
						<del class="r5_p_jiang">799元</del>
					</c:forEach>
				</div>
			</div>

			<div class="mix_v_6">
				<div class="mix_6">
					<c:forEach items="${getname}" var="name" begin="5" end="5">
						<img src="file/${name.imgname}">
						<span class="r6_zi">${name.proname}</span>
						<span class="r6_zhong">5000mAh超长续航</span>
						<span class="r6_price">699元起</span>
					</c:forEach>
				</div>
			</div>

			<div class="mix_v_7">
				<div class="mix_7">
					<c:forEach items="${getname}" var="name" begin="6" end="6">
						<img src="file/${name.imgname}">
						<span class="r7_zi">${name.proname} </span>
						<span class="r7_zhong">6400万全场景四摄</span>
						<span class="r7_price">1199元起</span>
						<del class="r7_p_jiang">1399元</del>
					</c:forEach>
				</div>
			</div>

			<div class="mix_v_8">
				<div class="mix_8">
					<c:forEach items="${getname}" var="name" begin="0" end="0">
						<img src="file/${name.imgname}">
						<span class="r8_zi">${name.proname} </span>
						<span class="r8_zhong">千元4800万四摄</span>
						<span class="r8_price">999元起</span>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="dianshi">
			<div class="d_tupian">
				<img src="img/dianshi.webp">
			</div>
		</div>
		<div class="jiadia">
			<div class="jiadian">
				<span class="jd">家电</span>
			</div>
			<div class="jingshuiqi">
				<div class="jsq">
					<a href="#"><img src="img/jingshuiqi.webp"></a>
				</div>
			</div>
			<div class="kongtiao_c1">
				<div class="kt">
					<a href="#"><img src="img/kongtiaoC1.webp"></a>
				</div>
			</div>
			<div class="kongtiao_mj">
				<div class="kt_mj">
					<a href="#"><img src="img/mijiakongtiao.jpg"></a>
				</div>
			</div>
			<div class="hongxiji">
				<div class="hxj">
					<a href="#"><img src="img/hongxiji.webp"></a>
				</div>
			</div>
			<div class="dianshi_4A">
				<div class="dianshi_mj">
					<a href="#"><img src="img/dianshi4A.jpg"></a>
				</div>
			</div>
			<div class="saodi">
				<div class="saodi_mj">
					<a href="#"><img src="img/saodi.webp"></a>
				</div>
			</div>
			<div class="xiyiji">
				<div class="xiyiji_mj">
					<a href="#"><img src="img/xiyiji.webp"></a>
				</div>
			</div>
			<div class="dianshi_E55">
				<div class="dianshi_E55_mj">
					<a href="#"><img src="img/dianshiE55.webp"></a>
				</div>
			</div>
			<div class="qingboben">
				<div class="qingboben_mj">
					<a href="#"><img src="img/qingboben.webp"></a>
				</div>
			</div>
			<div class="Air">
				<div class="Air_mj">
					<a href="#"><span class="Air_zi">Air 13.3 2019款</span></a> <a
						href="#"><span class="Air_price">4999元起</span></a> <a href="#"><img
						src="img/Air13..3.webp"></a>
				</div>
			</div>
			<div class="liulan">
				<div class="liulan_mj">
					<a href="#"><span class="liulan_zi">浏览更多</span></a> <a href="#"><span
						class="remen_zi">热门</span></a>
				</div>
			</div>
			<div class="you">
				<a href="#"><img src="img/you.png"></a>
			</div>
		</div>

		<div class="mensuo">
			<div class="ms_tupian">
				<img src="img/mensuo.webp">
			</div>
		</div>


		<div class="zhineng">
			<div class="zhinen">
				<span class="zn">智能</span>
			</div>
			<div class="jingshuiqi">
				<div class="jsq">
					<a href="#"><img src="img/mijiashexiangji.webp"></a>
				</div>
			</div>
			<div class="xiaoai">
				<div class="xa">
					<a href="#"><img src="img/xiaoai.webp"></a>
				</div>
			</div>
			<div class="mensuo">
				<div class="ms_mj">
					<a href="#"><img src="img/mijiamensuo.webp"></a>
				</div>
			</div>
			<div class="xiaoaiyin">
				<div class="xay">
					<a href="#"><img src="img/xiaoaiyinxiangplay.webp"></a>
				</div>
			</div>
			<div class="xiaoaiyao">
				<div class="xay_mj">
					<a href="#"><img src="img/xiaoaiyinxiangyaokong.webp"></a>
				</div>
			</div>
			<div class="huaban">
				<div class="huaban_mj">
					<a href="#"><img src="img/huaban.webp"></a>
				</div>
			</div>
			<div class="dianfanbao">
				<div class="dfb_mj">
					<a href="#"><img src="img/dianfanbao.webp"></a>
				</div>
			</div>
			<div class="shouhuan444">
				<div class="shouhuan444_mj">
					<a href="#"><img src="img/shouhuan444.webp"></a>
				</div>
			</div>
			<div class="pinghengche">
				<div class="phc_mj">
					<a href="#"><img src="img/pinghengche.webp"></a>
				</div>
			</div>
			<div class="ti">
				<div class="ti_mj">
					<a href="#"><span class="ti_zi">小米体脂秤 2</span></a> <a href="#"><span
						class="ti_price">99元</span></a> <a href="#"><img
						src="img/tizhongcheng.webp"></a>
				</div>
			</div>
			<div class="liulan">
				<div class="liulan_mj">
					<a href="#"><span class="liulan_zi">浏览更多</span></a> <a href="#"><span
						class="remen_zi">热门</span></a>

				</div>
			</div>
			<div class="you">
				<a href="#"><img src="img/you.png"></a>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script>



</script>
</body>
</html>
