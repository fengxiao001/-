<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
</head>
<body>
	<div>
		<input id='checktext' required lay-verify="required"
			placeholder="请输入ID或用户名" autocomplete="off" class="layui-input">
		<button class="layui-btn layui-btn-normal" id='checkBut'>查询</button>
		<button class="layui-btn layui-btn-normal" onclick='user_del()'>删除</button>
		<button class="layui-btn layui-btn-normal" onclick='user_insert()'>增加</button>
		<button class="layui-btn layui-btn-normal" onclick='user_update()'>修改</button>
	</div>
	<script type="text/html" id="dateTpl">
    {{layui.util.toDateString(new Date(d.BirthDate).getTime(), "yyyy-MM-dd") }}
    </script>
	<table class="layui-table"
		lay-data="{url:'listuser',method:'post',id:'userlist',page:true,}"
		lay-filter="filter">
		<thead>
			<th lay-data="{type:'radio'}"></th>
			<th lay-data="{field:'faceid',sort:true}">用户ID</th>
			<th lay-data="{field:'facename',edit:'text'}">用户名</th>
			<th lay-data="{field:'sex',edit:'text'}">用户性别</th>
			<th lay-data="{field:'userage',edit:'text'}">用户年龄</th>
				<th
					lay-data="{field:'state',templet:function(d){
			if(d.state==1){
			return '正常';
			}else{
			return '封号';
			}
			}}">状态</th>
				<th lay-data="{field:'firsttime',edit:'text',templet:'#dateTpl'}">最后登入时间</th>
				<th lay-data="{field:'lasttime',edit:'text,'}">最后登出时间</th>
				<th
					lay-data="{templet:function(d){
			if(d.state==0){
			return $('#fhjf2').html();
			}else{
			return $('#fhjf1').html();
			}
			}}">操作</th>
			</tr>
		</thead>
	</table>

	<script type="text/html" id="fhjf1">
  <a class="layui-btn layui-btn-ms "  lay-event="fenghao" onclick=fenghao();>封号</a>
</script>
	<script type="text/html" id="fhjf2">
  <a class="layui-btn layui-btn-ms "  lay-event="jiefeng" onclick=jiefeng();>解封</a>
</script>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" charset="utf-8"></script>
	<script>
		var $ = layui.jquery;
		$("[page]").click(function() {
			$("iframe").attr("src", $(this).attr("page"));
		});
	</script>



	<!-- 弹出层（ 修改） -->
	<div hidden id='update_user_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" id="update_name" name="facename"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<input type="text" id="update_sex" name="sex"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">年龄</label>
				<div class="layui-input-inline">
					<input type="text" id="update_age" name="userage"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>



	<!-- 弹出层 (增加)-->
	<div hidden id='insertdate_user_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_name" name="facename"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_sex" name="sex"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">年龄</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_age" name="userage"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var $ = layui.jquery;
		var table = layui.table;
		var layer = layui.layer;
		
		
		$("#checkBut").click(function() {
			var checktext = $("#checktext").val();
			table.reload("userlist", {
				url : "listuser",
				where : {
					"checktext" : checktext
				}
			})
		});

		function user_del() {
			//点击按钮获取选中行数据
			//checkStatus是layui定义的方法，获取选中行的数据
			var checkStatus = table.checkStatus('userlist').data
			//已选中，将数据发送到后台
			//获取id值 传递到controller--删除数据
			if (checkStatus.length > 0) {
				var checkid = checkStatus[0].faceid;
				$.post("deluser", {
					"faceid" : checkid
				}, function() {
					//重新加载列表
					layer.msg("删除成功");
					table.reload("userlist", {});
				});
			} else {
				//未选中
				//提示要选中
				layer.msg("请先选中数据")
			}
		}

		function user_update() {
			//checkStatus是layui定义的方法，获取选中行的数据
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].faceid;
				$("#update_name").val(checkdata[0].facename);
				$("#update_sex").val(checkdata[0].sex);
				$("#update_age").val(checkdata[0].userage);
				layer.open({
					title : "修改信息",
					type : 1,
					/*对应第一个div的id  */
					content : $("#update_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updateuser", {
							"faceid" : checkid,
							"facename" : $("#update_name").val(),
							"sex" : $("#update_sex").val(),
							"userage" : $("#update_age").val(),
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("修改成功");
							table.reload("userlist");
						});
					}
				});
			} else {
				//未选中
				//提示要选中
				layer.msg("请先选中数据");
			}
		}

		//增加
		function user_insert() {
			layer.open({
				title : "增加信息",
				type : 1,
				/*对应第一个div的id  */
				content : $("#insertdate_user_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("insertuser", {
						"facename" : $("#insertdate_name").val(),
						"sex" : $("#insertdate_sex").val(),
						"userage" : $("#insertdate_age").val(),
					}, function() {
						//关闭窗口
						layer.closeAll();
						//列表刷新
						layer.msg("增加成功");
						table.reload("userlist");
					});
				}
			});
		}

		//封号
		function fenghao(){
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].faceid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要封号吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post('fenghao', {
							"faceid" : checkid,
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("封号成功");
							table.reload("userlist");
						});
					}
				})
			};
		}

		//解封
		function jiefeng(){
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].faceid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要解封吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post('jiefeng', {
							"faceid" : checkid,
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("解封成功");
							table.reload("userlist");
						});
					}
				})
			};
		}
	</script>


</body>
</html>