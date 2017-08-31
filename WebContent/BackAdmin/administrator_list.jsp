<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="BackAdmin/images/skin.css" rel="stylesheet" type="text/css" />

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type="text/css">
<!--
a:link {
	color: #0033CC;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #330033;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style></head>
  
<body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="BackAdmin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="BackAdmin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">查看管理员</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="BackAdmin/images/mail_rightbg.gif"><img src="BackAdmin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="BackAdmin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    </br>
    </br>
    
    
    <table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#333333">
    <th width="224" bgcolor="#EEEEEE"><div align="center">用户ID</div></th>
    <th width="245" bgcolor="#EEEEEE"><div align="center">用户名</div></th>
    <th width="240" bgcolor="#EEEEEE"><div align="center">密码</div></th>
    <th width="237" bgcolor="#EEEEEE"><div align="center">邮箱</div></th>
    <th width="164" bgcolor="#EEEEEE"><div align="center">操作</div></th>
   <%
    	List list=(List)request.getAttribute("list"); 
        if(list!=null){
        	for(int i=0;i<list.size();i++){
        		Administrator admin= (Administrator)list.get(i);
    %><tr>
    		<td ><div align="center"><%=admin.getAdministrator_id() %></div></td>
    		<td><div align="center"><%=admin.getAdministrator_name() %></div></td>
    		<td><div align="center"><%=admin.getAdministrator_pass() %></div></td>
    		<td><div align="center"><%=admin.getAdministrator_mail() %></div></td>
    		<td><div align="center"><a href="AdministratorServlet?type=modify&&administrator_id=<%=admin.getAdministrator_id() %>">修改</a>
   		  &nbsp;<a href="AdministratorServlet?type=delete&&administrator_id=<%=admin.getAdministrator_id() %>">删除</a> </div></td>
    	</tr>
    	<%} } %>
  </table>

   	</td>
    <td background="BackAdmin/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="BackAdmin/images/mail_leftbg.gif"><img src="BackAdmin/images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="BackAdmin/images/buttom_bgs.gif"><img src="BackAdmin/images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="BackAdmin/images/mail_rightbg.gif"><img src="BackAdmin/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
</html>
