<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,
com.imu.csbookstore.service.*,com.imu.csbookstore.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>收藏夹</title>
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

<div>
<div class="head"><!---head--->
   <div class="hea">
     <span class="huo"><a href="#">我的账户</a></span><span class="huo"><a href="#">云影活动</a></span><span class="huo"><a href="#">好友邀请</a></span><span class="huo"><a href="#">客服中心</a></span><span class="huo"><a href="#">收藏本站</a></span>
   </div>
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
   <div class="navi_center">
     <table width="947" height="41" border="0" cellpadding="0" cellspacing="0">
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
       </tr> 
     </table>
  </div>
</div><!---navigation--->
<%
	SessionChecker sessionChecker = new SessionChecker(request);
	if(!sessionChecker.checkUser())
		response.sendRedirect("login.jsp");
	int user_id=sessionChecker.getUser_id();
	if(request.getParameter("indent_id")==null){
		response.sendRedirect("error.jsp");
	}
	
	int indent_id=Integer.parseInt(request.getParameter("indent_id"));
	IndentService indentService=new IndentService();
	Indent indent=indentService.getIndentByIndentId(indent_id);
	IndentDetailsService indentDetailService=new IndentDetailsService();
	List indentDetailList=indentDetailService.listIndentDetailsByIndentDetailsID(indent_id);
 	
 %>
 <%=indent_id %>
 <%=indentDetailList.size() %>
<div class="cur">
  <span id="one"><font color="#000000" size="+2" style="font-weight:bold">我的云影>历史订单>详细订单</font></span>
</div>
<div class="fav_biaoti" style="margin-top:30px;margin-left:200px"><a style="margin-left:10px;font-weight:bold">编号</a><a style="margin-left:50px;font-weight:bold">名&nbsp;称</a><a style="margin-left:95px;font-weight:bold">单&nbsp;价</a><a style="margin-left:35px;font-weight:bold">数&nbsp;量</a><a style="margin-left:65px;font-weight:bold">日&nbsp;&nbsp;期</a><span><span><a>收&nbsp;货&nbsp;信&nbsp;息</a></span></span></div>
  <table width="940" height="40px" border="0" cellpadding="0" cellspacing="0" style="margin-left:200px;border-bottom:#95c4f4 0px dashed;text-align:center">
   <%
   		if(indentDetailList!=null){
   		for(int i=0;i<indentDetailList.size();i++){
   			IndentDetails indentDetails=(IndentDetails)indentDetailList.get(i);
   			int book_id=indentDetails.getBook_id();
   			BookService bookServie=new BookService();
   			Book book=bookServie.getBookByBookId(book_id);
   			DeliveryService deliveryService=new DeliveryService();
   			Delivery delivery=deliveryService.getDeliveryByDeliveryID(indent.getDelivery_id());
    %>
    <tr>
      <td style="width:30px"><%=i+1 %></td>
      <td style="width:150px"><%=book.getBook_name() %></td>
      <td style="width:90px"><font color="#FF0000">￥<%=indentDetails.getPrice() %>元</font></td>
      <td style="width:50px"><%=indentDetails.getNumber() %></td>
      <td style="width:150px"><%=indent.getIndent_date() %></td>
      <td><%=delivery.getDelivery_name() %>（收）&nbsp;&nbsp;<%=delivery.getDelivery_address() %></td>
    </tr>
    <%}} %>
     <tr style="margin-top:10px">
      <td style="width:30px"></td>
      <td style="width:150px"></td>
      <td style="width:90px"><font color="#FF0000"></font></td>
      <td style="width:50px"></td>
      <td style="width:150px"></td>
      <td><font color="red" style="font-size:22px"><b>商品金额：<%=indent.getIndent_price() %>元+运费：10.00元=<%=indent.getIndent_price()+10 %>元</b></font></td>
    </tr>
  </table>
  <div style="text-align:right;margin-top:20px;margin-right:350px"><a href="IndentServlet?type=list"><img src="gouwucheImages/back.jpg" width=100px/></a></div>

<div class="bangzhu"><a href="#" target="_blank"><img src="shangpinImages/bottom1.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom2.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom3.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
</body>
</html>
