<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right_template.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="BackAdmin/images/skin.css" rel="stylesheet" type="text/css" />

  </head>
  
<body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="BackAdmin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="BackAdmin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">修改管理员信息</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="BackAdmin/images/mail_rightbg.gif"><img src="BackAdmin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="BackAdmin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    </br>
    </br>
    <%
  	Administrator admin=(Administrator)request.getAttribute("admin");
  %>
 <form name="form1" method="post" action="AdministratorServlet?type=modified">
    <table width="80%" border="0" align="center">
    <tr>
        <td width="29%" align="right" valign="middle">用户ID：</td>
        <td width="71%"><label>
        <input name="administrator_id" type="hidden" value="<%=admin.getAdministrator_id() %>">
          <label><%=admin.getAdministrator_id() %></label>
      </label></td>
      </tr>
      <tr>
        <td width="29%" height="22" align="right" valign="middle">用户名：</td>
        <td width="71%"><label>
        <input name="administrator_name" type="hidden" value="<%=admin.getAdministrator_name() %>">
          <label><%=admin.getAdministrator_name() %></label>
        </label></td>
      </tr>
      <tr>
        <td align="right" valign="middle">密码：</td>
        <td><label>
          <input name="administrator_pass" type="text" id="administrator_pass" value="<%=admin.getAdministrator_pass() %>">
        </label></td>
      </tr>
      <tr>
        <td align="right" valign="middle">邮箱：</td>
        <td><label>
          <input name="administrator_mail" type="text" id="administrator_mail" value="<%=admin.getAdministrator_mail() %>">
        </label></td>
      </tr>
      <tr>
        <td align="right" valign="middle">&nbsp;</td>
        <td><label>
          <input type="submit" name="Submit" value="提交">&nbsp;&nbsp;
        </label>
          <label>
          <input type="reset" name="Submit2" value="重置">
        </label></td>
      </tr>
   </table>
    
  </form>

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
