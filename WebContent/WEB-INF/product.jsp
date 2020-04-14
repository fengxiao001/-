<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<title>Insert title here</title>
<style type="text/css">
.layui-table-cell{
height:auto!important;
white-space:normal;
}
</style>
</head>
<body>
	<div>
		<input id='checktext' required lay-verify="required"
			placeholder="请输入ID或商品名称" autocomplete="off" class="layui-input">
		<button class="layui-btn layui-btn-normal" id='checkBut'>查询</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_del()'>删除</button>
		<a href="http://localhost:8080/springmvc2/file">
		<button class="layui-btn layui-btn-normal"  onclick='pro_add()' >增加</button>
		</a>
		<button class="layui-btn layui-btn-normal" onclick='pro_update()'>修改</button>
	</div>
	<table class="layui-table"
		lay-data="{url:'checkpro',method:'post',toolbar:'#probar',id:'userlist',page:true,}"
		lay-filter="filter">
		<thead>
			<th lay-data="{type:'radio'}"></th>
			<th lay-data="{field:'proid',sort:true}">商品ID</th>
			<th lay-data="{field:'proname',edit:'text'}">商品名</th>
			<th lay-data="{field:'proprice',edit:'text'}">商品单价</th>
			<th lay-data="{field:'classname',edit:'text'}">商品分类</th>
			<th lay-data="{field:'prostock',edit:'text'}">商品库存</th>
			<th lay-data="{field:'imgname',templet:'#demo1' }">图片</th>
			<th
					lay-data="{field:'state',templet:function(d){
			if(d.state==1){
			return '上架';
			}else{
			return '下架';
			}
			}}">状态</th>
			<th
					lay-data="{templet:function(d){
			if(d.state==0){
			return $('#shang').html();
			}else{
			return $('#xia').html();
			}
			}}">操作</th>
			</tr>
		</thead>
	</table>
	<script type="text/html" id="shang">
  <a class="layui-btn layui-btn-ms "  lay-event="shangjia" onclick=shangjia();>上架</a>
</script>
	<script type="text/html" id="xia">
  <a class="layui-btn layui-btn-ms "  lay-event="xiajia" onclick=xiajia();>下架</a>
</script>

<script type="text/html" id="demo1">
 <div><img src="./file/{{d.imgname}}"></div>
</script>

<!-- 弹出层 (增加)-->
	<div hidden id='insertdate_pro_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品名</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_name" name="username"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品单价</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_price" name="usersex"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品分类</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_class" name="userage"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_stock" name="userage"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>



	<!-- 弹出层（ 修改） -->
	<div hidden id='update_pro_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品名</label>
				<div class="layui-input-inline">
					<input type="text" id="update_name" name="username"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品单价</label>
				<div class="layui-input-inline">
					<input type="text" id="update_price" name="usersex"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品分类</label>
				<div class="layui-input-inline">
					<input type="text" id="update_classid" name="usersex"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-inline">
					<input type="text" id="update_stock" name="userage"
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
		//查询
		$("#checkBut").click(function() {
			var checktext = $("#checktext").val();
			table.reload("userlist", {
				url : "checkpro",
				where : {
					"checktext" : checktext
				}
			})
		});

		
		
		/*修改  */
		function pro_update() {
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var proid = checkdata[0].proid;
				$("#update_name").val(checkdata[0].proname);
				$("#update_price").val(checkdata[0].proprice);
				$("#update_class").val(checkdata[0].proclass);
				$("#update_stock").val(checkdata[0].prostock);
				layer.open({
					title : "修改信息",
					type : 1,
					content : $("#update_pro_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("uppro", {
							"proid" : proid,
							"proname" : $("#update_name").val(),
							"classid" : $("#update_classid").val(),
							"prostock" : $("#update_stock").val(),
							"proprice" : $("#update_price").val(),
						}, function() {
							//关闭窗口
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("userlist");
						});
					}
				});
			} else {
				layer.msg("请先选中数据");
			}
		}

		//商品下架
		function xiajia() {
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].proid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要下架吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post('xiajia1', {
							"proid" : checkid,
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("下架成功");
							table.reload("userlist");
						});
					}
				})
			}
			;
		}

		//商品上架
			function shangjia() {
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].proid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要上架吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post('shangjia1', {
							"proid" : checkid,
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("上架成功");
							table.reload("userlist");
						});
					}
				})
			}
			;
		}
		
		//删除
		function pro_del() {
			var checkStatus = table.checkStatus('userlist').data
			if (checkStatus.length > 0) {
				var checkid = checkStatus[0].proid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要删除吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post("delpro", {
							"proid" : checkid
						}, function() {
							layer.closeAll();
							//重新加载列表
							table.reload("userlist");
							layer.msg("删除成功");
						});
					}
				})
			} else {
				layer.msg("请先选中数据")

			}
			;
		}
		
	    function pro_add(){
			var url="http://localhost:8080/springmvc2/file";
			window.location.href=url;
		} 
	</script>
</body>
</html>