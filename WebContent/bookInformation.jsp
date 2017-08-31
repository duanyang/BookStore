<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,com.imu.csbookstore.util.*,com.imu.csbookstore.service.*" pageEncoding="utf-8"%>
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
<style type="text/css">
.border
{
border:1px 1px 1px 1px solid #B60101;
}

 .head1{
  background: #B10202;
  border-width:1px;
  color:#FFFFFF;
  text-align:left;
  margin-left:80px;
  font-size:12px;
  width:400px;
}
.head1_right{
font-family:Webdings;
width:20px;
 background: #B10202;
 text-align:right;
}
.head1_right_span{
font-family:Webdings;
width:100%;
 background: #B10202;
 text-align:right;
 cursor:hand;
 padding-left:2px;
 color:#FFFFFF;
 font-size:12px;
}
.head1_right_bg{
 background: #B10202;
}
.width{
width:100%;
height:120px;
}
.but{
border:1px;
background-color:#B60101;
color:#FFFFFF;
}
</style>
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
  	Book book=(Book)request.getAttribute("book");
  	SessionChecker sessionChecker=new SessionChecker(request);
  	String class_name=(String)request.getAttribute("class_name");
  	
  %>
<div class="cur">
  <span id="one"><font color="#000000" size="+2" style="font-weight:bold">图书-><%=class_name %>-><font size="4"><%=book.getBook_name() %></font></font></span>
</div>
<div class="whole" style="margin-left:180px;">
   <div class="productDetail">
      <div class="pro_biao"><span><font size="+1" style="margin-left:200px; font-weight:bold" color="#333333"><%=book.getBook_name() %>&nbsp;<%=book.getBook_author() %></font></span></div>
      <div class="pro_det">
         <div class="pro_det_xin">
 <form name="bookInfoForm" method="post" action="">
    <table width="942" height="358" border="0" cellpadding="0" cellspacing="0" style="border-bottom: 0px dashed rgb(149, 196, 244); margin-left: 200px;">
    <tr>
      <td width="360" rowspan="3"><span class="pro_det_img"><img src="<%="BookImages/" + book.getBook_locationName() %>" width="350px" height="350px" style="border:#d1d1d0 2px solid"/></span></td>
      <td width="460">
      <div style="width:300px; height:30px; padding-left:40px;margin-bottom:340px" >
      <div style="padding-top:5px;width:200px; height:30px; line-height:30px;padding-left:0px;">商品编号：<%=book.getBook_id() %></div>
      <div style="padding-top:5px; width:200px; height:30px; line-height:30px; padding-left:0px">作者：<%=book.getBook_author() %></div>
      <div style="padding-top:5px; width:300px; height:30px; line-height:30px; padding-left:0px">出版社：<%=book.getBook_press() %></div>
      <div style="padding-top:5px;width:200px; height:30px; line-height:30px;padding-left:0px;">价格：<font style="font-weight:bold" size="+0"><del>￥<%=book.getBook_price()+book.getBook_price()*0.2 %></del></font></div>
      <div style="padding-top:5px;width:200px; height:30px; line-height:30px;padding-left:0px;">云影价：<font color="#FF0000" style="font-weight:bold" size="+0">￥<%=book.getBook_price()%></font></div>

      
      
      <%if(book.getBook_number()==0){ %>
      <div style="padding-top:5px; line-height:30px; padding-left:0px">无货
      	
      <%}else{ %>
      <div style="padding-top:5px; width:300px; height:30px; line-height:30px; padding-left:0px">库存量：<%=book.getBook_number() %>&nbsp;本</div>
      <div style="padding-top:5px; line-height:30px; padding-left:0px"><a>购买数量：</a>
      <label>
        <select name="book_number" id="select">
        <%for(int i=1;i<=book.getBook_number();i++){ %>
          <option value="<%=i%>"><%=i%></option>
         <%} %>
        </select>
      </label>个
      <%} %>
      </div>
      <div style="padding-top:5px; width:350px; height:30px; line-height:30px; padding-left:0px;padding-bottom:40px">
    
    <input id="Button1" value="" type="image"                                          
        src="gouwucheImages/jiaru.jpg" align=absMiddle border=0
        onclick= "bookInfoForm.action='ShoppingCartServlet?type=add&&book_id=<%=book.getBook_id()%>';bookInfoForm.submit(); "
        />
     &nbsp;&nbsp;
    &nbsp;
     <%
     	if(sessionChecker.checkUser()){
      %>
   	  
      <input type="button" onclick="bookInfoForm.action='FavorateServlet?type=add&&book_id=<%=book.getBook_id()%>&&user_id=<%=sessionChecker.getUser_id()%>';bookInfoForm.submit();"  value="加入收藏夹"/>
      <%}else{ %>
      <a href="#"/>
      <%} %>
     </div>      
      </div>
      </td>
    </tr>    
    </table>
	</form>
      <div class="jieshao_biaoti" style="margin-top:10px;margin-left:180px"><img src="gouwucheImages/jianjie.jpg" width="806" height="37"/>
		<table width="815" style="height:auto">
      <div style="width:810px;">
		<%=book.getBook_describtion() %>
		</div>
		</table>
		
		 <div style="width:810px;height:auto; border:1px solid #F96;margin-top:10px;margin-left:0px"><img src="gouwucheImages/bookshadow.jpg" width="806" height="37"/>          
	<%
		CommentService commentService=new CommentService();
		List ratingCountList=commentService.getRatingCountByBookID(book.getBook_id());
		if(ratingCountList.size()>0){
		%>
		<table style="margin-left:20px">
		<%
			
				for (int i=0; i<ratingCountList.size(); i++){
					RatingCount ratingCount= (RatingCount)ratingCountList.get(i);
			
		%>
		<tr>
	  <td height="30px">&nbsp;&nbsp;评分&nbsp;<%=ratingCount.getRating()%>&nbsp;---------&nbsp;&nbsp;<%=ratingCount.getRatingCount() %>&nbsp;个顾客</td>
	  </tr>
	  <%}} %>
		</table>
	
	<% 
		List commentList=commentService.listCommentByBookID(book.getBook_id());
		if(commentList.size()>0){
		for(int i=0;i<commentList.size();i++){
			Comment comment=(Comment)commentList.get(i);
			UserService userService=new UserService();
			String comment_userName=userService.getUserNameByUserId(comment.getUser_id());
	 %>
     
      <div style="background:url(gouwucheImages/pinglun.jpg);width:580px;height:128px;margin-left:110px;margin-top:20px">
	  
	  <table style="margin-left:20px">
	  <tr>
	  <td height="30px"><%=comment.getComment_time() %>&nbsp;&nbsp;&nbsp;顾客&nbsp;<%=comment_userName %>&nbsp;&nbsp;&nbsp;评分:&nbsp;<%=comment.getRating() %>
	  </td>
	  </tr>
	  <tr>
	  <td><div style="width:510px;margin-left:0px;margin-top:6px"><font size="2" style=" font-weight:bold;"><%=comment.getContent() %></font></div></td>
	  </tr>
	  </table>
	  </div>
     <%}}else{ %>
     	暂无评论.
     <%}
     	if(sessionChecker.checkUser()){ 
     %>
     <form method="post" action="CommentServlet?type=add">
     <input type="hidden" name="user_id" value="<%=sessionChecker.getUser_id()%>">
     <input type="hidden" name="book_id" value="<%=book.getBook_id() %>">
     	<table class="border" cellspacing="0" style="margin-left:130px;margin-top:30px;width:560px;height:120px;border:1px solid #5B5B5B">
      <tr>
      <td colspan="1"  class="head1" valign="top">欢迎评论</td>
      <td colspan="2" class="head1_right_bg"><span id="idClose" class="head1_right_span" onClick="this.innerText=this.innerText=='r'?('1'):('r')"></span></td>
      </tr>
      <tr>
  		<td colspan="3"><textarea name="content" class="width" ></textarea></td>
	</tr>
	<tr>
	<td>
        <legend>评分</legend>
          
          <input type="radio" name="rating" id="one" value="1">1</input>
          
          <input type="radio" name="rating" id="two" value="2">2</input>
          
          <input type="radio" name="rating" id="three" value="3">3</input>
          
          <input type="radio" name="rating" id="four" value="4">4</input>

          <input type="radio" name="rating" id="five" value="5">5</input>
    </td>
	</tr>
	<tr>
	<td colspan="3"><input name="" type="submit" value="提交"   class="but">&nbsp;</td>
	</tr>
	</table>
	</form>
     <%} %>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
      </div>
      </div>
      </div>
      </div>
      </div>
      </div>
      <div class="bangzhu"><a href="#" target="_blank"><img src="shangpinImages/bottom1.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom2.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom3.gif" /></a><a href="#" target="_blank"><img src="shangpinImages/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
      
  </body>
</html>
