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

  </head>
<body>
<% 
	List list=(List)request.getAttribute("list"); 
%>

    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="BackAdmin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="BackAdmin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">添加图书</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="BackAdmin/images/mail_rightbg.gif"><img src="BackAdmin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="BackAdmin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    </br>
    </br>
    <!-- enctype="multipart/form-data" -->
    <form action="BookServlet?type=add" method="post" enctype="multipart/form-data" name="form1">
      <table width="79%" border="0" align="center">
        <tr>
          <td width="36%"><div align="right">图书名：</div></td>
          <td width="64%"><label>
            <input name="book_name" type="text" >
          </label></td>
        </tr>
        <tr>
          <td><div align="right">作者：</div></td>
          <td><label>
            <input name="book_author" type="text" >
          </label></td>
        </tr>
        <tr>
          <td><div align="right">出版社：</div></td>
          <td><label>
            <input name="book_press" type="text" >
          </label></td>
        </tr>
        <tr>
          <td><div align="right">价格：</div></td>
          <td><label>
            <input name="book_price" type="text" >
          </label></td>
        </tr>
        <tr>
          <td><div align="right">数量：</div></td>
          <td><label>
            <input name="book_num" type="text" >
          </label></td>
        </tr>
        <tr>
          <td><div align="right">分类：</div></td>
          <td><label>
            <select name="book_class" >
             <%
        		if(list!=null){
        		for(int i=0;i<list.size();i++){
        			BookClass bookClass= (BookClass)list.get(i);
   			 %>
   			 <option value="<%=bookClass.getClass_id() %>" <% if(i==0){%>selected<% }%> ><%=bookClass.getClass_name() %> </option>
   			 <% }}%>
            </select>
          </label></td>
        </tr>
        <tr>
          <td><div align="right">图书封面：</div></td>
          <td><label>
            <input name="profile" type="file" id="profile">
          </label></td>
        </tr>
        <tr>
          <td><div align="right">描述：</div></td>
          <td><label>
            <textarea name="book_describtion" rows="5" id="book_describtion"></textarea>
          </label></td>
        </tr>
        <tr>
          <td><div align="right"></div></td>
          <td><label>
            <input type="submit" name="Submit" value="提交">
          </label>
            <label>
            <input type="reset" name="Submit2" value="重置">
            </label></td>
        </tr>
      </table>
      </form>	</td>
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
