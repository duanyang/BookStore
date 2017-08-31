<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,
com.imu.csbookstore.service.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎光临云影书城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/index_style.css"/>
	<link href="css/index_default.css" rel="stylesheet" type="text/css">	
	
 <script type="text/javascript" src="js/jquery.pack.js"></script>
<script type="text/javascript" src="js/jQuery.blockUI.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>

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

<style type="text/css">
  .tr{width:220px; height:20px; line-height:20px; padding-left:10px}
  .tr a{ font-size:13px; text-decoration:none; color:#585858}
  .fan{width:232px; height:90px; margin-left:2px; padding-top:15px; border-left:#cccccc solid 1px;border-right:#cccccc solid 1px;border-bottom:#cccccc solid 1px;}
</style>

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
     <span class="huo"><a href="#">我的账户</a></span><span class="huo"><a href="#">云影活动</a></span><span class="huo"><a href="#">好友邀请</a></span><span class="huo"><a href="#">客服中心</a></span><span class="huo"><a href="BackAdmin/adminLogin.jsp">后台登录</a></span>    </div>
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
             <td width="106" height="28"><a href="#"><img src="images/first.gif" width="106" height="41" onMouseOver="bac('images/first1.gif')" onMouseOut="bac('images/first.gif')" id="first"/></a></td>
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
<div id="content"><!---current--->
<div style="text-align:center">
   <div class="content_left">
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
   </div>
  <div class="slideBox" style="margin-left:5px;">
		  <div class="hd">
						<ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li><li>7</li><li>8</li><li>9</li></ul>
		  </div>
		  <div class="bd">
						<ul>
							<li><img src="images/xy_1.JPG" /></li>
							<li><img src="images/xy_2.JPG" /></li>
							<li><img src="images/xy_3.JPG" /></li>
							<li><img src="images/xy_4.JPG" /></li>
							<li><img src="images/xy_5.JPG" /></li>
							<li><img src="images/xy_6.JPG" /></li>
							<li><img src="images/xy_7.jpg" /></li>
							<li><img src="images/xy_8.JPG" /></li>
							<li><img src="images/xy_9.JPG" /></li>
						</ul>
		   </div>
   </div>
<script type="text/javascript">jQuery(".slideBox").slide( { mainCell:".bd ul",effect:"leftLoop",autoPlay:true} );</script>
    
    
      
<!---flash--->
 <div class="content_right">
 <div class="content_right_login">
      <img src="images/load.jpg" style="width:220px; height:236px; border:#ddd solid 1px;" /> </div>  
 <div class="guang">
<div class="effect" style="width:528px;height:120px;">
					<div id="leftMarquee" class="leftLoop" style="width:528px;height:177px;">
                        
                        
					  <div class="hd">
                          <div class="middle"> 推荐图书<img src="images/gif_j.gif"/></div>
                <a class="next"></a>
							<a class="prev"></a>						
                      </div>
						<div class="bd">
							<ul class="picList" style=" color:#000000; text-decoration:none;">
							<%
       							BookService bookService=new BookService();
       							List bestSaleBookList=bookService.listAllBooksOrderByBookId(6);
       							for(int i=0;i<bestSaleBookList.size();i++){
       								Book book=(Book)bestSaleBookList.get(i);
       			
       						 %>
								<li>
									<div class="pic"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>"><img src="<%="BookImages/" + book.getBook_locationName() %>" /></a></div>
									<div class="title" ><%=book.getBook_name() %></div>
									<span class="price">￥<%=book.getBook_price() %></span>
								</li>
							<%} %>
							</ul>
						</div>
					</div>
					<script type="text/javascript">jQuery("#leftMarquee").slide({ mainCell:".bd ul",effect:"leftMarquee",vis:3,interTime:40,autoPlay:true });</script>
		    </div>
	       </div><!---guang--->
       <div class="slideTxtBox" style="color:#000000; text-decoration:none; ">
						<div class="hd" style="font-weight:bold; text-decoration:none;">
							<ul><li>教育</li><li>培训</li><li>出国</li></ul>
						</div>
						<div class="bd">
							<ul class="infoList" >
								<li>中国打破了世界软件巨头规则</li>
								<li>口语：会说中文就能说英语！</li>
								<li>农场摘菜不如在线学外语好玩</li>
								<li>数理化老师竟也看学习资料？</li>
							</ul>
							<ul class="infoList" >
								<li>名师教作文：３妙招巧写高分</li>
								<li>耶鲁小子：教你备考SAT</li>
								<li>施强：高端专业语言教学</li>
								<li>数理化老师竟也看学习资料？</li>
							</ul>
							<ul class="infoList" >
								<li>澳大利亚八大名校招生说明会</li>
								<li>2012世界大学排名新鲜出炉</li>
								<li>新加坡留学，国际双语课程</li>
								<li>高考后留学日本名校随你选</li>
							</ul>
						</div>
					</div>
			
					<script type="text/javascript">jQuery(".slideTxtBox").slide({effect:"top"});</script>
			
        </div>
<!---fen--->
   </div><!---content_r--->


<div class="xinpin">
   <div class="biaoti"></div>
   <div class="biaoti-tu">
       <ul>
       	<%
       	
       		List newBookList=bookService.listAllBooksOrderByBookId(6);
       		for(int i=0;i<newBookList.size();i++){
       			Book book=(Book)newBookList.get(i);
       			
       	 %>
            <li>
           <span class="img"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>" target="_blank"><img src="<%="BookImages/" + book.getBook_locationName() %>" width="138px" height="138px" /></a></span><br />
            <div class="desp" style="text-align:center;"><%=book.getBook_name() %></div>
            <span class="price">￥<%=book.getBook_price() %></span><br>
            </li>
           <%} %>
          
       </ul>
   </div><!---biaoti-tu--->
</div><!---xinpin--->
<div class="shuma">
     <div class="shuma-topic"><span>
     <a href="book_listByClass.jsp?class_id=5" >悬疑小说</a>
     <a href="book_listByClass.jsp?class_id=1" >教科书</a>
     <a href="book_listByClass.jsp?class_id=3" >科普读物</a>
     <a href="book_listByClass.jsp?class_id=7" >经济</a>
     <a href="book_listByClass.jsp?class_id=10" >英文原版书</a>
     </span></div>
     <div class="shuma-content">
          <div class="content-left"><a href="#" target="_blank"><img src="goods/du1.jpg" alt="独家好书"/></a></div>
          <div class="content-right">
             <div class="content-right-shang">
                  <ul>
                  	<%
       					List bestSaleBookList1=bookService.listAllBooksOrderBySaleNum(5);
       					for(int i=0;i<bestSaleBookList1.size();i++){
       						Book book=(Book)bestSaleBookList1.get(i);
       			
       				 %>
                      <li>
                      <span class="img1"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>" target="_blank"><img src="<%="BookImages/" + book.getBook_locationName() %>"  width="112px" height="112px"/></a></span><br />
                      <div class="desp" style="text-align:center;"><%=book.getBook_name() %></div>
                      <span class="price1">￥<%=book.getBook_price() %></span>
                      </li>
                     <%} %>
                </ul>
             </div>
             <div class="content-right-guang"><a href="#" alt="" target="_blank"><img src="goods/public.png" /></a></div>
          </div>
     </div><!---shuma-content--->
</div><!---shuma--->

<div class="shuma">
     <div class="shuma-topictwo"></div>
     <div class="shuma-content">
          <div class="content-left"><a href="#" target="_blank"><img src="goods/tao1.jpg" alt="��ʽmp4"/></a></div>
          <div class="content-right">
             <div class="content-right-shang">
                  <ul>
               	    <%
       				//	List bestSaleBookList=bookService.listAllBooksOrderBySaleNum(5);
       					for(int i=0;i<5;i++){
       						Book book=(Book)bestSaleBookList.get(i);
       			
       				 %>
                      <li>
                      <span class="img1"><a href="BookServlet?type=getBookInfo&&book_id=<%=book.getBook_id() %>" target="_blank"><img src="<%="BookImages/" + book.getBook_locationName() %>"  width="112px" height="112px"/></a></span><br />
                      <div class="desp" style="text-align:center;"><%=book.getBook_name() %></div>
                      <span class="price1">￥<%=book.getBook_price() %></span>
                      </li>
                     <%} %>
                </ul>
             </div>
              <div class="content-right-guang"><a href="#" alt="������С����" target="_blank"><img src="goods/bottom.jpg" /></a></div>
          </div>
     </div><!---shuma-content--->
</div><!---shuma--->
<div class="lianjie">
   <div class="lian1"><span><br /><a href="#" style="font-size:14px; font-weight:bold; color:#F00">友情连接</a><br /><a href="#">如此网</a><br /><a href="#">手机话费</a><br /><a href="#">网络电话</a></span></div>
   <div class="lian1"><span><br /><a href="#">友情连接</a><br /><a href="#">如此网</a><br /><a href="#">手机话费</a><br /><a href="#">网络电话</a></span></div>
   <div class="lian1"><span><br /><a href="#">中国移动</a><br /><a href="#">电脑商城</a><br /><a href="#">哈佛网</a><br /><a href="#">手机购点卡</a></span></div>
   <div class="lian1"><span><br /><a href="#">手机购物</a><br /><a href="#">北京生活网</a><br /><a href="#">有啥网</a><br /><a href="#">我们网</a></span></div>
   <div class="lian1"><span><br /><a href="#">移动手机钱包</a><br /><a href="#">彩客网</a><br /><a href="#">新浪乐居</a><br /><a href="#">易宝支付</a></span></div>
   <div class="lian1"><span><br /><a href="#">电脑商城网</a><br /><a href="#">高尔夫球具</a><br /><a href="#">乐购城</a><br /><a href="#">奥运运动城</a></span></div>
   <div class="lian1"><span><br /><a href="#">服装商城</a><br /><a href="#">北京生活网</a><br /><a href="#">网上购物论坛</a><br /><a href="#">家居装饰网</a></span></div>
   <div class="lian1"><span><br /><a href="#">中国联通</a><br /><a href="#">EC宝购物导航</a><br /><a href="#">网上充话费</a><br /><a href="#">开心校友</a></span></div>
   <div class="lian1"><span><br /><a href="#">宝贝商城</a><br /><a href="#">腾讯数码</a><br /><a href="#">阿里巴巴数码</a><br /><a href="#">第三媒体</a></span></div>
   <div class="lian1"><span><br /><a href="#">中华科技网</a><br /><a href="#">万维家电网</a><br /><a href="#">IT商业网</a><br /><a href="BackAdmin/adminLogin.jsp">云影网</a></span></div>
</div><!---lianjie--->
<div class="bangzhu"><a href="#" target="_blank"><img src="goods/bottom1.gif" /></a><a href="#" target="_blank"><img src="goods/bottom2.gif" /></a><a href="#" target="_blank"><img src="goods/bottom3.gif" /></a><a href="#" target="_blank"><img src="goods/bottom4.gif" /></a></div>

<div class="guanyu"><a href="#">关于云影书城</a><a href="#">服务条款</a><a href="#">帮助中心</a><a href="#">友情链接</a><a href="#">支付说明</a><a href="#">客服服务</a><a href="#">联系我们</a></div>
</body>
</html>
