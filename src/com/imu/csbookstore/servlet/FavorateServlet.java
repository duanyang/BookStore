package com.imu.csbookstore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imu.csbookstore.javabean.Administrator;
import com.imu.csbookstore.javabean.Comment;
import com.imu.csbookstore.javabean.Favorate;
import com.imu.csbookstore.javabean.User;
import com.imu.csbookstore.service.FavorateService;
import com.imu.csbookstore.service.ShoppingCartService;
import com.imu.csbookstore.util.DBPoolUtil;
import com.imu.csbookstore.util.SessionChecker;

public class FavorateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FavorateServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * response.setContentType("text/html"); PrintWriter out =
		 * response.getWriter(); out.println(
		 * "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		 * out.println("<HTML>");
		 * out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		 * out.println("  <BODY>"); out.print("    This is ");
		 * out.print(this.getClass()); out.println(", using the GET method");
		 * out.println("  </BODY>"); out.println("</HTML>"); out.flush();
		 * out.close();
		 */
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		FavorateService service = new FavorateService();
		try {
			if (type.equals("searchFavorateByUserID")) {// 管理员查看会员订单
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				List list = new ArrayList();
				list = service.listFavorateByUserID(user_id);
				request.setAttribute("list", list);
				request.getRequestDispatcher("BackAdmin/Favorate_list.jsp")
						.forward(request, response);
			} else if (type.equals("delete")) {
				
				int book_id = Integer.parseInt(request.getParameter("book_id"));
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				service.deleteFavoraterByFavorateID(book_id, user_id);
				response.sendRedirect("FavorateServlet?type=searchFavorateByUserID&&user_id="
						+ user_id);
			}else if (type.equals("user_delete")) {
				
				int book_id = Integer.parseInt(request.getParameter("book_id"));
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				service.deleteFavoraterByFavorateID(book_id, user_id);
				response.sendRedirect("favorate.jsp");
			}
			else if (type.equals("add")) {
				Favorate u = new Favorate();

				int book_id = Integer.parseInt(request.getParameter("book_id"));
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				if (!service.isExist(user_id, book_id)) {//当前收藏夹没有收藏
					u.setUser_id(user_id);
					u.setBook_id(book_id);
					service.addFavorate(u);
				} 			
				//response.sendRedirect("BookServlet?type=getBookInfo&&book_id="+book_id);
				request.getRequestDispatcher("favorate.jsp")
				.forward(request, response);
			} else if (type.equals("personalFavorate")) {
				SessionChecker sessionChecker = new SessionChecker(request);
				if (sessionChecker.checkUser()) {

					request.getRequestDispatcher("favorate.jsp")
							.forward(request, response);
				} else {
					response.sendRedirect("login.jsp");
				}
			}else if (type.equals("jump")) {
				int pageToJump = Integer.parseInt(request
						.getParameter("pageToJump"));
				
					int user_id=Integer.parseInt(request.getParameter("user_id"));
					request.getRequestDispatcher(
							"BackAdmin/Favorate_list.jsp?page="
									+ pageToJump+"&&user_id="+user_id).forward(request, response);
				}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("BackAdmin/error.jsp");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
