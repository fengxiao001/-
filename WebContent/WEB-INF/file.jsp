<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.st.bean.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
</head>
<body>
	<style>
.imgDiv {
	margin: 0 auto;
	display: inline-block;
	position: relative;
}

.img_delete_icon {
	font-size: 20px;
	color: red;
	position: absolute;
	right: 0px;
	margin-top: 0;
	color: black;
}

.img_delete_icon:link {
	color: #fff;
}

.img_delete_icon:hover {
	color: red;
}

.layui-input {
	height: 30px;
	width: 300px;
}
</style>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>表单集合</legend>
	</fieldset>
	<form action="creatPro" method="post" class="layui-form">
		<div class="layui-from-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品名</label>
				<div class="layui-input-inline">
					<input type="text" name="proname" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-inline">
					<input type="text" name="proprice" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div>
			<div class="layui-inline">
				<label class="layui-form-label">商品分类</label>
				<div class="layui-input-inline">
					<select name="classid" lay-verify="" id="goods">
						<option value="">请选择一个目录</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-inline">
					<input type="text" name="prostock" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 30px;">
			<legend>上传多张图片</legend>
		</fieldset>
		<div class="layui-upload">
			<button type="button" class="layui-btn" id="test2">多图片上传</button>
			<blockquote class="layui-elem-quote layui-quote-nm"
				style="margin-top: 10px;">
				预览图：
				<div class="layui-upload-list" id="demo2"></div>
			</blockquote>
		</div>
		<button class="layui-btn">确定提交</button>
	</form>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var form = layui.form;
		var upload = layui.upload;
		//多图片上传
		upload
				.render({
					elem : '#test2',
					url : 'fileUpload' //改成您自己的上传接口
					,
					multiple : true,
					before : function(obj) {
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
					$('#demo2').append('<div class="imgDiv"><div class="img_delete_icon layui-icon-close-fill layui-icon"></div><img  src="'+ result +'" alt="'+ file.name +'"style="height:80px;width:120px;"></div>')
					/*  上传第二个图片保证第一个只有一个点击事件*/
					$(".img_delete_icon").off();
					/*添加点击事件  */
					$(".img_delete_icon").click(function() {
					/* img_delete_icon的父级元素删除 */
			       $(this).parent().remove();
						})
				});
					},
					done : function(res) {
						console.log(res);
						//上传完毕
					}
				});

		function findAll() {
			$(function() {
				$.ajax({
					type : "post",
					url : "goods/findAll",
					dataType : "json",
					success : function(data) {
						$.each(data, function(index, item) {
							$("#goods").append(
									"<option value="+item.goodsid+">"
											+ item.classname + "</option>");
							form.render('select');
						})
					}
				})
			})
		}
		findAll();
	</script>
</body>
</html>
