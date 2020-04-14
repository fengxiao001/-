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
<link rel="stylesheet" href="css/tasp.css" />
<link href="css/orderconfirm.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/index1.css" />
<link rel="stylesheet" type="text/css" href="css/dibu.css" />
<link rel="icon" href="img/mi.png">
<title>订单</title>
</head>
<body style="background-color: white;">
	<div class="page_top">
		<!-- 最上层黑色导航 -->
		<div class="page_left">
			<a href="#">小米商城</a><span class="sep">|</span> <a href="#">MIUI</a><span
				class="sep">|</span> <a href="#">loT</a><span class="sep">|</span> <a
				href="#">云服务</a><span class="sep">|</span> <a href="#">金融</a><span
				class="sep">|</span> <a href="#">有品</a><span class="sep">|</span> <a
				href="#">小爱开放平台</a><span class="sep">|</span> <a href="#">企业团购</a><span
				class="sep">|</span> <a href="#">资质证照</a><span class="sep">|</span>
			<a href="#">协议规则</a><span class="sep">|</span> <a href="#">下载app</a><span
				class="sep">|</span> <a href="#">Select Location</a>
		</div>
		<div class="page_right">

			<a href="top/dizhi">用户名:${sessionScope.userlogin.facename}</a><span class="sep">|</span>
			<a href="top/gouwuche"><img
				src="img/shopping_basket_72px_1230836_easyicon.net.ico"
				style="transform: translateY(0);" height="18px">购物车</a>
		</div>
	</div>
	<div class="div_dh" style="height: 100px;">
		<div class='div_img'>
			<a href="index2"><img src="img/mi.png"></a>
		</div>
		<div class='div_ul_dh' style="height: 100px; line-height: 100px">
			<ul class="ul_dh">
				<li><span
					style="height: 100px; line-height: 100px; font-size: 30px"><b>订单</b></span></li>
				<li></li>
				<li><span style="height: 100px; line-height: 100px">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算
				</span></li>
			</ul>
		</div>
	</div>
	<!-- -------------------------------------订单主体-------------------------------------- -->
	<div id="page" style="width: 1000px">
		<div id="content" class="grid-c">
			<div id="address" class="address" style="margin-top: 20px;"
				data-spm="2">
				<h3>
					确认收货地址 <span class="manage-address">
						<button title="修改地址" class="J_MakePoint layui-btn layui-btn-warm"
							onclick="adddz()" href="JavaScript:void(0);">新增地址</button>
					</span>
				</h3>
				<div id="orderdz">
					<table class="layui-table">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>收货人</th>
								<th>手机号</th>
								<th>收货地址</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dz}" var="dz">
								<tr>
									<td><input type="radio" name="classId" onclick="xuanze()" /></td>
									<td name="dname">${dz.dname}</td>
									<td name="dtel">${dz.dtel}</td>
									<td name="ddz">${dz.ddz}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			<form id="J_Form" name="J_Form"
				action="/auction/order/unity_order_confirm.htm" method="post">
				<div>
					<h3 class="dib">确认订单信息</h3>
					<table cellspacing="0" cellpadding="0" class="order-table"
						id="J_OrderTable">
						<thead>
							<tr>
								<th class="s-title">商品
									<hr />
								</th>
								<th class="s-price">单价(元)
									<hr />
								</th>
								<th class="s-amount">数量
									<hr />
								</th>
								<th class="s-agio">优惠方式(元)
									<hr />
								</th>
								<th class="s-total">小计(元)
									<hr />
								</th>
							</tr>
						</thead>
						<tbody data-spm="3" class="J_Shop" data-tbcbid="0"
							data-outorderid="47285539868" data-isb2c="false"
							data-postMode="2" data-sellerid="1704508670">
							<tr class="first">
								<td colspan="5"></td>
							</tr>
							<tr class="shop blue-line">
								<td colspan="2" class="promo">
									<div>
										<ul class="scrolling-promo-hint J_ScrollingPromoHint">
										</ul>
									</div>
								</td>
							</tr>
							<c:forEach items="${list}" var="list">
								<tr class="item" data-pointRate="0">
									<td class="s-title"><a href="#" class="J_MakePoint"> <img
											src="file/${list.imgname}" class="itempic"><span
											class="title J_MakePoint">${list.proname}</span></a></td>
									<td class="s-price">${list.proprice}</td>

									<td class="s-amount">${list.count}</td>
									<td class="s-agio">
										<div class="J_Promotion promotion" data-point-url="">无优惠</div>
									</td>
									<td class="s-total shoplist" style="text-align: center"><input
										type="hidden" name="gcsum" value="${list.count}"> <input
										type="hidden" name="mana_id" value="${list.proid}"> <input
										type="hidden" name="gcimg" value="${list.imgname}"> <input
										type="hidden" name="gcmoney" value="${list.proprice}">
										<input type="hidden" name="gcname" value="${list.proname}">
										<span name="xiaoji">${list.count*list.proprice}</span></td>

								</tr>
							</c:forEach>
							<tr class="item-service">
								<td colspan="5" class="servicearea" style="display: none"></td>
							</tr>
							<tr class="blue-line" style="height: 2px;">
								<td colspan="5"></td>
							</tr>
							<tr class="other other-line">
								<td colspan="5">
									<ul class="dib-wrap">
										<li class="dib user-info">
											<ul class="wrap">
												<li>
													<div class="field gbook">
														<label class="label">给卖家留言：</label>
														<textarea style="width: 350px; height: 80px;"
															title="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）" name=""></textarea>
													</div>
												</li>
											</ul>
										</li>
										<li class="dib extra-info">

											<div class="shoparea">
												<ul class="dib-wrap">
													<li class="dib title">店铺优惠：</li>
													<li class="dib sel"><div
															class="J_ShopPromo J_Promotion promotion clearfix"
															data-point-url="http://log.mmstat.com/buy.1.16"></div></li>
													<li class="dib fee"><span class='price '> -<em
															class="style-normal-bold-black J_ShopPromo_Result">0.00</em>
													</span></li>
												</ul>
											</div>
											<div class="extra-area">
												<ul class="dib-wrap">
													<li class="dib title">发货时间：</li>
													<li class="dib content">卖家承诺订单在买家付款后，72小时内<a href="#">发货</a></li>
												</ul>
											</div>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">

									<div class="order-go" data-spm="4">
										<div class="J_AddressConfirm address-confirm">
											<div class="kd-popup pop-back" style="margin-bottom: 40px;">
												<div class="box">
													<div class="bd">
														<div class="point-in">

															<em class="t">实付款：</em> <span class='price g_price '>
																<span>&yen;</span><em class="style-large-bold-red"
																id="J_ActualFee"><span id="shifukuan"
																	name="currentDate"></span></em>
															</span>
														</div>

														<ul>
															<li><em>寄送至:</em><span name="shouhuodizhi"
																id="J_AddrConfirm" style="word-break: break-all;">
															</span></li>

														</ul>
													</div>
												</div>
												<a id="J_Go" class=" btn-go" data-point-url="" tabindex="0"
													title="点击此按钮，提交订单。" onclick="tijiao()">提交订单<b
													class="dpl-button"></b></a>
											</div>
										</div>
										<div class="msg" style="clear: both;">
											<p class="tips naked" style="float: right; padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
										</div>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</div>
	<br>
	<!-- 新增的弹出层 -->
	<div hidden id="insert_id_div" style="width: 350px">
		<div class="layui-form-item">
			<label class="layui-form-label">收货人:</label>
			<div class="layui-input-block">
				<input type="text" name="title" required lay-verify="required"
					placeholder="请输入收货人姓名" autocomplete="off" class="layui-input"
					id="insert_name" style="width: 200px" />
			</div>
			<label class="layui-form-label">手机号:</label>
			<div class="layui-input-block">
				<input type="text" name="title" required lay-verify="required"
					placeholder="请输入手机号" autocomplete="off" class="layui-input"
					oninput="value=value.replace(/[^\d]/g,'')" maxlength="11"
					id="insert_tel" style="width: 200px" />
			</div>
			<label class="layui-form-label">收货地址:</label>
			<div class="layui-input-block">
				<input type="text" name="title" required lay-verify="required"
					placeholder="请输入收货地址" autocomplete="off" class="layui-input"
					id="insert_dz" style="width: 200px" />
			</div>
		</div>

	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;
		var layer = layui.layer;
		window.onload = function() {
			var sum = [];
			$("[name='xiaoji']").each(function(i, n) {
				var xj = $(this).text();
				sum.push(xj);
			});
			var b = 0;
			for (var i = 0; i < sum.length; i++) {
				b += parseInt(sum[i]);
			}
			$("#shifukuan").text(b);
		}

		function adddz() {
			$("#insert_name").val("");
			$("#insert_tel").val("");
			$("#insert_dz").val("");

			layer.open({
				title : "新增地址",
				type : 1,
				content : $("#insert_id_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.ajax({
						url : "order_add_dz",
						type : 'POST',
						async : false, //同步请求
						data : {
							"dname" : $("#insert_name").val(),
							"dtel" : $("#insert_tel").val(),
							"ddz" : $("#insert_dz").val(),
						},
						success : function(date) {

							window.location.reload();
						},
						error : function() {
							layer.closeAll();
							window.location.reload();
						}
					});
				}
			});
		}

		function xuanze() {
			var radioname = $("input[name='classId']:checked").parents("td")
					.parents("tr").find("[name='dname']").text();
			var radiotel = $("input[name='classId']:checked").parents("td")
					.parents("tr").find("[name='dtel']").text();
			var radiodz = $("input[name='classId']:checked").parents("td")
					.parents("tr").find("[name='ddz']").text();

			$("span[name='shouhuodizhi']").each(function() {
				$(this).text(radioname + radiotel + radiodz);
			});
		}
		function tijiao() {
			var val = $('input:radio[name="classId"]:checked').val();
			if (val == null) {
				layer.msg("请先选择收货地址");
			} else {
				var row1 = [];
				var row2 = [];
				var row3 = [];
				var row4 = [];
				var row5 = [];
				$('.shoplist').each(function(index) {
					row1.push($(this).find('[name="gcsum"]').val());
					row2.push($(this).find('[name="mana_id"]').val());
					row3.push($(this).find('[name="gcimg"]').val());
					row4.push($(this).find('[name="gcmoney"]').val());
					row5.push($(this).find('[name="gcname"]').val());

				});

				var shdz = $("#J_AddrConfirm").text();
				var sfk = $("#shifukuan").text();
				for (var i = 0; i < row1.length; i++) {
					var count = row1[i];
					var proid = row2[i];
					var imgname = row3[i];
					var proprice = row4[i];
					var proname = row5[i];
					$.ajax({
						type : 'post',
						url : "top/car_fukuan",
						data : {
							"proid" : proid,
							"procount" : count,
							"proprice" : proprice,
							"proname" : proname,
							"imgname" : imgname,
							"dddz" : shdz,
							//"order_comname" : comname,
							"sfk" : sfk
						},
						async : false,
						dataType : "json",

						error : function(xhr, status, errMsg) {

						},
					//window.location.href = 'success';

					});
				}
				//console.log(shdz);
				//	console.log(sfk);
				var form = $("<form>"); //定义一个form表单<form></from>
				form.attr('style', 'display:none'); //在form表单中添加查询参数<form style="display:none"></from>
				form.attr('method', 'post');
				form.attr('action', 'fukuan12');
				$('body').append(form); //将表单放置在body中
				var input = $("<input>");
				input.attr('name', "shdz");
				input.attr('value', shdz);
				$('form').append(input); //将input放置在form中
				var input = $("<input>");
				input.attr('name', "sfk");
				input.attr('value', sfk);
				$('form').append(input); //将input放置在form中
				form.submit(); //表单提交   
			}
		}
	</script>
</body>
</html>