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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <title>云影网上书城</title>
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
<div class="tab">
    <div class="font_design">我的云影 <span class="detail"> &gt;帮助界面</span> </div>
</div>
<div class="tab_line"></div>
<div class="help_content">
  <div class="top">
    <div class="top1">
        <img src="images/1_2.png"><span style="color:#CE0000; font:'楷体'; font-size:20px; font-weight:bold;">20城市当日送达</span>
    </div>
    <div class="top2">
     <P><STRONG style="font-size:18px; color:#000000; font:'宋体'; font-weight:bold;">服务说明：</STRONG> <BR>
      为了给您提供更快收货、更多选择的贴心服务，我们推出了当日订货当日送达的增值服务，并且不会增加您额外的服务费用。</P>
     <P><BR>
      购买云影自营商品，商家商品、移仓调货及非对应发货地发货除外，当日13：00前提交的订单（以从对应发货地完成出库时间开始计算），当日送达。</P>
      <P><BR>温馨提示： <BR>如遇店庆及其它不可抗力因素导致的意外情况，会影响订单当日送达。</P>
      <P></P>配送地区所对应发货地： 
      <P align=left>&nbsp;</P>
      <TABLE cellSpacing=1 cellPadding=1 bgColor=#c4d6e7 style="margin-left:220px;">
      <COLGROUP>
      <COL span=2px  width=182px></COLGROUP>
      <TBODY>
      <TR height=22 borderColor=#ece9d8 bgColor=#e8f4f8>
      <TD width="230" height=22 borderColor=#ece9d8 bgColor=#e8f4f8><STRONG>顾客所在地</STRONG></TD>
      <TD bgColor=#e8f4f8 borderColor=#ece9d8 width=160><STRONG>发货地</STRONG></TD>
      </TR>
      <TR height=22>
      <TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>北京、天津</TD>
      <TD bgColor=#ffffff borderColor=#ece9d8 width=160>北京</TD>
      </TR>
      <TR height=22>
      <TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>上海（限出版物类商品）</TD>
      <TD bgColor=#ffffff borderColor=#ece9d8 width=160>上海</TD>
      </TR>
      <TR height=22>
      <TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>上海（百货类商品）</TD>
      <TD bgColor=#ffffff borderColor=#ece9d8 width=160>无锡</TD>
      </TR>
      <TR height=22>
      <TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>广东</TD>
      <TD bgColor=#ffffff borderColor=#ece9d8 width=160>广州</TD>
      </TR>
      <TR height=22>
      <TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>四川</TD>
      <TD bgColor=#ffffff borderColor=#ece9d8 width=160>成都</TD>
      </TR>
       <TR height=22>
       <TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>湖北</TD>
        <TD bgColor=#ffffff borderColor=#ece9d8 width=160>武汉</TD>
       </TR>
        <TR height=22>
<TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>辽宁</TD>
<TD bgColor=#ffffff borderColor=#ece9d8 width=160>沈阳</TD>
        </TR>
<TR height=22>
<TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>江苏</TD>
<TD bgColor=#ffffff borderColor=#ece9d8 width=160>无锡</TD>
</TR>
<TR height=22>
<TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>山东</TD>
<TD bgColor=#ffffff borderColor=#ece9d8 width=160>济南</TD>
</TR>
<TR height=22>
<TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>河南</TD>
<TD bgColor=#ffffff borderColor=#ece9d8 width=160>郑州</TD>
</TR>
<TR height=22>
<TD width="230" height=22 borderColor=#ece9d8 bgColor=#ffffff>福建</TD>
<TD bgColor=#ffffff borderColor=#ece9d8 width=160>福州</TD>
</TR></TBODY></TABLE>
    </div>
  </div>
 <div class="middle">
     <div class=" middle1">
        <img src="images/1_3.png"><span style="color:#CE0000; font:'楷体'; font-size:20px; font-weight:bold;">快递运输覆盖范围及收费标准</span>
    </div>
    <div class="middle2" style="padding-top:7px;">
        <P class="w2 margin1" align="left">购买当当自营商品选择普通快递或平邮，订单购物金额达到包邮限额时，可以享受免运费的配送服务。 </P><br>
<p class="w2 margin1" align="left">您想包邮吗？知道哪里的订单能包邮吗？请参看以下包邮地区详细范围：</p>
<p class="w2 margin1" align="left"><br />
</p>
<p style="text-align:left;line-height:80%;margin:0cm 0cm 0pt 20pt;background:white;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-para-margin-left:2.0gd;" class="MsoNormal" align="left"></p>
<div class="w2 margin1">
<div align="left">
  <table style="BORDER-COLLAPSE: collapse" border="1" cellspacing="0" bordercolor="#c4d6e7" summary="" cellpadding="0">
    <colgroup>
    <col width="64" />
    <col width="136" />
    <col width="703" />
    <col width="133" />
    <tbody>
      <tr height="22">
        <td bgcolor="#e8f4f8" height="22"  align="center" bordercolor="#c4d6e7" width="90" >省</td>
        <td bgcolor="#e8f4f8" align="center" bordercolor="#c4d6e7" width="160" >市</td>
        <td bgcolor="#e8f4f8" align="center" bordercolor="#c4d6e7" width="850">区/县</td>
        <td bgcolor="#e8f4f8" align="center" bordercolor="#c4d6e7" width="180" >包邮订单最低限额</td>
      </tr>
      <tr height="44">
        <td width="90" height="44" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">北京</td>
        <td width="160" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">北京市</td>
        <td bgcolor="#ffffff" bordercolor="#c4d6e7" width="850">昌平区、朝阳区、崇文区、大兴区、东城区、房山区、丰台区、海淀区、怀柔区、门头沟区、平谷区、石景山区、顺义区、通州区、西城区、宣武区、密云县、延庆县</td>
        <td width="180" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">29元</td>
      </tr>
      <tr height="44">
        <td width="90" height="44" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">上海</td>
        <td width="160" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">上海市</td>
        <td bgcolor="#ffffff" bordercolor="#c4d6e7" width="850">崇明县、宝山区、长宁区、奉贤区、虹口区、黄浦区、嘉定区、金山区、静安区、卢湾区、南汇区、普陀区、浦东新区、青浦区、松江区、徐汇区、杨浦区、闸北区、闵行区(浦江镇)、闵行区(浦江镇以外)</td>
        <td width="180" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">29元</td>
      </tr>
      <tr height="44">
        <td width="90" height="44" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">天津</td>
        <td width="160" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">天津市</td>
        <td bgcolor="#ffffff" bordercolor="#c4d6e7" width="850">蓟县、静海县、宁河县、其他区县、宝坻区、北辰区、大港区、东丽区、汉沽区、和平区、河北区、河东区、河西区、红桥区、津南区、南开区、塘沽区、武清区、西青区</td>
        <td width="180" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">29元</td>
      </tr>
      <tr height="44">
        <td width="90" height="44" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">重庆</td>
        <td width="160" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">重庆市</td>
        <td bgcolor="#ffffff" bordercolor="#c4d6e7" width="850">巴南区、北碚区、大渡口区、涪陵区、高新区、合川区、江北区、江津区、九龙坡区、南岸区、沙坪坝区、双桥区、万州区、永川区、渝北区、渝中区、长寿区、南川区、黔江区、万盛区</td>
        <td width="180" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">29元</td>
      </tr>
      <tr height="44">
        <td width="90" height="44" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">广东</td>
        <td width="160" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">广州市</td>
        <td bgcolor="#ffffff" bordercolor="#c4d6e7" width="850">白云区、东山区、番禺区、芳村区、海珠区、花都区、黄埔区、荔湾区、萝岗区、南沙区、天河区、越秀区、增城市</td>
        <td width="180" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">29元</td>
      </tr>
      <tr height="44">
        <td width="90" height="44" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">福建</td>
        <td width="160" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">福州市</td>
        <td bgcolor="#ffffff" bordercolor="#c4d6e7" width="850">仓山区、鼓楼区、晋安区、马尾区、台江区、闽侯县</td>
        <td width="180" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">29元</td>
      </tr>
      <tr height="44">
        <td width="90" height="44" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">内蒙古</td>
        <td width="160" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">呼和浩特市</td>
        <td bgcolor="#ffffff" bordercolor="#c4d6e7" width="850">回民区、经济开发区、赛罕区、新城区、玉泉区</td>
        <td width="180" align="center"  bordercolor="#c4d6e7" bgcolor="#ffffff">29元</td>
      </tr>
     
    </tbody>
  </table>
    </div>
 </div>
</div>
</div>
</div>
<div class="bangzhu"><div class="detail"><img src="goods/bottom1.gif" /><img src="goods/bottom2.gif" /><img src="goods/bottom3.gif" /><img src="goods/bottom4.gif" /></div>
</div>
<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
  </body>
</html>
