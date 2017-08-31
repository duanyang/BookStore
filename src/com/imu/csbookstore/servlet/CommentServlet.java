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

import com.imu.csbookstore.javabean.Administrator;
import com.imu.csbookstore.javabean.Comment;
import com.imu.csbookstore.service.AdministratorService;
import com.imu.csbookstore.service.CommentService;

public class CommentServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CommentServlet() {
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
		CommentService service = new CommentService();
		try {
			if (type.equals("add")) {
				int book_id = Integer.parseInt(request.getParameter("book_id"));
				int rating=Integer.parseInt(request.getParameter("rating"));
				Comment comment = new Comment();
				comment.setBook_id(book_id);
				comment.setUser_id(Integer.parseInt(request
						.getParameter("user_id")));
				comment.setContent(request.getParameter("content"));
				comment.setRating(rating);
				service.addComment(comment);
				request.getRequestDispatcher(
						"BookServlet?type=getBookInfo&&book_id=" + book_id)
						.forward(request, response);

			} else if (type.equals("list")) {
				List list = new ArrayList();
				list = service.listAllComment();
				request.setAttribute("list", list);
				request.getRequestDispatcher("BackAdmin/comment_list.jsp")
						.forward(request, response);
			} else if (type.equals("delete")) {
				System.out.println("�����ɾ��������");
				int comment_id = Integer.parseInt(request
						.getParameter("comment_id"));
				service.deleteCommentByCommentID(comment_id);
				response.sendRedirect("CommentServlet?type=list");
			} else if (type.equals("searchCommentByUserID")) {
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				List list = new ArrayList();
				list = service.listCommentByUserID(user_id);
				request.setAttribute("list", list);
				request.getRequestDispatcher("BackAdmin/comment_list.jsp")
						.forward(request, response);
			} else if (type.equals("searchComment")) {
				int book_id = Integer.parseInt(request.getParameter("book_id"));
				List list = new ArrayList();
				list = service.listCommentByBookID(book_id);
				request.setAttribute("list", list);
				request.getRequestDispatcher("BackAdmin/comment_list.jsp")
						.forward(request, response);
			}else if (type.equals("jump")) {
				int pageToJump = Integer.parseInt(request
						.getParameter("pageToJump"));
				if(request.getParameter("user_id")==null){	
					request.getRequestDispatcher(
							"BackAdmin/comment_list.jsp?page="
									+ pageToJump).forward(request, response);
				}else{
					int user_id=Integer.parseInt(request.getParameter("user_id"));
					request.getRequestDispatcher(
							"BackAdmin/comment_personal.jsp?page="
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
