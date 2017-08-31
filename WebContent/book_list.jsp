<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,
com.imu.csbookstore.service.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书信息</title>
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
 
     </table>
  </div>
</div><!---navigation--->


<div class="cur">
  <span id="one"><font color="#000000" size="+2" style="font-weight:bold">图书类型</font></span>
</div>
</div>
<div align="center">
<div class="current"><!---current--->
   <div class="type">
   <div id="lie"><span>&nbsp;</span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=1">教科书</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=2">儿童读物</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=3">科普读物</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=4">网络小说</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=5">悬疑小说</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=6">动漫/幽默</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=7">经济</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=8">历史</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=9">生活</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=10">英文原版书</a></span></div>
     <div id="lie"><span><a href="book_listByClass.jsp?class_id=11">套装书</a></span></div>
     
   </div>

<div class="shuma">
     <div class="shuma-topic"><span style="margin-left:66px"><a href="BookServlet?type=searchBookByClassId&&class_id=4" style="font-size:25px"><b>教科书</b></a></span><span style="margin-left:450px">&nbsp;</span><span><a href="BookServlet?type=searchBookByClassId&&class_id=4">More>></a></span></div>
     <div class="shuma-content">
          <div class="content-right">
             <div class="content-right-shang">
                  <ul>
                  <%
       				BookService bookService=new BookService();
       				List bestSaleBookList=bookService.listNBooksFromClassOrderBySaleNum(4, 4);
       				if(bestSaleBookList!=null){
       				for(int i=0;i<bestSaleBookList.size();i++){
       					Book book=(Book)bestSaleBookList.get(i);
       			
       			 %>
                      <li>
                      <span class="img1"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>"><img src="<%="BookImages/" + book.getBook_locationName() %>" /></a></span><br />
                      <div style="width:130px; height:35px;padding-left:5px;"><span class="desp1"><%=book.getBook_name() %></span></div>
                      <span class="price1">￥<%=book.getBook_price() %></span>
                      </li>
                   <%}} %>
                </ul>
             </div>
          </div>
     </div><!---shuma-content--->
</div><!---shuma--->

<div class="shuma">
     <div class="shuma-topic"><span style="margin-left:66px"><a href="BookServlet?type=searchBookByClassId&&class_id=8" style="font-size:25px"><b>儿童读物</b></a></span><span style="margin-left:450px">&nbsp;</span><span><a href="BookServlet?type=searchBookByClassId&&class_id=8">More>></a></span></div>
     <div class="shuma-content" style="height:230px">
          <div class="content-right">
             <div class="content-right-shang">
                  <ul>
                      <%
       			//	BookService bookService=new BookService();
       				List bestSaleBookList1=bookService.listNBooksFromClassOrderBySaleNum(8, 4);
       				for(int i=0;i<bestSaleBookList1.size();i++){
       					Book book=(Book)bestSaleBookList1.get(i);
       			
       			 %>
                      <li>
                      <span class="img1"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>"><img src="<%="BookImages/" + book.getBook_locationName() %>"/></a></span><br />
                      <div style="width:130px; height:35px;padding-left:5px;"><span class="desp1"><%=book.getBook_name() %></span></div>
                      <span class="price1">￥<%=book.getBook_price() %></span>
                      </li>
                   <%} %>
                      
                </ul>
             </div>
          </div>
     </div><!---shuma-content--->
</div><!---shuma--->
<div class="xinpin">
   <div class="biaoti"><span style="margin-left:66px"><a href="BookServlet?type=searchBookByClassId&&class_id=11" style="font-size:25px"><b>科普读物</b></a></span><span style="margin-left:650px">&nbsp;</span><span><a href="BookServlet?type=searchBookByClassId&&class_id=11">More>></a></span></div>
   <div class="biaoti-tu">
       <ul>
            <%
       			//	BookService bookService=new BookService();
       				List bestSaleBookList2=bookService.listNBooksFromClassOrderBySaleNum(11, 5);
       				for(int i=0;i<bestSaleBookList2.size();i++){
       					Book book=(Book)bestSaleBookList2.get(i);
       			
       			 %>
            <li>
            <span class="img"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>"><img src="<%="BookImages/" + book.getBook_locationName() %>" /></a></span><br />
            <div style="width:130px; height:35px;padding-left:5px;"><span class="desp"><%=book.getBook_name() %></span></div>
            <span class="price">￥<%=book.getBook_price() %></span>
            </li>
          <%} %>
       </ul>
   </div><!---biaoti-tu--->
</div><!---xinpin--->

<div class="xinpin">
   <div class="biaoti"><span style="margin-left:66px"><a style="font-size:25px"><b>网络小说</b></a></span><span style="margin-left:650px">&nbsp;</span><span><a href="BookServlet?type=searchBookByClassId&&class_id=11">More>></a></span></div>
   <div class="biaoti-tu">
       <ul>
            <%
       			//	BookService bookService=new BookService();
       				List bestSaleBookList3=bookService.listNBooksFromClassOrderBySaleNum(11, 5);
       				for(int i=0;i<bestSaleBookList3.size();i++){
       					Book book=(Book)bestSaleBookList2.get(i);
       			
       			 %>
            <li>
            <span class="img"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>"><img src="<%="BookImages/" + book.getBook_locationName() %>" /></a></span><br />
            <div style="width:130px; height:35px;padding-left:5px;"><span class="desp"><%=book.getBook_name() %></span></div>
            <span class="price">￥<%=book.getBook_price() %></span>
            </li>
          <%} %>
       </ul>
   </div><!---biaoti-tu--->
</div><!---xinpin--->


<div class="bangzhu"><a href="#" target="_blank"><img src="shangpinImages/bottom1.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom2.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom3.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
</body>
</html>

