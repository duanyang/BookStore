package com.imu.csbookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.imu.csbookstore.javabean.BookClass;
import com.imu.csbookstore.util.DBPoolUtil;

public class BookClassDao {
	public boolean addBookClass(BookClass bookclass) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_bookclass (class_name) values(?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookclass.getClass_name());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public boolean deleteBookClassByBookClassId(int class_id) throws Exception {

		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_bookclass where class_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, class_id);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public boolean modifyBookClass(BookClass bookclass) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_bookclass set class_name=? where class_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookclass.getClass_name());
		pstmt.setInt(2, bookclass.getClass_id());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public List ListAllBookClasses() throws Exception {
		List bookclass = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_bookclass";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			BookClass u = new BookClass();
			u.setClass_id(result.getInt("class_id"));
			u.setClass_name(result.getString("class_name"));
			bookclass.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return bookclass;
	}

	public String getClassNameByClassId(int class_id) throws Exception {
		String class_name = "";
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_bookclass where class_id=" + class_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		if (result.next()) {
			class_name = result.getString("class_name");
		}
		DBPoolUtil.closeConnection(conn);
		return class_name;
	}
}
