<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,
com.imu.csbookstore.service.*,com.imu.csbookstore.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/index_default.css">
	
      <title>云影书城</title>
      <link rel="stylesheet" type="text/css" href="css/index_style.css"/>
  </head>
  
  <body>
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
</head>
  
  <body bgcolor="#FFFFFF">
<div class="head"><!---head,search bar--->
    <div class="search">
    <form name="secrchForm" action="" method="post">
       <div class="text"><input name="keyWords" id="key" type="text" value=""/></div>
       <div class="sousuo">
        <input id="Button1" value="" type="image"                                          
        src="images/search.jpg" align=absMiddle border=0
        onclick= "secrchForm.action='BookServlet?type=search';secrchForm.submit(); "
        />
      </div>
    </form>
     </div>
    <div class="hea">
     <span class="huo"><a href="#">我的账户</a></span><span class="huo"><a href="#">云影活动</a></span><span class="huo"><a href="#">好友邀请</a></span><span class="huo"><a href="#">客服中心</a></span><span class="huo"><a href="#">收藏本站</a></span>    </div>
<div class="hea2">
	<%
		if(session.getAttribute("user")!=null){
		User user=(User)session.getAttribute("user");
	%>
		<span><%=user.getUser_name()%>，欢迎来云影书城！&nbsp;[<a href="UserServlet?type=exit" id="exit-button">退出</a>]</span>   
		 </div>
	<% }else{%>
      <span>您好，欢迎来云影书城！&nbsp;[<a href="login.jsp" id="login-button">请登录</a>]&nbsp;&nbsp;&nbsp;[<a href="regist.jsp">免费注册</a>]</span>    </div>
	  <%}%>
</div><!---head--->
<div class="navi"><!---navigation--->
   <div class="navi_center" >
     <table width="947" height="41" border="0" cellpadding="0" cellspacing="0" >
        <tr>
             <td width="106" height="28"><a href="main.jsp"><img src="images/first.gif" width="106" height="41" onMouseOver="bac('images/first1.gif')" onMouseOut="bac('images/first.gif')" id="first"/></a></td>
             <td width="106"><a href="book_list.jsp"><img src="images/book.gif" width="106" height="41"   onmouseover="bac1('images/book1.gif')" onMouseOut="bac1('images/book.gif')" id="book"/></a></td>
             <td width="106"><a href="UserServlet?type=personalInfo"><img src="images/MyMessage.gif" width="106" height="41" onMouseOver="bac2('images/MyMessage1.gif')" onMouseOut="bac2('images/MyMessage.gif')" id="MyMessage"/></a></td>
             <td width="106"><a href="IndentServlet?type=list"><img src="images/history.gif" width="106" height="41" id="history" onMouseOver="bac3('images/history1.gif')" onMouseOut="bac3('images/history.gif')"/></a></td>
             <td width="106"><a href="FavorateServlet?type=personalFavorate"><img src="images/favorate.gif" width="106" height="41" id="favorate" onMouseOver="bac4('images/favorate1.gif')" onMouseOut="bac4('images/favorate.gif')"/></a></td>
             <td width="106"><a href="bookshadow.jsp"><img src="images/comment.gif" width="106" height="41" id="comment" onMouseOver="bac5('images/comment 1.gif')"  onmouseout="bac5('images/comment.gif')"/></a></td>
             <td width="422"><a href="help.jsp"><img src="images/bangzhu.gif" width="66" height="41" id="bang" onMouseOver="bac6('images/bangzhu1.gif')" onMouseOut="bac6('images/bangzhu.gif')"/></a></td>
             <td width="460"><a href="ShoppingCartServlet?type=list">购物车</a></td>
       </tr> 
     </table>
  </div>
</div><!---navigation--->

<%
	SessionChecker sessionChecker = new SessionChecker(request);
	if(!sessionChecker.checkUser())
		response.sendRedirect("login.jsp");
	int user_id=sessionChecker.getUser_id();
	UserService userService=new UserService();
	User user=userService.getUserByUserId(user_id);
	DeliveryService deliveryService=new DeliveryService();
	List deliveryList=deliveryService.searchDeliveryByUser(user_id);
 %>

<div class="tab">
    <div class="font_design">我的云影 <span class="detail"> &gt;我的信息</span> </div>
</div>
<div class="tab_line"></div>
<div class="ta_content">
  <div class="left">
  <form method="post" action="UserServlet?type=user_modify">
  <input type="hidden" name="user_id" value="<%=user.getUser_id()%>">
  <input type="hidden" name="user_name" value="<%=user.getUser_name()%>">
    <table>
     <tr>
      <td><img src="images/1_4.png"></td><td><span style="color:#CE0000; font-weight:bold; font:'楷体'; font-size:24px; "> 我的信息</span></td>
    </tr>
    </table>
    
    <table width="590px"  style="color:#000000; font: '宋体'; font-size:18px; font-weight:bold;">
      <tr>
        <td width="80">用户ID：</td><td><%=user.getUser_id() %></td><td>用户名：</td><td><%=user.getUser_name() %></td><td></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
          <td width="80px">邮箱：</td><td><input name="user_mail" type="text" height="40px" value="<%=user.getUser_mail() %>"></td>
          <td width="80px">密码：</td><td><input name="user_pass" type="text" height="40px" value="<%=user.getUser_pass() %>"></td>
          <td></td>   
          <td><input name="" type="submit"  value="修改"></td>
      </tr>
    </table>
    
    </form>
      <br>
     <table>
     <tr>
      <td><img src="images/1_6.png"></td><td><span style="color:#CE0000; font-weight:bold; font:'楷体'; font-size:24px; ">收货地址</span></td><td><div class="footdesign1"><a href="addAddress.jsp">新增地址</a></div></td>
     </tr>
    </table>
   
    <table width="590px"  style="color:#000000; font: '宋体'; font-size:18px; font-weight:bold;" >
     <tr>
    <td width="70px" align="center">收货人</td><td width="150px" align="center">地址</td><td width="50px" align="center">手机</td><td width="20px" align="center">邮编</td><td width="130px" align="center" >操作</td>
   
   <% for(int i=0;i<deliveryList.size();i++){
   		Delivery delivery=(Delivery)deliveryList.get(i);
   %>
    </tr>
     <tr><td width="70px" align="center"><%=delivery.getDelivery_name() %></td><td width="150px" align="center"><%=delivery.getDelivery_address() %></td><td width="50px" align="center"><%=delivery.getDelivery_phone() %></td>
     <td width="50px" align="center"><%=delivery.getDelivery_zipcode() %></td>
     <td width="130px" align="center"><span  class="footdesign"><a href="DeliveryServlet?type=user_modify&&delivery_id=<%=delivery.getDelivery_id()%>"> 修改</a>&nbsp;
     <a href="DeliveryServlet?type=user_delete&&delivery_id=<%=delivery.getDelivery_id()%>">删除</a></span></td>
     </tr>
     <%} %>
    </table> 
   
  </div>
   <div class="right">
    <img src="images/back.jpg" style=" float:right;margin-right:0px;">
   </div>
    

<div class="bangzhuinf"><div class="detail"><img src="goods/bottom1.gif" /><img src="goods/bottom2.gif" /><img src="goods/bottom3.gif" /><img src="goods/bottom4.gif" /></div>
</div>
<div class="guanyuinf"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
</body></html>
