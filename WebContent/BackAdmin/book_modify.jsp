<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,com.imu.csbookstore.util.*" pageEncoding="utf-8"%>
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
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="BackAdmin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="BackAdmin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">修改图书</div></td>
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
  	Book book=(Book)request.getAttribute("book");
  	List list=(List)request.getAttribute("list"); 
  	String imgLocation="BookImages/"+book.getBook_locationName();
  %>
 <form action="BookServlet?type=modified" method="post" enctype="multipart/form-data" name="form1">
     <input type="hidden" name="old_book_locationName" value="<%=book.getBook_locationName()%>">
    <input type="hidden" name="book_id" value="<%=book.getBook_id()%>">
     <input type="hidden" name="book_saleNum" value="<%=book.getBook_saleNum() %>">
    <table width="80%" border="0" align="center">
    <tr>
		<td width="21%" rowspan="7">
		  <div align="right"><img src="<%=imgLocation%>" width="<%=GlobalData.imgWidth %>" height="<%=GlobalData.imgHeight %>"  />		    </div></td>
        <td width="8%" align="right" valign="middle">图书名：</td>
        <td width="71%" align="left">
          <label>
          <input name="book_name" type="text" id="book_name" value="<%=book.getBook_name() %>">
          </label></td>
      </tr>
      <tr>
	  <td width="8%"  align="right" valign="middle">作者：</td>
        <td width="71%" align="left">
          <label>
          <input name="book_author" type="text" id="book_author" value="<%=book.getBook_author() %>">
          </label></td>
      </tr>
      <tr>
	  <td width="8%"  align="right" valign="middle">出版社：</td>
        <td width="71%" align="left"><label>
          <input name="book_press" type="text" id="book_press" value="<%=book.getBook_press() %>">
        </label></td>
      </tr>
      <tr>
	  <td width="8%"  align="right" valign="middle">分类：</td>
         <td width="71%" align="left"><label>
          <select name="book_class" >
             <%
        		if(list!=null){
        		for(int i=0;i<list.size();i++){
        			BookClass bookClass= (BookClass)list.get(i);
   			 %>
   			 <option value="<%=bookClass.getClass_id() %>" <% if(bookClass.getClass_id()==book.getBook_classId()){%>selected<% }%> ><%=bookClass.getClass_name() %> </option>
   			 <% }}%>
            </select>
        </label></td>
      </tr>
      <tr>
	  <td width="8%"  align="right" valign="middle">价格：</td>
        <td width="71%" align="left"><label>
          <input name="book_price" type="text" id="book_price" value="<%=book.getBook_price() %>">
        </label></td>
      </tr>
      <tr>
	  <td width="8%"  align="right" valign="middle">数量：</td>
        <td width="71%" align="left"><label>
          <input name="book_number" type="text" id="book_number" value="<%=book.getBook_number() %>">
        </label></td>
      </tr>
      <tr>
	  <td width="8%"  align="right" valign="middle">封面：</td>
         <td width="71%" align="left"><label>
          <input name="book_locationName" type="file" id="book_locationName" >
        </label></td>
      </tr>
      <tr>
	  <td> <div align="right"></div></td>
        <td width="8%"  align="right" valign="middle">描述：</td>
        <td width="71%" align="left"><label>
          <textarea name="book_describtion" rows="5" id="book_describtion" ><%=book.getBook_describtion() %></textarea>
        </label></td>
      </tr>
      <tr>
	  <td><div align="right"></div></td>
        <td width="8%"  align="right" valign="middle">&nbsp;</td>
         <td width="71%" align="left"><label>
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
