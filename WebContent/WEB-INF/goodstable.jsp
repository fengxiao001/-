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
			placeholder="请输入ID或商品种类" autocomplete="off" class="layui-input">
		<button class="layui-btn layui-btn-normal" id='checkBut'>查询</button>
		<button class="layui-btn layui-btn-normal" onclick='goods_del()'>删除</button>
		<button class="layui-btn layui-btn-normal" onclick='goods_insert()'>增加</button>
		<button class="layui-btn layui-btn-normal" onclick='goods_update()'>修改</button>
	</div>
	 <table class="layui-table"
		lay-data="{url:'checkgoods',method:'post',toolbar:'#goodsbar',id:'userlist',page:true,}"
		lay-filter="filter">
		<thead>
			<th lay-data="{type:'checkbox'}"></th>
			<th lay-data="{field:'goodsid',sort:true}">商品ID</th>
			<th lay-data="{field:'classname',edit:'text'}" onclick="stock()">商品分类</th>
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
		</thead>
	</table> 

	



	<script type="text/html" id="shang">
 <a class="layui-btn layui-btn-ms "  lay-event="shangjia" onclick=shangjia();>上架</a>
<a class="layui-btn layui-btn-ms "  lay-event="shangjia" onclick=look();>查看</a>
</script>
	<script type="text/html" id="xia">
  <a class="layui-btn layui-btn-ms "  lay-event="xiajia" onclick=xiajia();>下架</a>
<a class="layui-btn layui-btn-ms "  lay-event="shangjia" onclick=look();>查看</a>
</script>

	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8"></script>

	<!-- 弹出层（ 修改） -->
	<div hidden id='update_upgoods_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品类名</label>
				<div class="layui-input-inline">
					<input type="text" id="updata_class" name="username"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>


	<!-- 弹出层 (增加)-->
	<div hidden id='insertdate_goods_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品种类</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_class" name="goodsname"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	
	
		<!-- 弹出层 (查看)-->
	<div hidden id='insertdate_look_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品种类</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_class" name="goodsname"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var $ = layui.jquery;
		var table = layui.table;
		var layer = layui.layer;
		
		/*删除 */
		function goods_del() {
			var checkStatus = table.checkStatus('userlist').data
			if (checkStatus.length > 0) {
				var goodsid = checkStatus[0].goodsid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要删除吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post("delgoods", {
							"goodsid" : goodsid
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

		/*查询  */
	 	$("#checkBut").click(function() {
			var checktext = $("#checktext").val();
			table.reload("userlist", {
				url : "checkgoods",
				where : {
					"checktext" : checktext
				}
			})
		}); 

		/*增加  */
		function goods_insert() {
			layer.open({
				title : "增加信息",
				type : 1,
				/*对应第一个div的id  */
				content : $("#insertdate_goods_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("insertgoods", {
						"classname" : $("#insertdate_class").val(),
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

		/*修改  */
		function goods_update() {
			//checkStatus是layui定义的方法，获取选中行的数据
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].goodsid;
				$("#updata_class").val(checkdata[0].classname);
				layer.open({
					title : "修改信息",
					type : 1,
					/*对应第一个div的id  */
					content : $("#update_upgoods_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updategoods", {
							"goodsid" : checkid,
							"classname" : $("#updata_class").val(),
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

		//商品上架
			function shangjia() {
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].goodsid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要上架吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post('shangjia', {
							"goodsid" : checkid,
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("上架成功");
							table.reload("userlist");
						});
					}
				})
			};
		}
		
		
		
		//商品下架
		function xiajia() {
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].goodsid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要下架吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post('xiajia', {
							"goodsid" : checkid,
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
		
	</script>
</body>
</html>