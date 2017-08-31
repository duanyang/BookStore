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

import com.imu.csbookstore.javabean.Delivery;
import com.imu.csbookstore.javabean.User;
import com.imu.csbookstore.service.DeliveryService;
import com.imu.csbookstore.service.IndentService;
import com.imu.csbookstore.service.ShoppingCartService;
import com.imu.csbookstore.service.UserService;
import com.imu.csbookstore.util.SessionChecker;

public class DeliveryServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeliveryServlet() {
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
		DeliveryService service = new DeliveryService();
		try {
			if (type.equals("addWhenPay")) {
				System.out.println("in deliveryServlet,type=add..");
				Delivery delivery = new Delivery();
				delivery.setDelivery_name(request.getParameter("delivery_name"));
				
				
				
				delivery.setDelivery_address(request
						.getParameter("delivery_address"));
				delivery.setDelivery_phone(request
						.getParameter("delivery_phone"));
				delivery.setDelivery_zipcode(request
						.getParameter("delivery_zipcode"));
				SessionChecker sessionChecker = new SessionChecker(request);
				int user_id = sessionChecker.getUser_id();
				delivery.setUser_id(user_id);
				service.addDelivery(delivery);
				response.sendRedirect("ShoppingCartServlet?type=beforePay");
			} else if (type.equals("list")) {
				/*
				 * List list = new ArrayList(); list = service.ListCart();
				 * request.setAttribute("list", list);
				 * request.getRequestDispatcher("shoppingCart_list.jsp")
				 * .forward(request, response);
				 */
			} else if (type.equals("user_modify")) {// 用户在个人信息页面点击收货地址修改，跳到修改页面.
//				int delivery_id = Integer.parseInt(request.getParameter("delivery_id"));
//				request.setAttribute("delivery_id", delivery_id);
				request.getRequestDispatcher("editAddress.jsp").forward(
						request, response);

			} else if (type.equals("user_delete")) {
				if(request.getParameter("delivery_id")==null){
					response.sendRedirect("error.jsp");
				}else{
					int delivery_id=Integer.parseInt(request.getParameter("delivery_id"));
					service.deleteDeliveryByDeliveryID(delivery_id);
					request.getRequestDispatcher("UserServlet?type=personalInfo").forward(
							request, response);
				}
			} else if (type.equals("user_modified")) {
				System.out.println("in user_modified...");
				if(request.getParameter("delivery_id")==null){
					String errorInfo="request.getParameter =null.";
					request.setAttribute("errorInfo", errorInfo);
					request.getRequestDispatcher("error.jsp").forward(
							request, response);
				}
				
				int delivery_id=Integer.parseInt(request.getParameter("delivery_id"));
				int user_id=Integer.parseInt(request.getParameter("user_id"));
				System.out.println("delivery_id="+delivery_id);
				String delivery_name=request.getParameter("delivery_name");
				String delivery_address=request.getParameter("delivery_address");
				String delivery_phone=request.getParameter("delivery_phone");
				String delivery_zipcode=request.getParameter("delivery_zipcode");
				Delivery delivery = new Delivery();
				delivery.setDelivery_address(delivery_address);
				delivery.setDelivery_name(delivery_name);
				delivery.setDelivery_phone(delivery_phone);
				delivery.setDelivery_zipcode(delivery_zipcode);
				delivery.setDelivery_id(delivery_id);
//				delivery.setUser_id(user_id);
				service.modifyDelivery(delivery);
				response.sendRedirect("UserServlet?type=personalInfo");
				 
			} else if (type.equals("beforePay")) {
				/*
				 * List list = new ArrayList(); list = service.ListCart();
				 * double totalPrice=service.getTotalPrice();
				 * request.setAttribute("list", list);
				 * request.setAttribute("totalPrice", totalPrice);
				 * request.getRequestDispatcher("beforePay.jsp")
				 * .forward(request, response);
				 */
			} else if (type.equals("pay")) {
				// IndentService indentService=new IndentService();

			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
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
