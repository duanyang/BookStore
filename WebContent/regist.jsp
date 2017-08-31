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
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script src="js/reg.js" type="text/javascript"></script>
<script src="js/jquery-1.4.2.js" type="text/javascript"></script>
<script>
  //导航栏
  
  function bac(sr){
	document.getElementById("shou").src=sr;  
  }
  function bac1(sr){
	document.getElementById("shu").src=sr;  
  }
  function bac2(sr){
	document.getElementById("shouji").src=sr;  
  }
  function bac3(p){
	document.getElementById("zui").src=p;  
  } 
  function bac4(p){
	document.getElementById("rui").src=p;  
  }
  function bac5(p){
	document.getElementById("taolun").src=p;  
  }
  function bac6(p){
	document.getElementById("bang").src=p;  
  }
  
  
  /**验证*/
  function focu(){
	document.getElementById("uname").style.display="none";
	document.getElementById("upass").style.display="none";
	document.getElementById("urepass").style.display="none";
	document.getElementById("uemail").style.display="none";
	document.getElementById("uyan").style.display="none";
	
}
function onfo(p){
  if(p==1){
	  document.getElementById("uname").style.display="block";
	  document.getElementById("username").style.borderColor="ffa200";
  }
  if(p==2){
	  document.getElementById("upass").style.display="block";
	  document.getElementById("pass").style.borderColor="ffa200";
  }
  if(p==3){
	  document.getElementById("urepass").style.display="block";
	  document.getElementById("repass").style.borderColor="ffa200";
  }
  if(p==4){
	  document.getElementById("uemail").style.display="block";
	  document.getElementById("email").style.borderColor="ffa200";
  }
  if(p==5){
	  document.getElementById("uyan").style.display="block";
	  document.getElementById("yan").style.borderColor="ffa200";
  }
  
}
  
  //用户名验证
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  document.getElementById("uname").innerHTML="√ 该用户名可以使用";
  return true;
 }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //密码验证
function leav2(){
    var upass=document.getElementById("upass");
	var pass=document.getElementById("pass");
	if(pass.value==""){
		upass .style.display="none";
		pass.style.borderColor="#BBBBBB";
		return false;
	}

	return true;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  document.getElementById("upass").innerHTML="√ 密码通过";
  return true;
 }
}
//重复密码验证
function Cpwd2()
{
 var pwd1=document.getElementById("pass").value;
 var pwd2=document.getElementById("repass").value;
 if(pwd2!=pwd1)
 {
  document.getElementById("urepass").style.color="red";
  document.getElementById("urepass").innerHTML="* 请保持和上面密码的一致！";
  return false;
 }
 else if(pwd2.length=="")
 {
   document.getElementById("urepass").style.color="red";
   document.getElementById("urepass").innerHTML="* 密码确认不能为空！！！";
 }
 else
 {
  document.getElementById("urepass").style.color="green";
  document.getElementById("urepass").innerHTML="√ 验证密码通过";
  return true;
 }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//密码级别验证
function jibie(){
	var passV=document.getElementById("pass").value;
	if(passV.length<6){
		document.getElementById("upass").innerHTML="<image src='regImages/di121.gif'>";
	}if(passV.length>=6&&passV.length<9){
	  	for(i=0;i<passV.length;i++){
			var n=passV.substring(i,i+1);
			if(isNaN(n)&&(n<'a'||n>z)){
				document.getElementById("upass").innerHTML="<image src='regImages/zhong12.gif'>";
			}
		}
	}
	if(passV.length>=9){
		for(i=0;i<passV.length;i++){
			var n=passV.substring(i,i+1);
			if(isNaN(n)&&(n<'a'||n>z)){
				document.getElementById("upass").innerHTML="<image src='regImages/gao12.gif'>";
			}
		}
	}
}


//邮箱验证
function Cemail()
{
 var email=document.getElementById("email").value;
 if(email.length=="")
 {
  document.getElementById("uemail").style.color="red";
  document.getElementById("uemail").innerHTML="* 请输入您的电子邮箱地址！";
  return false;
 }
 else if(email.indexOf("@")<1 || email.indexOf(".")<2 || email.indexOf(".")<email.indexOf("@"))
 {
  document.getElementById("uemail").style.color="red";
  document.getElementById("uemail").innerHTML="* 请提供合法有效的电子邮箱地址";
  return false;
 }
 else
 {
  document.getElementById("uemail").style.color="green";
  document.getElementById("uemail").innerHTML="√  格式合法";
  return true;
 }
}
 //验证码验证
 function leav5(){
 
     var rand=document.getElementById("rand").value;
	 var yan=document.getElementById("yan").value;
	 if(yan.length=="")
	 {
		  document.getElementById("uyan").style.color="red";
		  document.getElementById("uyan").innerHTML="* 验证码不能为空";
		  return false;
	 }
  }
function Result()
{
 if(!(Cname()&& Cpwd1()&& Cpwd2()&& Cemail()))
 {
   
       document.getElementById("pass").value="";
       document.getElementById("repass").value="";
       document.getElementById("urepass").style.color="red";
       document.getElementById("urepass").innerHTML="* 确认密码必须和密码一致";
        alert("请正确填写注册信息");
    return false;
 }
 else
    return true;
 
}
</script>
</head>

<body onLoad="focu()">
<%
	String result="";
	String user_name="";
	String user_mail="";
	boolean flag=false;
	if(request.getAttribute("result")!=null){
		result=(String)request.getAttribute("result");
		flag=true;
		user_name=(String)request.getAttribute("user_name");
		user_mail=(String)request.getAttribute("user_mail");
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
  <span id="one">欢迎注册成为云影书城的影子!</span><span id="two">已有帐号？<a href="login.jsp" >点此登录</a></span>
</div>
<div class="zc">


<form name="re" method="post" action="UserServlet?type=regist" onsubmit="Result();">
  <div class="item1">
  <span class="word7">&nbsp;</span><label style="font-weight:bold">请认真填写以下注册信息！</label>
  </div><!---item--->
  <div class="item">
     <span class="word1">用 户 名：</span><span class="inpu"><input type="text" name="user_name" id="username" value="<%=user_name %>" onFocus="onfo(1)" onblur="Cname()"/></span>
     <div id="uname" style="padding-top:7px;padding-left:390px; color:#999">6-20位字符，可由中文、英文、数字组成</div>
  </div><!---item--->
  <div class="item">
  <span class="word2">密&nbsp; &nbsp; 码：</span><span class="inpu"><input type="password" name="user_pass" id="pass" onFocus="onfo(2)" onBlur="Cpwd1()" onKeyDown="jibie()"/></span>
  <div id="upass" style="padding-top:7px;padding-left:390px;color:#999" >6-16位字符，可由英文、数字及特殊字符组成</div>
  </div><!---item--->
  <div class="item">
  <span class="word3">确认密码：</span><span class="inpu"><input type="password" name="user_pass_again" id="repass" onFocus="onfo(3)"  onBlur="Cpwd2()"/></span>
  <div id="urepass" style="padding-top:7px;padding-left:390px;color:#999" >请再次输入密码</div>
  </div><!---item--->
  <div class="item">
  <span class="word4">邮&nbsp;&nbsp;&nbsp; 箱：</span><span class="inpu"><input type="text" name="user_mail" value="<%=user_mail %>" id="email" onFocus="onfo(4)" onBlur="Cemail()"/></span>
  <div id="uemail" style="padding-top:7px;padding-left:390px;color:#999" >请输入常用的邮箱</div>
  </div><!---item--->
  <div class="item">
  <span class="word5">验 证 码：</span><span class="inpu"><input type="text" name="yan" id="yan" onFocus="onfo(5)" onBlur="leav5()"/></span><img border=0 src="image.jsp">
  <div id="uyan" style="padding-top:7px;padding-left:390px;color:#999" >请输入图中的字符</div>
  
  </div><!---item---> 
  <div class="item">
  <span class="word6">&nbsp;</span><input type="submit" class="btn" value="同意以下协议，并提交"/> 
  <%
  	if(flag){
  	%>
 <span style="color:#EA0000;font-size:18px;font-family:"楷体";">*<%=result %>!!!</span>
  <% } %>
  </div><!---item--->
  <div id="protocal">
                        <h4>一、本站服务条款的确认和接纳</h4>
<p>本站的各项电子服务的所有权和运作权归本站。本站提供的服务将完全按照其发布的服务条款和操作规则严格执行。用户同意所有服务条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的约定，除非违反国家强制性法律，否则始终有效。在下订单的同时，您也同时承认了您拥有购买这些产品的权利能力和行为能力，并且将您对您在订单中提供的所有信息的真实性负责。</p>
<h4>二、服务简介</h4>
<p>本站运用自己的操作系统通过国际互联网络为用户提供网络服务。同时，用户必须：</p>
<ul>
		<li>(1)自行配备上网的所需设备，包括个人电脑、调制解调器或其它必备上网装置。 </li>
		<li>(2)自行负担个人上网所支付的与此服务有关的电话费用、网络费用。 </li>
</ul>

<p>基于本站所提供的网络服务的重要性，用户应同意</p>
<ul>
		<li>(1)提供详尽、准确的个人资料。 </li>
		<li>(2)不断更新注册资料，符合及时、详尽、准确的要求。 </li>
</ul>
<p>本站保证不公开用户的真实姓名、地址、电子邮箱和联系电话等用户信息， 除以下情况外：</p>
<ul>
		<li>(1)用户授权本站透露这些信息。 </li>
		<li>(2)相应的法律及程序要求本站提供用户的个人资料。 </li>

</ul>
<h4>三、价格和数量</h4>
<p>本站将尽最大努力保证您所购商品与网站上公布的价格一致。</p>
<p>产品的价格和可获性都在本站上指明，这类信息将随时更改。</p>
<p>您所订购的商品，如果发生缺货，您有权取消定单。</p>
<h4>四、送货</h4>
<p>本站将会把产品送到您所指定的送货地址。所有在本站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。</p>
<p>请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，本站将无法承担迟延配送的责任：</p>
<ul>
		<li>(1)客户提供错误信息和不详细的地址；</li>

		<li>(2)货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果。 </li>
		<li>(3)不可抗力，例如：自然灾害、交通戒严、突发战争等。 </li>
</ul>
<h4>五、服务条款的修改</h4>
<p>本站将可能不定期的修改本用户协议的有关条款，一旦条款及服务内容产生变动，本站将会在重要页面上提示修改内容。</p>
<h4>六、用户隐私制度</h4>
<p>尊重用户个人隐私是本站的一项基本政策。所以，作为对以上第二条注册资料分析的补充，本站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本站中的非公开内容。</p>
<h4>七、用户的帐号，密码和安全性 </h4>

<p>用户一旦注册成功，成为本站的合法用户，将得到一个密码和用户名。您可随时根据指示改变您的密码。用户需谨慎合理的保存、使用用户名和密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通知本站和向公安机关报案。</p>
<h4>八、对用户信息的存储和限制</h4>
<p>如果用户违背了国家法律法规规定或本协议约定，本站有视具体情形中止或终止对其提供网络服务的权利。</p>
<h4>九、用户管理 </h4>
<p>本协议依据国家相关法律法规规章制定，用户同意严格遵守以下条款：</p>
<ul>
		<li>(1)从中国境内向外传输技术性资料时必须符合中国有关法规。 </li>
		<li>(2) 不利用本站从事非法活动。 </li>

		<li>(3)不干扰或混乱网络服务。</li>
		<li>(4)遵守所有使用网络服务的网络协议、规定、程序和惯例。 </li>
</ul>
<p>用户须承诺不传输任何违法犯罪的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽的、不文明的等信息资料；不传输损害国家社会公共利益和涉及国家安全的信息资料；不传输教唆他人从事本条所述行为的信息资料。</p>
<p>未经许可而非法进入其它电脑系统是禁止的。</p>
<p>若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p>
<h4>十、通告</h4>
<p>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。用户协议条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p>

<h4>十一、网络服务内容的所有权</h4>
<p>本站定义的网络服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；本站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者和本站授权。</p>
<h4>十二、责任限制</h4>
<p>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并尽最大努力使客户免受损失。</p>
<h4>十三、法律管辖和适用</h4>
<p>本协议的订立、执行和解释及争议的解决均应适用中国法律。</p>
<p>如发生本站服务条款与中国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它有效条款继续有效。</p>
<p>如双方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均可向人民法院提起诉讼。</p>


  </div><!---protocal--->
</form>
</div><!---zc--->

<div class="bangzhu"><a href="#" target="_blank"><img src="goods/bottom1.gif" /></a><a href="#" target="_blank"><img src="goods/bottom2.gif" /></a><a href="#" target="_blank"><img src="goods/bottom3.gif" /></a><a href="#" target="_blank"><img src="goods/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>

</body>
</html>
