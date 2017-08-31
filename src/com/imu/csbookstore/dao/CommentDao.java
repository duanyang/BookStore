package com.imu.csbookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.imu.csbookstore.javabean.Comment;
import com.imu.csbookstore.javabean.RatingCount;
import com.imu.csbookstore.util.DBPoolUtil;

public class CommentDao {
	public void addComment(Comment comment) throws Exception {
		/*
		 * 增加一条评论
		 * 
		 * @param comment，代表要添加评论
		 * 
		 * @void
		 */
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_comment(book_id,user_id,content,comment_time, rating) values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, comment.getBook_id());
		pstmt.setInt(2, comment.getUser_id());
		pstmt.setString(3, comment.getContent());
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String nowTime = df.format(now);
		pstmt.setString(4, nowTime);
		pstmt.setInt(5, comment.getRating());
		pstmt.executeUpdate();
	}

	public List listCommentByBookID(int book_id) throws Exception {
		/*
		 * 根据图书id列出它的所有评论
		 * 
		 * @param book_id
		 * 
		 * @return List 返回这本书的所有评论链表
		 */
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_comment where book_id=" + book_id + " order by rating DESC, comment_time DESC";
		Statement stmt;
		List list = new ArrayList();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Comment u = new Comment();
				u.setComment_id(rs.getInt("comment_id"));
				u.setBook_id(rs.getInt("book_id"));
				u.setUser_id(rs.getInt("user_id"));
				u.setContent(rs.getString("content"));
				u.setComment_time(rs.getString("comment_time"));
				u.setComment_state(rs.getInt("comment_state"));
				u.setRating(rs.getInt("rating"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBPoolUtil.closeConnection(conn);
		}
		return list;
	}

	public boolean deleteCommentByCommentID(int commentID) throws Exception {
		/*
		 * 通过评论ID从书评中删除一条评论
		 * 
		 * @param commentID评论ID
		 * 
		 * @return 删除成功返回true,失败返回false
		 */
		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_comment where comment_id=" + commentID;
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBPoolUtil.closeConnection(conn);
			return true;
		}
	}

	public boolean modifyCommentState(int state) throws SQLException {
		/*
		 * 修改评论
		 * 
		 * @param state 1代表能够显示
		 * 
		 * @return 修改成功返回true,修改失败返回false
		 */
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_user set state=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, state);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBPoolUtil.closeConnection(conn);
			return true;
		}
	}

	public List listAllComment() throws Exception {
		List comments = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_comment";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);

		while (rs.next()) {
			Comment u = new Comment();
			u.setComment_id(rs.getInt("comment_id"));
			u.setBook_id(rs.getInt("book_id"));
			u.setUser_id(rs.getInt("user_id"));
			u.setContent(rs.getString("content"));
			u.setComment_time(rs.getString("comment_time"));
			u.setComment_state(rs.getInt("comment_state"));
			comments.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return comments;
	}

	public List listCommentByUserID(int user_id) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_comment where user_id=" + user_id;
		Statement stmt;
		List list = new ArrayList();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Comment u = new Comment();
				u.setComment_id(rs.getInt("comment_id"));
				u.setBook_id(rs.getInt("book_id"));
				u.setUser_id(rs.getInt("user_id"));
				u.setContent(rs.getString("content"));
				u.setComment_time(rs.getString("comment_time"));
				u.setComment_state(rs.getInt("comment_state"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBPoolUtil.closeConnection(conn);
		}
		return list;
	}


	public int getCommentTotalNum() throws Exception {
		int comment_num = 0;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_comment ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			comment_num= result.getRow();
		} else {
			comment_num= 0;
		}
		DBPoolUtil.closeConnection(conn);
		return comment_num;
	}
	public List listAllCommentOrderByUserId(int begin, int offset) throws Exception{
		List comments= new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_comment order by comment_id desc limit "
				+ begin + "," + offset;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);

		while (rs.next()) {
			Comment u = new Comment();
			u.setComment_id(rs.getInt("comment_id"));
			u.setBook_id(rs.getInt("book_id"));
			u.setUser_id(rs.getInt("user_id"));
			u.setContent(rs.getString("content"));
			u.setComment_time(rs.getString("comment_time"));
			u.setComment_state(rs.getInt("comment_state"));
			comments.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return comments;
	}
	public List listAllCommentOrderByCommentIdAndUserId(int user_id,int begin, int offset) throws Exception{
		List comments = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_comment where user_id="+user_id+" order by comment_id desc limit "
				+ begin + "," + offset;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);

		while (rs.next()) {
			Comment u = new Comment();
			u.setComment_id(rs.getInt("comment_id"));
			u.setBook_id(rs.getInt("book_id"));
			u.setUser_id(rs.getInt("user_id"));
			u.setContent(rs.getString("content"));
			u.setComment_time(rs.getString("comment_time"));
			u.setComment_state(rs.getInt("comment_state"));
			comments.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return comments;
	}
	public int getCommentTotalNumByUserId(int user_id) throws Exception{
		int comment_num = 0;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_comment where user_id="+user_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			comment_num = result.getRow();
		} else {
			comment_num = 0;
		}
		DBPoolUtil.closeConnection(conn);
		return comment_num ;
	}

	public List getRatingCountByBookID(int book_id) throws SQLException {
		List RatingCount=new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select count(*), rating from tb_comment where book_id="+book_id+" group by rating order by rating desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);

		while (rs.next()) {
			RatingCount r=new RatingCount();
			r.setRatingCount(rs.getInt(1));
			r.setRating(rs.getInt(2));
			RatingCount.add(r);
		}
		DBPoolUtil.closeConnection(conn);
		return RatingCount;
	}
}
