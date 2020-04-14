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
		<title>我的购物车-小米商城</title>
	    <base href="<%=basePath%>">
		 <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
	</head>
	<body>
	 <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>

        <div class="cartBox">
            <div class="shop_info">
                <div class="all_check">
                    <!--店铺全选-->
                    <input type="checkbox" id="shop_a" class="shopChoice">
                    <label for="shop_a" class="shop"></label>
                </div>
                <div class="shop_name">
                  <a href="javascript:;">小米购物车</a>
                </div>
            </div>
            <div class="order_content">
               <c:forEach  items="${checkcar}" var="pro">
                <ul class="order_lists">
                    <li class="list_chk">
                       <input type="hidden" name="mana_id" value="${pro.shoppingid}"/>
                        <input type="hidden" name="pro_id" value="${pro.proid}"/>
                        <input type="hidden" name="gcimg" value="${pro.imgname}"/>
                         <input type="hidden" name="gcname" value="${pro.proname}"/>
                          <input type="hidden" name="gcmoney" value="${pro.proprice}"/>
                          <input type="checkbox" id="${pro.shoppingid }"
                          class="son_check" name="checkbox">
                        <label for="${pro.shoppingid }"></label>
                    </li>
                    <li class="list_con">
                 
                        <div class="list_img"><a href="javascript:;"><img src="file/${pro.imgname }" alt="" ></a></div>
                        <div class="list_text"><a href="javascript:;">${pro.proname}</a></div>
                    </li>
           
                    <li class="list_info">
                        <p>规格：默认</p>
                        <p>尺寸：16*16*3(cm)</p>
                    </li>
                    <li class="list_price">
                        <p class="price">￥${pro.proprice}</p>
                    </li>        
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty" onclick="jian(${pro.shoppingid})">-</a>
                            <input type="text"  min="0" value="${pro.count}" class="sum" name="gcsum">
                            <a href="javascript:;" class="plus" onclick="jia(${pro.shoppingid})">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">￥${pro.proprice*pro.count}</p>
                    </li>
                    <li class="list_op">
                    <!--执行js方法 获取shoppingid-->
                        <p class="del"><a href="javascript:delete1(${pro.shoppingid});" class="delBtn">移除商品</a></p>
                    </li>
                </ul>
                      </c:forEach>
            </div>
        </div>

        <!--底部-->
        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <div class="calBtn"><a href="javascript:;"  onclick="hgzs()">结算</a></div>
            </div>
        </div>
    </section>
   
    <script src="js/jquery.min.js"></script>
    <script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/carts.js"></script>
    <script type="text/javascript">
    //删除商品信息
    function delete1(shoppingid){
        	$.ajax({
        		url:"delete/"+shoppingid,
        		success:function(result){
        			window.location.href="/springmvc2/top/gouwuche";
        		}
        	})
        }
    
    //数量减
    function jian(shoppingid){
    	$.post("jian_num",{
    		"shoppingid":shoppingid,
    	});
    }
    
    
    //数量加
    function jia(shoppingid){
    	$.post("jia_num",{
    		"shoppingid":shoppingid,
    	});
    }
   
    function hgzs(){
    	
		var val = $('input:checkbox[name="checkbox"]:checked').val();
		var length = $('input:checkbox[name="checkbox"]:checked').length;
		
		if (val == null) {
			layer.msg("您还没有选中要结算的货物");
		} else {
			var arr = new Array();
			const map = new Map();
			$('input:checkbox[name="checkbox"]:checked').each(function(){ 
			var mana_id=$(this).parents('li').find("[name='mana_id']").val();
			var pro_id=$(this).parents('li').find("[name='pro_id']").val();
			var gcimg=$(this).parents('li').find("[name='gcimg']").val();
			var gcname=$(this).parents('li').find("[name='gcname']").val();
			var gcsum=$(this).parents('li').parents('ul').find(".list_amount").find(".amount_box").find("[name='gcsum']").val();
			var gcmoney=$(this).parents('li').find("[name='gcmoney']").val();
			map.set("shoppingid",mana_id);
			map.set("imgname",gcimg);
			map.set("proname",gcname);
			map.set("count",gcsum);
			map.set("proprice",gcmoney);
			map.set("proid",pro_id);
			let obj = Object.create(null);
			for(let[k,v] of map){
				obj[k] = v ;
			} 
			//console.log(obj);
			arr.push(obj);
			});
		 
			
			 var json = JSON.stringify(arr);
			 $.ajax({
		            url:"fukuan",
		            type:"POST",
		            contentType: "application/json;charset=utf-8",
		            data:json,
		            async:false,
		            dataType: "json",
		            success:function () {
		            	 window.location.href = 'dingdan1';
		            },
		            error:function () {
		            	 console.log("跳转失败");
		            }
		        });
		}
	}
    </script>
   
	</body>
</html>
