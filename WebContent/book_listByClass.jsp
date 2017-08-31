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
   <% 
   System.out.println("-------");
   if(request.getParameter("class_id")==null){
						response.sendRedirect("error.jsp");
	} 				
   int class_id = Integer.parseInt(request
						.getParameter("class_id"));//考虑空的情况
	System.out.println("-------"+class_id);
	BookService bookService=new BookService();	
	BookClassService bookClassService=new BookClassService();
	String class_name = bookClassService.getClassNameByClassId(class_id);
	int intPageSize; //一页显示的记录
    int intRowCount; //记录总数
    int intPageCount; //总页
    int intPage; //待显示页
    //设置一页显示的记录
    intPageSize = 12;
    //取得待显示页
    String strPage = request.getParameter("page");
      if (strPage == null) {//表明在QueryString中没有page这一个参数，此时显示第一页数�
          intPage = 1;
      } else {//将字符串转换成整�
         intPage = java.lang.Integer.parseInt(strPage);
         if (intPage < 1) {
             intPage = 1;
         }
     }
     intRowCount=bookService.getBookTotalNumByClassId(class_id);
        //记算总页
     intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
   	 //调整待显示的页码
     if (intPage > intPageCount) {
        intPage = intPageCount;
     }
     int begin=(intPage - 1) * intPageSize ;
	 List list=bookService.listBooksByClassOrderBySaleNum(class_id, begin, intPageSize); 

 %>

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

<div class="cur">
  <span id="one"><font color="#000000" size="+2" style="font-weight:bold">图书><%=class_name %></font></span>
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

<div class="booktype">
     <div class="booktype-topic"><span style="margin-left:66px"><a style="font-size:25px"><b><%=class_name %></b></a></span></div>
     <div class="booktype-content">
          <div class="content-right">
             <div class="content-right-shang">
                  <ul>
				<%
       				for(int i=0;i<list.size();i++){
       					Book book=(Book)list.get(i);
       					
       			 %>
                      <li>
                      <span class="img1"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>"><img src="<%="BookImages/" + book.getBook_locationName() %>" /></a></span><br />
                      <div style="width:110px; height:auto;padding-left:5px;"><span class="desp1"><%=book.getBook_name() %></span></div>
                      <span class="price1">￥<%=book.getBook_price() %></span>
                      </li>
                      <%
                      		if((i+1)%4==0){
                       %>
                       	 <div>&nbsp;</div>
                       <%} %>
                  <%} %>
                    
                </ul>
              
             </div>
          </div>
     </div><!---booktype-content--->
     <div style="text-align:right;margin-right:100px">  共 <%=intPageCount %> 页 | 第 <%=intPage %> 页 &nbsp;&nbsp;
                [&nbsp;<a href="book_listByClass.jsp?class_id=<%=class_id %>&&page=1" class="right-font08" style="text-decoration:none">首页</a> |
                 <a href="book_listByClass.jsp?class_id=<%=class_id %>&&page=<%=intPage - 1%>" >上一页</a> | 
                 
                 <a href="book_listByClass.jsp?class_id=<%=class_id %>&&page=<%=intPage + 1%>" >下一页</a> |
                <a href="book_listByClass.jsp?class_id=<%=class_id %>&&page=<%=intPageCount %>" >末页</a>&nbsp;]
                <a>&nbsp;&nbsp;</a><a href="#">跳转至</a><input type="text" style="width:25px;height:20px" /><a>页</a>
                </div>
</div><!---booktype--->

<div class="bangzhu"><a href="#" target="_blank"><img src="shangpinImages/bottom1.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom2.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom3.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>


  </body>
</html>
