package com.imu.csbookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.imu.csbookstore.javabean.Administrator;
import com.imu.csbookstore.service.AdministratorService;

public class AdministratorServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdministratorServlet() {
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
		String administrator_name = request.getParameter("administrator_name");
		String administrator_pass = request.getParameter("administrator_pass");
		String type = request.getParameter("type");
		AdministratorService service = new AdministratorService();
		try {
			if (type.equals("login")) {
				Administrator u = new Administrator();
				u.setAdministrator_name(administrator_name);
				u.setAdministrator_pass(administrator_pass);
				if (service.isExist(u)) {
					HttpSession session = request.getSession();
					session.setAttribute("administrator_name",
							administrator_name);
					request.getRequestDispatcher("BackAdmin/main.html")
							.forward(request, response);
				} else {
					request.setAttribute("result", "用户名或密码错误");
					request.getRequestDispatcher("BackAdmin/adminLogin.jsp")
							.forward(request, response);

				}
			} else if (type.equals("add")) {
				String administrator_mail = request
						.getParameter("administrator_mail");
				Administrator u = new Administrator();
				u.setAdministrator_name(administrator_name);
				u.setAdministrator_pass(administrator_pass);
				if (administrator_mail != null)
					u.setAdministrator_mail(administrator_mail);
				service.addAdministrator(u);
				response.sendRedirect("AdministratorServlet?type=list");
			} else if (type.equals("list")) {
				request.getRequestDispatcher(
						"BackAdmin/administrator_list_new1.jsp").forward(
						request, response);
			} else if (type.equals("modify")) {
				int administrator_id = Integer.parseInt(request
						.getParameter("administrator_id"));
				Administrator admin = service
						.getAdministratorById(administrator_id);
				request.setAttribute("admin", admin);
				request.getRequestDispatcher(
						"BackAdmin/administrator_modify.jsp").forward(request,
						response);
			} else if (type.equals("delete")) {
				int administrator_id = Integer.parseInt(request
						.getParameter("administrator_id"));
				service.deleteAdministratorByAdministratorId(administrator_id);
				response.sendRedirect("AdministratorServlet?type=list");
			} else if (type.equals("modified")) {
				String administrator_mail = request
						.getParameter("administrator_mail");
				Administrator admin = new Administrator();
				admin.setAdministrator_name(administrator_name);
				admin.setAdministrator_pass(administrator_pass);
				admin.setAdministrator_id(Integer.parseInt(request
						.getParameter("administrator_id")));
				admin.setAdministrator_mail(administrator_mail);
				service.modifyAdministrator(admin);
				response.sendRedirect("AdministratorServlet?type=list");
			} else if (type.equals("jump")) {
				int pageToJump = Integer.parseInt(request
						.getParameter("pageToJump"));

				request.getRequestDispatcher(
						"BackAdmin/administrator_list_new1.jsp?page="
								+ pageToJump).forward(request, response);
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
