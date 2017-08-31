<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,
com.imu.csbookstore.service.*,com.imu.csbookstore.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="JavaScript" type="text/javascript">
   if (window != top)
      top.location.href = location.href;  
</script>
  <head>
    <base href="<%=basePath%>">
    
    <title>书影区</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="xuyuanCSS/newsubject09.css" rel="stylesheet" type="text/css" />
<link href="xuyuanCSS/style.css" rel="stylesheet" type="text/css" />
<link href="xuyuanCSS/2009newyear.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/move.js"></script>
<script language="JavaScript" type="text/javascript" src="js/ajax.js"></script>



  </head>
  
  <body>
  <div id="header" >
  </div>
<div class="wall"> 
    <OBJECT codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" 
        width="100%" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
        style="height: 373px">
			<PARAM NAME="_cx" VALUE="25003">
			<PARAM NAME="_cy" VALUE="9260">
			<PARAM NAME="FlashVars" VALUE="">
			<PARAM NAME="Movie" VALUE="images/snow.swf">
			<PARAM NAME="Src" VALUE="images/snow.swf">
			<PARAM NAME="WMode" VALUE="Transparent">
			<PARAM NAME="Play" VALUE="-1">
			<PARAM NAME="Loop" VALUE="-1">
			<PARAM NAME="Quality" VALUE="High">
			<PARAM NAME="SAlign" VALUE="">
			<PARAM NAME="Menu" VALUE="-1">
			<PARAM NAME="Base" VALUE="">
			<PARAM NAME="AllowScriptAccess" VALUE="">
			<PARAM NAME="Scale" VALUE="ShowAll">
			<PARAM NAME="DeviceFont" VALUE="0">
			<PARAM NAME="EmbedMovie" VALUE="0">
			<PARAM NAME="BGColor" VALUE="">
			<PARAM NAME="SWRemote" VALUE="">
			<PARAM NAME="MovieData" VALUE="">
			<PARAM NAME="SeamlessTabbing" VALUE="1">
			<PARAM NAME="Profile" VALUE="0">
			<PARAM NAME="ProfileAddress" VALUE="">
			<PARAM NAME="ProfilePort" VALUE="0">
			<embed src="images/snow.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
				type="application/x-shockwave-flash" width="100%" height="350" wmode="transparent">
			</embed>
		</OBJECT>
<%
	CommentService commentService =new CommentService();
	int totalNum=commentService.getCommentTotalNum();
	
	List commentList=commentService.listAllComment();
	UserService userService=new UserService();
	BookService bookService=new BookService();
	for(int i=0;i<commentList.size();i++){
		Comment comment=new Comment();
		
		comment=(Comment)commentList.get(i);
		String user_name=userService.getUserNameByUserId(comment.getUser_id());
		String comment_date=comment.getComment_time();
		String comment_content=comment.getContent();
		String comment_bookName=bookService.getBookNameByBookId(comment.getBook_id());
 %>
<div class="paper"  onMouseDown="initDrag(event)" onMouseUp="upDrag()" style="width:220px; height:141px;position:absolute; z-index:99; left:<%=ToolUtil.getRandInt()%1100 %>px; top:<%=ToolUtil.getRandInt()%350 %>px;background-image:url(xuyuanImg/style0.gif);"> <a href="#" onClick="this.parentNode.style.display='none';" class="close">关闭</a>
    <h2><%=user_name %>于<%=comment_date %>对 《<%=comment_bookName %>》评论道：</h2>
    <h3><%=comment_content %></h3>
</div>
<%} %>

    
   <a href="index.jsp" class="comment-sum">已有 <span class="sum"><%=totalNum %></span> 位会员评论</a> 
   </div>
   <div class="forum"><a href="index.jsp">立即参加</a></div>
<!--10像素间隔-->
</body>
</html>
