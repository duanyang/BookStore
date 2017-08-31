package com.imu.csbookstore.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.imu.csbookstore.javabean.Administrator;
import com.imu.csbookstore.javabean.Book;
import com.imu.csbookstore.service.AdministratorService;
import com.imu.csbookstore.service.BookClassService;
import com.imu.csbookstore.service.BookService;
import com.imu.csbookstore.service.CommentService;
import com.imu.csbookstore.service.FavorateService;
import com.imu.csbookstore.util.ImgWriteUtil;
import com.imu.csbookstore.util.UploadUtil;

public class BookServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BookServlet() {
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
		BookService service = new BookService();
		try {
			if (type.equals("add")) {
				UploadUtil uploadUtil = new UploadUtil(request);
				String book_name = uploadUtil.getParameter("book_name");
				String book_author = uploadUtil.getParameter("book_author");
				String book_press = uploadUtil.getParameter("book_press");
				String book_describtion = uploadUtil
						.getParameter("book_describtion");
				int book_num = Integer.parseInt(uploadUtil
						.getParameter("book_num"));
				double book_price = Double.parseDouble(uploadUtil
						.getParameter("book_price"));
				int book_classId = Integer.parseInt(uploadUtil
						.getParameter("book_class"));

				System.out.println("int bookServlet,add book,book price="
						+ book_price);
				System.out.println("int bookServlet,add book,book class id="
						+ book_classId);
				Book book = new Book();
				//
				BufferedInputStream inputStream = uploadUtil
						.getInputStream("profile");
				String fileName = uploadUtil.getFileName("profile");
				String name = "";
				if (inputStream != null && !fileName.equals("")) {

					//System.out.println("ԭʼ�ļ�����" + fileName);
					Calendar calendar = Calendar.getInstance();
					name = String.valueOf(calendar.getTimeInMillis())
							+ fileName.substring(fileName.lastIndexOf("."));
					System.out.println("���ļ�����" + name);
					String filepath = request.getRealPath("\\BookImages")
							+ "\\" + name;
					System.out.println("�ϴ��ļ��ı����ַ�������ƣ�" + filepath);
					// 读取原文件的内容写入到新文件中，即：完成文件的内容复制
					File file = new File(filepath);
					OutputStream outStream = new FileOutputStream(file);
					BufferedOutputStream outputStream = new BufferedOutputStream(
							outStream);
					ImgWriteUtil imgUtil = new ImgWriteUtil();
					imgUtil.writeImg(inputStream, outputStream);
				}
				book.setBook_locationName(name);
				book.setBook_author(book_author);
				book.setBook_describtion(book_describtion);
				book.setBook_name(book_name);
				book.setBook_press(book_press);
				book.setBook_price(book_price);
				book.setBook_number(book_num);
				book.setBook_classId(book_classId);

				service.addBook(book);
				response.sendRedirect("BookServlet?type=list");

			} else if (type.equals("list")) {

				List list = new ArrayList();
				list = service.ListAllBooks();
				request.setAttribute("list", list);
				request.getRequestDispatcher("BackAdmin/book_list.jsp")
						.forward(request, response);

			} else if (type.equals("modify")) {

				int book_id = Integer.parseInt(request.getParameter("book_id"));
				Book book = service.getBookByBookId(book_id);
				request.setAttribute("book", book);
				// //
				BookClassService bookClassService = new BookClassService();
				// 图书分类
				List list = new ArrayList();
				list = bookClassService.ListAllBookClasses();
				request.setAttribute("list", list);
				// ///
				request.getRequestDispatcher("BackAdmin/book_modify.jsp")
						.forward(request, response);

			} else if (type.equals("searchBookById")) {

			} else if (type.equals("searchBookByClassId")) {//在前台分类导航上点击图书分类，显示所有这类书。
				/*
				List list = new ArrayList();
				int class_id = Integer.parseInt(request
						.getParameter("class_id"));
				list = service.searchBookByClass(class_id);
				BookClassService bookClassService = new BookClassService();
				String class_name = bookClassService
						.getClassNameByClassId(class_id);
				// 返回图书列表，跳转到显示图书页面。
				request.setAttribute("bookList", list);
				request.setAttribute("class_name", class_name);
				*/
				request.getRequestDispatcher("book_listByClass.jsp").forward(
						request, response);
			} else if (type.equals("delete")) {
				int book_id = Integer.parseInt(request.getParameter("book_id"));
				String imgPath = request.getRealPath("/BookImages") + "/"
						+ request.getParameter("book_locationName");
				service.deleteBookByBookId(book_id, imgPath);
				response.sendRedirect("BookServlet?type=list");

			} else if (type.equals("modified")) {
				System.out.println(".....modified.....");

				UploadUtil uploadUtil = new UploadUtil(request);
				String book_name = uploadUtil.getParameter("book_name");
				String book_author = uploadUtil.getParameter("book_author");
				String book_press = uploadUtil.getParameter("book_press");
				String book_describtion = uploadUtil
						.getParameter("book_describtion");
				int book_num = Integer.parseInt(uploadUtil
						.getParameter("book_number"));
				double book_price = Double.parseDouble(uploadUtil
						.getParameter("book_price"));
				int book_classId = Integer.parseInt(uploadUtil
						.getParameter("book_class"));
				int book_id = Integer.parseInt(uploadUtil
						.getParameter("book_id"));
				int book_saleNum = Integer.parseInt(uploadUtil
						.getParameter("book_saleNum"));
				Book book = new Book();
				//
				BufferedInputStream inputStream = uploadUtil
						.getInputStream("book_locationName");
				String fileName = uploadUtil.getFileName("book_locationName");
				String name = "";
				if (inputStream != null && !fileName.equals("")) {

					System.out.println("原始文件名：" + fileName);
					Calendar calendar = Calendar.getInstance();
					name = String.valueOf(calendar.getTimeInMillis())
							+ fileName.substring(fileName.lastIndexOf("."));
					System.out.println("新文件名：" + name);
					String filepath = request.getRealPath("\\BookImages")
							+ "\\" + name;
					System.out.println("上传文件的保存地址和新名称：" + filepath);
					// 读取原文件的内容写入到新文件中，即：完成文件的内容复制
					File file = new File(filepath);
					OutputStream outStream = new FileOutputStream(file);
					BufferedOutputStream outputStream = new BufferedOutputStream(
							outStream);
					ImgWriteUtil imgUtil = new ImgWriteUtil();
					imgUtil.writeImg(inputStream, outputStream);
					// 删除原来的图片
					String imgPath = request.getRealPath("/BookImages") + "/"
							+ uploadUtil.getParameter("old_book_locationName");
					File delFile = new File(imgPath);
					// 路径为文件且不为空则进行删除
					if (delFile.isFile() && delFile.exists()) {
						delFile.delete();
					}
				}
				book.setBook_locationName(name);
				book.setBook_author(book_author);
				book.setBook_describtion(book_describtion);
				book.setBook_name(book_name);
				book.setBook_press(book_press);
				book.setBook_price(book_price);
				book.setBook_number(book_num);
				book.setBook_classId(book_classId);
				book.setBook_id(book_id);
				book.setBook_saleNum(book_saleNum);
				service.modifyBook(book);
				response.sendRedirect("BookServlet?type=list");

			} else if (type.equals("displayAddPage")) {
				BookClassService bookClassService = new BookClassService();
				List list = new ArrayList();
				list = bookClassService.ListAllBookClasses();
				request.setAttribute("list", list);
				request.getRequestDispatcher("BackAdmin/book_add.jsp").forward(
						request, response);

			} else if (type.equals("getBookInfo")) {
				Book book = new Book();

				int book_id = Integer.parseInt(request.getParameter("book_id"));
				book = service.getBookByBookId(book_id);
				int class_id = book.getBook_classId();
				BookClassService bookClassService = new BookClassService();
				String class_name = bookClassService
						.getClassNameByClassId(class_id);

				request.setAttribute("book", book);
				request.setAttribute("class_name", class_name);
				request.getRequestDispatcher("bookInformation.jsp").forward(
						request, response);
			} else if (type.equals("search")) {
				
				System.out.println("in serch servlet");
				String keyWords = request.getParameter("keyWords");
				int totalResultNum=service.getSecrchBookNum(keyWords);
				
				request.setAttribute("totalResultNum", totalResultNum);
				request.setAttribute("keyWords", keyWords);
				
				request.getRequestDispatcher("search.jsp").forward(
						request, response);
				
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
