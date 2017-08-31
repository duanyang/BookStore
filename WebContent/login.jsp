<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,
com.imu.csbookstore.service.*,com.imu.csbookstore.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
//生成随机类
Random random = new Random();

// 取随机产生的认证码(4位数字)
String sRand="";
for (int i=0;i<4;i++){
String rand=String.valueOf(random.nextInt(10));
sRand+=rand;
}

// 将认证码存入SESSION
//session.setAttribute("rand", "");
//session.invalidate();
session.setAttribute("rand",sRand);
%>






<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
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
  
  function colorChange(p){
	  if(p==1)
	  document.getElementById("newUser").style.color='red';
	  else
	  document.getElementById("newUser").style.color='black';
  }
 function Cname()
{
 var Name=document.getElementById("username").value;
 if(Name.length=="")
 {
  document.getElementById("uname").style.color="red";
  document.getElementById("uname").innerHTML="* 请输入您的用户名！";
  return false;
 }
 else if(Name.length<6 || Name.length>20)
 {
  document.getElementById("uname").style.color="red";
  document.getElementById("uname").innerHTML="* 用户名由6-16位字符组成 ，其字符可为中文、英文或数字";
  return false;
 }
 else
  {
    document.getElementById("uname").style.color="green";
    document.getElementById("uname").innerHTML="√ 该用户名格式正确";
    return true;
    }
}
function Cpwd1()
{
 var pwd1=document.getElementById("pass").value;
 if(pwd1.length=="")
 {
  document.getElementById("upass").style.color="red";
  document.getElementById("upass").innerHTML="* 请输入密码！";
  return false;
 }
 else if(pwd1.length<6 || pwd1.length>16)
 {
  document.getElementById("upass").style.color="red";
  document.getElementById("upass").innerHTML="* 密码只能由6-16位字符组成";
  return false;
 }
 else
 {
  document.getElementById("upass").style.color="green";
  document.getElementById("upass").innerHTML="√ 密码格式正确";
  return true;
 }
}
function leav5(){
	 var yan=document.getElementById("yanzheng").value;
	 if(yan.length=="")
	 {
		  document.getElementById("uyan").style.color="red";
		  document.getElementById("uyan").innerHTML="* 验证码不能为空";
		  return false;
	 }
  }
function Result()
{
 if(!(Cname()&& Cpwd1()))
 {
   
       document.getElementById("pass").value="";
        alert("请正确填写登录信息");
    return false;
 }
 else
    return true;
 
}
</script>
<body>
<%
	String result="";
	String user_name="";
	boolean flag=false;
	if(request.getAttribute("result")!=null){
		result=(String)request.getAttribute("result");
		flag=true;
		user_name=(String)request.getAttribute("user_name");
	}
	
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
  <span id="one"><font color="#000000" size="+2" style="font-weight:bold">用户登录</font></span>
</div>

<div class="log">

  <div class="log-left"><!-- onsubmit="check1()" -->
      <form name="form1" method="post" action="UserServlet?type=login" onsubmit="Result();">
         <div class="log-item">
        <span class="wor1">用户名：</span><span class="input"><input type="text" id="username" name="user_name" onblur="Cname()"  value="<%=user_name %>"/></span><span id="uname" style="padding-left:228px;"></span>
        </div><!---item--->
        <div class="log-item">
        <span class="wor2">密&nbsp;&nbsp;码：</span><span class="input"><input type="password" id="pass" name="user_pass" onBlur="Cpwd1()"/></span><span id="upass" style="padding-left:228px;"></span>
        </div><!---item--->
        <div class="log-item">
        <span class="wor5">验证码：</span><span class="inpu"><input type="text" id="yanzheng" name="validate" onBlur="leav5()"/>&nbsp;<%=sRand %></span>
        <div id="uyan" style="padding-left:228px;color:#999" >请输入图中的字符</div>
        </div><!---item--->
        <span style="margin-left:183px; margin-top:40px;padding-top:20px;">
        <input type="submit" value="登录" class="lo" /> 
        <%
  	   if(flag){
  	   %>
      <span style="color:#EA0000;font-size:18px;font-family:"楷体";margin-left:10px;">*<%=result %>!!!</span>
       <% } %>
        </span>
        </form>
  </div>
  <div class="log-right">
      <div style="padding-left:20px; width:200px; margin-top:20px"><font style="font-weight:bold; color:#000">还不是云影用户？</font><br /><br />现在注册便能立刻享受便宜又放心的购物乐趣。</div>
  
      <div  class="re-zhu"><a href="regist.jsp"><input type="button" value="注册新用户" onmouseover="colorChange(1)"  onmouseout="colorChange(2)" id="newUser"/></a></div>
  </div>
</div>




<div class="bangzhu"><a href="#" target="_blank"><img src="goods/bottom1.gif" /></a><a href="#" target="_blank"><img src="goods/bottom2.gif" /></a><a href="#" target="_blank"><img src="goods/bottom3.gif" /></a><a href="#" target="_blank"><img src="goods/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>

</body>
</html>
