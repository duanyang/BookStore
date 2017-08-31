<%@ page language="java" import="java.util.*,com.imu.csbookstore.javabean.*,com.imu.csbookstore.util.*,
com.imu.csbookstore.service.*" pageEncoding="utf-8"%>
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
<%
	BookService bookService=new BookService();
	int intPageSize; //一页显示的记录
        int intRowCount; //记录总数
        int intPageCount; //总页
        int intPage; //待显示页
        //设置一页显示的记录�
        intPageSize = 4;
    //取得待显示页�
        String strPage = request.getParameter("page");
        if (strPage == null) {//表明在QueryString中没有page这一个参数，此时显示第一页数�
            intPage = 1;
        } else {//将字符串转换成整�
            intPage = java.lang.Integer.parseInt(strPage);
            if (intPage < 1) {
                intPage = 1;
            }
        }
        intRowCount=bookService.getBookTotalNum();
        //记算总页
        intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
   	 //调整待显示的页码
        if (intPage > intPageCount) {
            intPage = intPageCount;
        }
        int begin=(intPage - 1) * intPageSize ;
	List list=bookService.listAllBooksOrderByBookId(begin,intPageSize ); 
 %>
  
                
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="BackAdmin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="BackAdmin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">查看图书</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="BackAdmin/images/mail_rightbg.gif"><img src="BackAdmin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="BackAdmin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    </br>
    </br>
  
   	<form name="form1" method="post" action="">
   	  <table width="70%" border="1" align="center"  cellpadding="0" cellspacing="0">
        <tr>
          <td width="26%"><div align="center">封面</div></td>
          <td width="51%"><div align="center">描述</div></td>
          <td width="23%"><div align="center">操作</div></td>
        </tr>
        <%
        	if(list!=null){
        		for(int i=0;i<list.size();i++){
        			Book book=(Book)list.get(i);
        			//String imgLocation=request.getRealPath("\\BookImages") + "\\" + book.getBook_locationName();
        			String imgLocation="BookImages/"+book.getBook_locationName();
         %>
        <tr>
          <td>
            <div align="center">
            <!-- <%=imgLocation %> -->
            <img src="<%=imgLocation%>" width="<%=GlobalData.imgWidth %>" height="<%=GlobalData.imgHeight %>"  />          	</div>          </td>
          <td>
            <div align="left">书名：<%=book.getBook_name() %><br/>
              作者：<%=book.getBook_author() %><br/>
              出版社：<%=book.getBook_press() %><br/>
              价格：<%=book.getBook_price() %><br/>
              数量：<%=book.getBook_number() %><br/>
              销售量：<%=book.getBook_saleNum() %><br/>
            内容介绍：<%=book.getBook_describtion() %>            </div></td><td><div align="center">
           
            <a href="BookServlet?type=modify&&book_id=<%=book.getBook_id() %>">修改</a>&nbsp;
            <a href="BookServlet?type=delete&&book_id=<%=book.getBook_id() %>&&book_locationName=<%=book.getBook_locationName()%>">删除</a>
            &nbsp; <a href="CommentServlet?type=searchComment&&book_id=<%=book.getBook_id() %>">查看评论</a>
            </div></td>
        </tr>
        <%}} %>
		 <tr>
          <td colspan="3"><div align="right">
          
                 第<%=intPage%>页，共<%=intPageCount%>页 &nbsp;
    <%if (intPage > 1) {
        %>
        <a href="BackAdmin/book_list.jsp?page=<%=intPage - 1%>">上一页</a>
            <%}%>
            <%if (intPage < intPageCount) {%>
            <a href="BackAdmin/book_list.jsp?page=<%=intPage + 1%>" >下一页</a>
                <%}%>
          
          </div>
                      </td>
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

