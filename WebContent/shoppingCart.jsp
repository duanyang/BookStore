<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,com.imu.csbookstore.util.*,
com.imu.csbookstore.service.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
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
    function sum(str)
  {
    var singleprice=document.getElementById("single_price"+str).innerHTML;
    var num=document.getElementById("book_number"+str).value;
    var summoney=num*singleprice;
    document.getElementById("summoney"+str).innerHTML=summoney;
    
    
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

<div class="gou">
<form method="post" action="" name="cartForm">
  <div class="gou1"><img src="gouwucheImages/gouwuche.jpg" /></div>
  <div class="gou_biaoti"><span style="margin-left:60px">简&nbsp;图</span><span>商品名称</span><span>单价</span><span>数量</span><span>总价</span><span>日期</span></div>

 	<%
 	
    	List list=(List)request.getAttribute("list"); 
    	double totalPrice=(Double)request.getAttribute("totalPrice");
    
    	
        if(list!=null){
        	for(int i=0;i<list.size();i++){
        		ShoppingCart cart= (ShoppingCart)list.get(i);
        		BookService bookService=new BookService();
        		Book book=bookService.getBookByBookId(cart.getBook_id());
        		int book_numberInDB=book.getBook_number();
        		String date=cart.getDate();
        		String str="";
    %>
  <table width="965" height="96" border="0" cellpadding="0" cellspacing="0" style="border-bottom:#95c4f4 1px dashed">
    <tr>
      <td width="21" height="34">&nbsp;</td>
      <td width="95" rowspan="3">
     <img src="<%="BookImages/" + cart.getBook_locationName() %>" width="90" height="90">
      <td width="160">&nbsp;</td>
      <td width="82">&nbsp;</td>
      <td width="77">&nbsp;</td>
      <td width="100">&nbsp;</td>
      <td width="140">&nbsp;</td>
      <td width="62">&nbsp;</td>
    </tr>
    <tr>
      <td height="15"> &nbsp;</td>
      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cart.getBook_name() %></td>
      <% str="single_price"+i; %>
      <td><font color="#FF0000">￥<span id="<%=str %>"><%=cart.getBook_price() %></span></font></td>
      <td>&nbsp;&nbsp;
      <label>
   		 <% str=""; %>
        <% str="book_number"+i; %>                             
        <select name="book_number<%=cart.getBook_id() %>" id="<%=str %>" onMouseout="sum(<%=str.substring(str.length()-1)%>)">
        <% for(int j=1;j<=book_numberInDB;j++){%>
          <option value="<%=j %>" <% if(j==cart.getBook_number()){%>selected <%} %>><%=j %></option>
         <%} %>
        </select>
      </label>
     <input type="hidden" id="num" onBlur="Cpwd1()"/>
        </td>
        <% str=""; %>
        <% str="summoney"+i; %>
      <td><font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="<%=str %>"><%=cart.getBook_number()*cart.getBook_price() %></span>元</font></td>
      <td>&nbsp;&nbsp;<%=cart.getDate() %></td>
      <td><a href="ShoppingCartServlet?type=delete&&book_id=<%=cart.getBook_id() %>">删除</a></td>
    </tr>
    <tr>
      <td height="19">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <%}} %>
  <p><br />
  </p>
  <p>&nbsp;</p>
  
  <table width="948" height="59" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="300">&nbsp;</td>
      <td width="170">商品总数：<font color="#FF0000" style="font-weight:bold">
      <%if(list!=null){ %>
      <%=list.size()%>
      <%}else{ %>
      0
      <%} %>
      </font>套 </td>
      <td width="210">购物金额总计：<font color="#FF0000" style="font-weight:bold">
      <%=totalPrice %></font>元</td>
      <td width="117"><a href="main.jsp"><img src="gouwucheImages/jixu.jpg" width="110" height="42" /></a></td>
      <td width="146"><a href="ShoppingCartServlet?type=beforePay" onclick= "cartForm.action='ShoppingCartServlet?type=beforePay';cartForm.submit();"><img src="gouwucheImages/jiesuan.jpg" width="100" height="40" /></a></td>
    </tr>
  </table>
  
  <p>&nbsp;</p>
  </form>
</div>

<div class="bangzhu"><a href="#" ><img src="goods/bottom1.gif" /></a><a href="#" target="_blank"><img src="goods/bottom2.gif" /></a><a href="#" target="_blank"><img src="goods/bottom3.gif" /></a><a href="#" target="_blank"><img src="goods/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
</body>
</html>
