package com.imu.csbookstore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.imu.csbookstore.javabean.User;
import com.imu.csbookstore.service.UserService;
import com.imu.csbookstore.util.SessionChecker;

public class UserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
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
		String user_name = request.getParameter("user_name");
		String user_pass = request.getParameter("user_pass");
		String type = request.getParameter("type");
		UserService service = new UserService();
		HttpSession session = request.getSession();
		try {
			if (type.equals("login")) {
				String validate=request.getParameter("validate");
				String rand=(String)session.getAttribute("rand");
				if(!validate.equals(rand))
				{
					request.setAttribute("result", "验证码不正确");
					request.setAttribute("user_name", user_name);
					 request.getRequestDispatcher("login.jsp").forward(request,
								response);
				}
				else
				{
				  System.out.println("user_name=" + user_name);
				  System.out.println("user_pass=" + user_pass);
				  User u = new User();
				  u.setUser_name(user_name);
				  u.setUser_pass(user_pass);
				  if (service.isExist(u)) {

					u.setUser_id(service.getUserIdByUserName(user_name));
					session.setAttribute("user", u);
					request.getRequestDispatcher("main.jsp").forward(request,
							response);
				   } else {
					// request.setAttribute("result", "用户名或密码错误");
					request.getRequestDispatcher("login.jsp").forward(request,
							response);

				   }
				}
			} else if (type.equals("add")) {
				String user_mail = request.getParameter("user_mail");
				User u = new User();
				u.setUser_name(user_name);
				u.setUser_pass(user_pass);
				u.setUser_mail(user_mail);
				service.addUser(u);
				response.sendRedirect("UserServlet?type=list");
			} else if (type.equals("regist")) {
				String yan=request.getParameter("yan");
				String rand=(String)session.getAttribute("rand");
				String user_mail = request.getParameter("user_mail");
				if(!yan.equals(rand))
				{
					 request.setAttribute("result", "验证码不正确");
					 request.setAttribute("user_name", user_name);
					 request.setAttribute("user_mail", user_mail);
					 request.getRequestDispatcher("regist.jsp").forward(request,
								response);
				}
				else
				{
				   
				   User u = new User();
				   u.setUser_name(user_name);
				   u.setUser_pass(user_pass);
				   u.setUser_mail(user_mail);
				   service.addUser(u);

				   int user_id = service.getUserIdByUserName(user_name);
				   u.setUser_id(user_id);
				   System.out.println("user_id=" + user_id);
				   session.setAttribute("user", u);
				   response.sendRedirect("main.jsp");
				}
			} else if (type.equals("list")) {
				List list = new ArrayList();
				list = service.listAllUsers();
				request.setAttribute("list", list);
				request.getRequestDispatcher("BackAdmin/user_list.jsp")
						.forward(request, response);
			} else if (type.equals("modify")) {
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				User user = service.getUserByUserId(user_id);
				request.setAttribute("user", user);
				request.getRequestDispatcher("BackAdmin/user_modify.jsp")
						.forward(request, response);
			} else if (type.equals("delete")) {
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				service.deleteUserByUid(user_id);
				response.sendRedirect("UserServlet?type=list");
			} else if (type.equals("modified")) {
				String user_mail = request.getParameter("user_mail");
				User user = new User();
				user.setUser_name(user_name);
				user.setUser_pass(user_pass);
				user.setUser_id(Integer.parseInt(request
						.getParameter("user_id")));
				user.setUser_mail(user_mail);
				service.modifyUser(user);
				response.sendRedirect("UserServlet?type=list");
			}else if(type.equals("user_modify")){//用户自己修改个人信息.
				String user_mail = request.getParameter("user_mail");
				User user = new User();
				user.setUser_name(user_name);
				user.setUser_pass(user_pass);
				user.setUser_id(Integer.parseInt(request
						.getParameter("user_id")));
				user.setUser_mail(user_mail);
				service.modifyUser(user);
				response.sendRedirect("UserServlet?type=personalInfo");
			} else if (type.equals("exit")) {

				session.invalidate();
				request.getRequestDispatcher("main.jsp").forward(request,
						response);
			} else if (type.equals("personalInfo")) {// 点击导航，显示会员个人信息。
				SessionChecker sessionChecker = new SessionChecker(request);
				if (sessionChecker.checkUser()) {
					request.getRequestDispatcher("personalInfo.jsp").forward(
							request, response);
				} else {
					response.sendRedirect("login.jsp");
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
