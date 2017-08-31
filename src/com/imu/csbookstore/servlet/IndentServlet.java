package com.imu.csbookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.imu.csbookstore.javabean.User;
import com.imu.csbookstore.service.IndentService;
import com.imu.csbookstore.service.UserService;
import com.imu.csbookstore.util.SessionChecker;

public class IndentServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public IndentServlet() {
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
		IndentService service = new IndentService();
		try {
			if (type.equals("add")) {
				/*
				 * String user_mail = request.getParameter("user_mail"); User u
				 * = new User(); u.setUser_name(user_name);
				 * u.setUser_pass(user_pass); u.setUser_mail(user_mail);
				 * service.addUser(u);
				 * response.sendRedirect("UserServlet?type=list");
				 */
			} else if (type.equals("list")) {// 用户点击查看订单，返回自己的订单
				SessionChecker sessionChecker = new SessionChecker(request);
				if (sessionChecker.checkUser()) {
					/*
					 * int user_id = sessionChecker.getUser_id(); List list =
					 * new ArrayList(); list =
					 * service.listIndentByUserID(user_id);
					 * request.setAttribute("list", list);
					 */
					request.getRequestDispatcher("historyIndent.jsp").forward(
							request, response);
				} else {  
					response.sendRedirect("login.jsp");
				}
			} else if (type.equals("modify")) {
				/*
				 * int user_id =
				 * Integer.parseInt(request.getParameter("user_id")); User user
				 * = service.getUserByUserId(user_id);
				 * request.setAttribute("user", user);
				 * request.getRequestDispatcher("BackAdmin/user_modify.jsp")
				 * .forward(request, response);
				 */
			} else if (type.equals("listAll")) {// 管理员点击查看所有订单。
				/*
				List list = new ArrayList();
				list = service.listAllindent();
				request.setAttribute("list", list);
				*/
				request.getRequestDispatcher("BackAdmin/indent_listAll.jsp")
						.forward(request, response);
			} else if (type.equals("delete")) {// 管理员操作，删除订单。
				int indent_id = Integer.parseInt(request
						.getParameter("indent_id"));
				service.deleteIndentByIndentID(indent_id);
				if(request.getParameter("user_id")==null){	
					response.sendRedirect("IndentServlet?type=listAll");
				}else{
					int user_id=Integer.parseInt(request.getParameter("user_id"));
					response.sendRedirect("BackAdmin/indent_listPersonal.jsp?user_id="+user_id);
				}

			} else if (type.equals("modified")) {

			} else if (type.equals("user_cancel")) {
				int indent_id = Integer.parseInt(request
						.getParameter("indent_id"));
				service.modifyIndentState(indent_id, 3);
				response.sendRedirect("IndentServlet?type=list");
			} else if (type.equals("admin_cancel")) {
				int indent_id = Integer.parseInt(request
						.getParameter("indent_id"));
				service.modifyIndentState(indent_id, 3);
				
				if(request.getParameter("user_id")==null){	
					//user_id说明是查看所有订单时候点的取消，取消后继续跳到那个页面
					response.sendRedirect("IndentServlet?type=listAll");
				}else{
					int user_id=Integer.parseInt(request.getParameter("user_id"));
					response.sendRedirect("BackAdmin/indent_listPersonal.jsp?user_id="+user_id);
				}
			} else if (type.equals("user_confirmPay")) {
				int indent_id = Integer.parseInt(request
						.getParameter("indent_id"));
				service.modifyIndentState(indent_id, 2);
				response.sendRedirect("IndentServlet?type=list");
			} else if (type.equals("admin_confirmPay")) {
				int indent_id = Integer.parseInt(request
						.getParameter("indent_id"));
				service.modifyIndentState(indent_id, 2);
				if(request.getParameter("user_id")==null){	
					//user_id说明是查看所有订单时候点的取消，取消后继续跳到那个页面
					response.sendRedirect("IndentServlet?type=listAll");
				}else{
					int user_id=Integer.parseInt(request.getParameter("user_id"));
					response.sendRedirect("BackAdmin/indent_listPersonal.jsp?user_id="+user_id);
				}
			} else if (type.equals("deliverGoods")) {
				int indent_id = Integer.parseInt(request
						.getParameter("indent_id"));
				service.modifyIndentState(indent_id, 4);
				if(request.getParameter("user_id")==null){	
					//user_id说明是查看所有订单时候点的取消，取消后继续跳到那个页面
					response.sendRedirect("IndentServlet?type=listAll");
				}else{
					int user_id=Integer.parseInt(request.getParameter("user_id"));
					response.sendRedirect("BackAdmin/indent_listPersonal.jsp?user_id="+user_id);
				}
			} else if (type.equals("user_confirmGoods")) {
				int indent_id = Integer.parseInt(request
						.getParameter("indent_id"));
				service.modifyIndentState(indent_id, 5);
				response.sendRedirect("IndentServlet?type=list");
			} else if (type.equals("searchIndent")) {
				/*
				List list = new ArrayList();
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				list = service.listIndentByUserID(user_id);
				request.setAttribute("list", list);
				*/
				request.getRequestDispatcher("BackAdmin/indent_listAll.jsp")
						.forward(request, response);

			}else if (type.equals("jump")) {
				int pageToJump = Integer.parseInt(request
						.getParameter("pageToJump"));
				if(request.getParameter("user_id")==null){	
					request.getRequestDispatcher(
							"BackAdmin/indent_listAll.jsp?page="
									+ pageToJump).forward(request, response);
				}else{
					int user_id=Integer.parseInt(request.getParameter("user_id"));
					request.getRequestDispatcher(
							"BackAdmin/indent_listPersonal.jsp?page="
									+ pageToJump+"&&user_id="+user_id).forward(request, response);
				}
				
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
