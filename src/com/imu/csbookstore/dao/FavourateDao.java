package com.imu.csbookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.imu.csbookstore.javabean.Favorate;
import com.imu.csbookstore.javabean.User;
import com.imu.csbookstore.util.DBPoolUtil;

public class FavourateDao {
	public List listFavorateByUserID(int user_id) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_favorate where user_id=" + user_id;
		Statement stmt;
		List list = new ArrayList();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Favorate u = new Favorate();
				u.setBook_id(rs.getInt("book_id"));
				u.setUser_id(rs.getInt("user_id"));
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

	public boolean deleteFavoraterByFavorateID(int book_id, int user_id)
			throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_favorate where book_id=? and user_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, book_id);
		pstmt.setInt(2, user_id);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public boolean isExist(int user_id, int book_id) throws Exception {
		boolean flag = false;
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_favorate where user_id='" + user_id
				+ "' and book_id='" + book_id + "'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next())
			flag = true;
		DBPoolUtil.closeConnection(conn);
		return flag;
	}

	public boolean addFavorate(Favorate u) throws Exception {

		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_favorate(book_id,user_id) values (?,?) ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, u.getBook_id());
		pstmt.setInt(2, u.getUser_id());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
	
	public int getFavorateTotalNumByUserId(int user_id) throws Exception {
		int favorate_num = 0;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_favorate where user_id="+user_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			favorate_num = result.getRow();
		} else {
			favorate_num = 0;
		}
		DBPoolUtil.closeConnection(conn);
		return favorate_num;
	}
	public List listAllFavorateOrderByUserId(int user_id,int begin, int offset) throws Exception{
		List favorates = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_favorate where user_id="+user_id+" order by book_id desc limit "
				+ begin + "," + offset;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Favorate u = new Favorate();
			u.setBook_id(rs.getInt("book_id"));
			u.setUser_id(rs.getInt("user_id"));
			favorates.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return favorates;
	}
}
