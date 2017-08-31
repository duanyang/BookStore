package com.imu.csbookstore.service;

import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.imu.csbookstore.dao.BookDao;
import com.imu.csbookstore.javabean.Book;

public class BookService {
	BookDao dao = new BookDao();

	public boolean addBook(Book book) throws Exception {
		/*
		 * 图书注册，在数据库中添加一本图书
		 * 
		 * @param Book实体类，代表要添加的用户信息
		 * 
		 * @return 如果图书ID与数据库中的图书有重复，则添加失败，返回false,添加成功返回true
		 */
		return dao.addBook(book);
	}

	public List searchBookByClass(int class_id) throws Exception {
		/*
		 * 按图书类别查找图书
		 * 
		 * @param class_id图书类别编号
		 * 
		 * @return 返回查找到的图书链表
		 */
		return dao.searchBookByClass(class_id);
	}

	public boolean deleteBookByBookId(int book_id, String imgPath)
			throws Exception {
		/*
		 * 通过BID删除一本图书
		 * 
		 * @param bid图书在数据库中的ID
		 * 
		 * @return 删除成功返回true,失败返回false
		 */
		return dao.deleteBookByBookId(book_id, imgPath);
	}

	public boolean modifyBook(Book book) throws Exception {
		/*
		 * 修改图书内容
		 * 
		 * @param Book含有图书信息
		 * 
		 * @return 修改成功返回true,修改失败返回false
		 */
		return dao.modifyBook(book);
	}

	public List ListAllBooks() throws Exception {
		return dao.ListAllBooks();

	}

	public Book getBookByBookId(int book_id) throws Exception {
		return dao.getBookByBookId(book_id);
	}

	public int getBookTotalNumByClassId(int class_id) throws Exception {
		return dao.getBookTotalNumByClassId(class_id);
	}

	public int getBookTotalNum() throws Exception {
		return dao.getBookTotalNum();
	}

	public String getBookNameByBookId(int book_id) throws Exception {
		return dao.getBookNameByBookId(book_id);
	}

	public List listAllBooksOrderBySaleNum(int n) throws Exception {
		return dao.listAllBooksOrderBySaleNum(n);
	}

	public List listAllBooksOrderBySaleNum(int begin, int offset)
			throws Exception {
		return dao.listAllBooksOrderBySaleNum(begin, offset);
	}

	public List listAllBooksOrderByBookId(int n) throws Exception {
		return dao.listAllBooksOrderByBookId(n);
	}

	public List listAllBooksOrderByBookId(int begin, int offset)
			throws Exception {
		return dao.listAllBooksOrderByBookId(begin, offset);
	}

	// 列出某个类别的销量最好的前n本书
	public List listNBooksFromClassOrderBySaleNum(int class_id, int n)
			throws Exception {
		return dao.listNBooksFromClassOrderBySaleNum(class_id, n);
	}
	public List listBooksByClassOrderBySaleNum(int class_id,int begin, int offset)throws Exception {
		return dao.listBooksByClassOrderBySaleNum(class_id,begin,offset);
	}
	
	public int getSecrchBookNum(String keyWords)throws Exception{
		return dao.getSecrchBookNum(keyWords);
	}
	
	public List getSecrchBookByBookName(String keyWords,int begin,int offset)throws Exception{
		return dao.getSecrchBookByBookName(keyWords,begin,offset);
	}
}
