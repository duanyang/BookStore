<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
  <table width="273" border="0" align="center">
    <tr>
      <td width="84">用户名：</td>
      <td width="179"><input type="text" name="userName" id="userName" /></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><input type="text" name="userPassword" id="userPassword" /></td>
    </tr>
    <tr>
      <td>重复密码：</td>
      <td><input type="text" name="confirmUserPassword" id="confirmUserPassword" /></td>
    </tr>
    <tr>
      <td>邮箱：</td>
      <td><input type="text" name="mailAddress" id="mailAddress" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="提交" />&nbsp;&nbsp;
      <input type="reset" name="button2" id="button2" value="重置" /></td>
    </tr>
  </table>
</form>
</body>
</html>