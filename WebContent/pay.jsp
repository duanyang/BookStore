<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,
com.imu.csbookstore.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单支付</title>
<link rel="stylesheet" type="text/css" href="detailCss/gouwu.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<script>
  function bac(sr){
	document.getElementById("first").src=sr;  
  }
  function bac1(sr){
	document.getElementById("book").src=sr;  
  }
  function bac2(sr){
	document.getElementById("MyMessage").src=sr;  
  }
  function bac3(p){
	document.getElementById("history").src=p;  
  }
  function bac4(p){
	document.getElementById("favorate").src=p;  
  }
  function bac5(p){
	document.getElementById("comment").src=p;  
  }
  function bac6(p){
	document.getElementById("bang").src=p;  
  }
</script>
<body>
<%
      	double totalPrice=(Double)request.getAttribute("totalPrice");
      	List<Delivery> deliveryList=(List<Delivery>)request.getAttribute("deliveryList"); 
    	List list=(List)request.getAttribute("list"); 
        
 %>
 <form name="payForm" method="post" action="ShoppingCartServlet?type=pay">
<div style="margin-bottom:20px">&nbsp;</div>
<div align="center">
<div style="margin-left:0px;margin-top:40px"><span style="padding-right:20px"><a href="First.jsp"><img src="images/logo.jpg" /></a></span><span ><img src="gouwucheImages/gouwulan2.jpg" /></span></div>
  </div>
<div style="width:990px;height:auto;display:table;margin-left:210px">
<img src="gouwucheImages/pay-top.jpg" />
<div style="border:#95c4f4 1px solid;margin-left:2px;width:927px" >
<table style="background:#A7CDF1;margin-left:30px;margin-top:30px;margin-bottom:30px;width:870px">
	<tr>
		<td><h3><b>收货人信息</b></h3></td>
	</tr>
	<tr>
		<td><table style="background:#ECFFFF;margin-left:20px;width:810px">
			<tr>
				<td><font  size="5" style="color:#A7CDF1"><b>常用地址</b></font></td>
			</tr>
			 <%
            	for(int j=0;j<deliveryList.size();j++){
                        		Delivery delivery=(Delivery)deliveryList.get(j);
                        		
            %>
            
			<tr>
				<td><input type="radio" name="delivery_id" style="margin-left:5px" value="<%= delivery.getUser_id()%>"/><a style="color:#A7CDF1"><b><%=delivery.getDelivery_name() %> &nbsp;<%=delivery.getDelivery_address() %>&nbsp;<%=delivery.getDelivery_phone() %>&nbsp;<%=delivery.getDelivery_zipcode() %></b></a></td>
			</tr>
			<%} %>
		</table>
		</td>
	</tr>
	<tr>
		<td><table style="margin-left:20px;width:810px">
			<tr>
				<td><font color="red">*</font><a>收货人姓名：</a><input name="delivery_name" type="text" style="height:30px;font-size:18px" /></td>
			</tr>
			<tr>
				<td><font color="red">*</font><a>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</a><input type="text" name="delivery_address" style="width:400px;height:30px;font-size:18px" /><font size="2">注：请详细填写地址</font></td>
			</tr>
			<tr>
				<td><font color="red">*</font><a>手机号码：&nbsp;&nbsp;</a><input type="text" name="delivery_phone" style="width:180px;height:30px;font-size:18px" /><font size="3">或者固定电话：</font><input type="text" name="delivery_phone1" style="width:180px;height:30px;font-size:18px" /><font size="2">用于接收发货通知短信及送货前确认</font></td>
			</tr>
			<tr>
				<td><a>电子邮箱：&nbsp;&nbsp;&nbsp;</a><input type="text" name="delivery_mail" style="width:280px;height:30px;font-size:18px" /><font size="2">用来接收订单提醒邮件，便于您及时了解订单状态</font></td>
			</tr>
			<tr>
				<td><a>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：&nbsp;</a><input type="text" name="delivery_zipcode" style="width:150px;height:30px;font-size:18px" /><font size="2">有助于快速确定送货地址</font></td>
			</tr>
			<tr>
				<td><input type="button" onclick= "payForm.action='DeliveryServlet?type=addWhenPay';payForm.submit();" value="[添加到常用联系人]"></input></td>
			</tr>
			<tr>
				<td><img src="gouwucheImages/save.jpg" style="margin-left:10px"/></td>
			</tr>
		</table>
		</td>
	</tr>
	</table>
	<div style="margin-left:40px"><h1><b>商品清单</b></h5></div>
	
	<table style="margin-left:40px;width:830px;text-align:center">
		<tr style="background:#FFB5B5;height:30px">
			<td>商品编号</td><td>商品名称</td><td>云影价</td><td>数量</td>
		</tr>
		<% 
		if(list!=null){
        	for(int i=0;i<list.size();i++){
        		ShoppingCart cart= (ShoppingCart)list.get(i);
        %>
		<tr style="height:40px">
			<td><%=cart.getBook_id() %></td><td><%=cart.getBook_name() %></td><td>￥<%=cart.getBook_price() %></td><td><%=cart.getBook_number() %></td>
		</tr>
		<%}} %>
	</table>
	
		<div style="margin-left:40px;margin-bottom:40px;width:830px;background:#FFB5B5"><h1><b>结算信息</b></h5>
			<div style="margin-left:40px;border-bottom:2px dotted #ADADAD">
			<h2><b>商品金额：<%=totalPrice %>元+运费：10.00元</b></h2>
			</div>
			<div style="">
			<h2 align="right" style="margin-right:50px"><b>应付金额：<font color="red">￥<%=totalPrice+10 %>元</b></font></h2>
			<input type="hidden" name="indent_price" value="<%=totalPrice%>">
			</div>
			<div style="text-align:right;margin-right:40px"><a href="#" onclick= "payForm.action='ShoppingCartServlet?type=pay';payForm.submit();"><img src="gouwucheImages/tijiao.jpg" /></a></div>
			<div>&nbsp;</div>
		</div>
</div>
</div>

<div class="bangzhu"><a href="#" target="_blank"><img src="shangpinImages/bottom1.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom2.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom3.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
</form>
  </body>
</html>
