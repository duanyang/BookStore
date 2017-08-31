<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'comment_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form name="form1" method="post" action="CommentServlet?type=add">
    <table width="70%" border="0" align="center">
      <tr>
        <td>用户id:</td>
        <td><label>
          <input name="user_id" type="text" id="user_id" value="1">
        </label></td>
      </tr>
      <tr>
        <td>图书id:</td>
        <td><label>
          <input name="book_id" type="text" id="user_pass" value="1">
        </label></td>
      </tr>
      <tr>
        <td height="53">评论内容：</td>
        <td><label>
          <textarea name="content" rows="5"></textarea>
        </label></td>
      </tr>

      <tr>
        <td>&nbsp;</td>
        <td><label>
          <input type="submit" name="Submit" value="提交">
        </label>
          <label>
          <input type="reset" name="Submit2" value="重置">
        </label></td>
      </tr>
    </table>
  </form>
  <br>
  </body>
</html>
