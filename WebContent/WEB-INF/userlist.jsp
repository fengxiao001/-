<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.st.bean.User,com.st.session.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header"  style="background-image: url('img/11.jpg'); background-size: 200%;">
			<div class="layui-logo">管理员 后台布局</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
					<li class="layui-nav-item"><a href="javascript:;">在线人数：<%=SessionCounter.getOnlinenumber()%></a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img">
						${sessionScope.system.username}
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a onclick='update_password()'>修改密码</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="out">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black" style="background-image: url('img/11.jpg'); background-size: 200%;" >
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test"  style="background-image: url('img/11.jpg'); background-size: 100%;">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">所有商品</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" page="goodstiao">商品分类</a>
							</dd>
							<dd>
								<a href="">超链接</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">列表一</a>
							</dd>
							<dd>
								<a href="javascript:;">列表二</a>
							</dd>
							<dd>
								<a href="">超链接</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="usertiao1">用户管理</a></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="usertiao2">商品管理</a></li>
							<li class="layui-nav-item"><a href="javascript:;"
						page="usertiao2">订单管理</a></li>
				</ul>
			</div>
		</div>


		<!-- 弹出层 (修改密码)-->
		<div hidden id='insertdate_password_div'>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">原密码</label>
					<div class="layui-input-inline">
						<input type="password" id="old_password" name="username"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline">
						<input type="password" id="new_password" name="usersex"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">
						<input type="password" id="new_password" name="usersex"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-body"
		     style="background-image: url('img/11.jpg'); background-size: 100%;">
			<!-- 内容主体区域 -->
			<iframe style="height: 100%; width: 100%" src=""></iframe>
			<div style="padding: 15px;">

				<div class="layui-footer"  style="background-image: url('img/11.jpg'); background-size: 100%;">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div>
		</div>

		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		<script src="layui/layui.all.js" type="text/javascript"
			charset="utf-8"></script>
		<script type="text/javascript">
			var $ = layui.jquery;
			var table = layui.table;
			var layer = layui.layer;
			//JavaScript代码区域
			/*  layui.use('element', function() {
				var element = layui.element; */
			/* });  */
			$("[page]").click(function() {
				$("iframe").attr("src", $(this).attr("page"));
			});

			function update_password() {
				var id = '${sessionScope.system.userid}';
				layer.open({
					title : "修改密码",
					type : 1,
					/*对应第一个div的id  */
					content : $("#insertdate_password_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updatepass", {
							"userid" : id,
							"password" : $("#old_password").val(),
							"new_password" : $("#new_password").val(),
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("修改成功");
							window.location.href = "login";
						});
					}
				});

			}
		</script>
</body>
</html>
