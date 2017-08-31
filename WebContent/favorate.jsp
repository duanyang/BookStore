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
	FavorateService favorateService=new FavorateService();
	List favorateList=favorateService.listFavorateByUserID(user_id);
	
 %>
  <div class="fav">
  <div class="fav1"><span><img src="gouwucheImages/favorate.jpg" width=80px;height=80px; style="margin-left:30px" /></span><span class="type">&nbsp;我的云影></span><span class="type1">收藏夹</span></div>
   <table >
    <tr>
	<td>编&nbsp;号</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>简&nbsp;图</td>
	<td>&nbsp;</td>
	<td>单&nbsp;价</td>

	
	<td>&nbsp;</td>
	<td>作&nbsp;者</td>
	<td></td>
	<td></td>
	<td></td>
	<td>出&nbsp;版&nbsp;社&nbsp</td>
	</tr>
	
	<%
  		if(favorateList!=null){
  			for(int i=0;i<favorateList.size();i++){
  				Favorate favorate=(Favorate)favorateList.get(i);
  				BookService bookService=new BookService();
  				Book book=bookService.getBookByBookId(favorate.getBook_id());
  				
   %>
	
	<tr>
      <td><%=book.getBook_id()%></td>
   	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      <td><img src="<%="BookImages/" + book.getBook_locationName() %>" width="90" height="90" /></td>
      <td></td>
      <td>￥<%=book.getBook_price() %>元</td>
	<td>&nbsp;</td>
      <td><%=book.getBook_author() %></td>
      <td></td>
	<td></td>
	<td></td>
      <td><%=book.getBook_press() %></td>
      	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      <td><a href="FavorateServlet?type=user_delete&&user_id=<%=user_id%>&&book_id=<%=book.getBook_id()%>">删除</a></td>
      	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      <td ><a href="ShoppingCartServlet?type=add&&book_number=1&&book_id=<%=book.getBook_id() %>"><img src="gouwucheImages/jiaru.jpg" width="100" height="35" /></a></td>
    </tr>
	
	
	<%}} %>
	</table>

  <p>&nbsp;</p>
  
</div>

<div class="bangzhu"><a href="#" target="_blank"><img src="shangpinImages/bottom1.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom2.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom3.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>

</body>
</html>
