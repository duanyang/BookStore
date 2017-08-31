package com.imu.csbookstore.service;

import java.util.List;

import com.imu.csbookstore.dao.CommentDao;
import com.imu.csbookstore.javabean.Comment;

public class CommentService {
	CommentDao dao = new CommentDao();

	public void addComment(Comment comment) throws Exception {
		/*
		 * 增加一条评论
		 * 
		 * @param comment，代表要添加评论
		 * 
		 * @void
		 */
		dao.addComment(comment);
	}

	public List listCommentByBookID(int book_id) throws Exception {
		/*
		 * 根据图书id列出它的所有评论
		 * 
		 * @param book_id
		 * 
		 * @return List 返回这本书的所有评论链表
		 */
		return dao.listCommentByBookID(book_id);
	}
	
	public List getRatingCountByBookID(int book_id) throws Exception{
		
		return dao.getRatingCountByBookID(book_id);
	}

	public boolean deleteCommentByCommentID(int commentID) throws Exception {
		/*
		 * 通过评论ID从书评中删除一条评论
		 * 
		 * @param commentID评论ID
		 * 
		 * @return 删除成功返回true,失败返回false
		 */
		return dao.deleteCommentByCommentID(commentID);
	}

	public boolean modifyCommentState(int state) throws Exception {
		/*
		 * 修改评论
		 * 
		 * @param state 1代表能够显示
		 * 
		 * @return 修改成功返回true,修改失败返回false
		 */
		CommentDao dao = new CommentDao();
		dao.modifyCommentState(state);
		return true;
	}


	public List listAllComment() throws Exception {
		return dao.listAllComment();
	}

	public List listCommentByUserID(int user_id) throws Exception {
		return dao.listCommentByUserID(user_id);
	}
	public int getCommentTotalNum() throws Exception {
		return dao.getCommentTotalNum();
	}
	public List listAllCommentOrderByUserId(int begin, int offset) throws Exception{
		return dao.listAllCommentOrderByUserId(begin, offset);
	}
	public List listAllCommentOrderByCommentIdAndUserId(int user_id,int begin, int offset) throws Exception{
		return dao.listAllCommentOrderByCommentIdAndUserId(user_id,begin, offset);
	}
	public int getCommentTotalNumByUserId(int user_id) throws Exception {
		return dao.getCommentTotalNumByUserId(user_id);
	}
}
