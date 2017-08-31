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

import com.imu.csbookstore.javabean.Indent;
import com.imu.csbookstore.javabean.User;
import com.imu.csbookstore.util.DBPoolUtil;

public class IndentDao {
	public void addIndent(Indent indent) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_indent (user_id,indent_date,delivery_id,indent_price) values(?,?,?,?) ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, indent.getUser_id());
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String nowTime = df.format(now);
		pstmt.setString(2, nowTime);
		pstmt.setInt(3, indent.getDelivery_id());
		pstmt.setDouble(4, indent.getIndent_price());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
	}

	public boolean deleteIndentByIndentID(int indentID) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_indent where  indent_id=" + indentID;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public boolean modifyIndent(Indent indent) throws Exception {
		/*
		 * Connection conn = DBPoolUtil.getConnection(); String sql =
		 * "update tb_indent set indent_state=?"; PreparedStatement pstmt
		 * =conn.prepareStatement(sql); pstmt.setInt(1,
		 * indent.getIndent_state()); pstmt.executeUpdate();
		 * DBPoolUtil.closeConnection(conn);
		 */
		return true;
	}

	public List listIndentByUserID(int user_id) throws Exception {
		List indents = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent where user_id=" + user_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Indent u = new Indent();
			u.setIndent_id(result.getInt("indent_id"));
			u.setUser_id(result.getInt("user_id"));
			u.setIndent_date(result.getString("indent_date"));
			u.setIndent_state(result.getInt("indent_state"));
			u.setDelivery_id(result.getInt("delivery_id"));
			u.setIndent_price(result.getDouble("indent_price"));
			indents.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return indents;

	}

	public List listAllindent() throws Exception {
		List indents = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent order by indent_id desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Indent u = new Indent();
			u.setIndent_id(result.getInt("indent_id"));
			u.setUser_id(result.getInt("user_id"));
			u.setIndent_date(result.getString("indent_date"));
			u.setIndent_state(result.getInt("indent_state"));
			u.setDelivery_id(result.getInt("delivery_id"));
			u.setIndent_price(result.getDouble("indent_price"));
			indents.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return indents;
	}

	public int getLatestIndentIdByUserId(int user_id) throws SQLException {
		int value = -1;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent where user_id=" + user_id
				+ " order by indent_id desc limit 1 ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			value = result.getInt("indent_id");
		}
		DBPoolUtil.closeConnection(conn);
		return value;
	}

	public void modifyIndentState(int indent_id, int i) throws SQLException {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_indent set indent_state=? where indent_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, i);
		pstmt.setInt(2, indent_id);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
	}
	public List listAllIndentOrderByIndentId(int begin, int offset) throws Exception{
		List indents = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent order by indent_id desc limit "
				+ begin + "," + offset;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Indent u = new Indent();
			u.setIndent_id(result.getInt("indent_id"));
			u.setUser_id(result.getInt("user_id"));
			u.setIndent_date(result.getString("indent_date"));
			u.setIndent_state(result.getInt("indent_state"));
			u.setDelivery_id(result.getInt("delivery_id"));
			u.setIndent_price(result.getDouble("indent_price"));
			indents.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return indents;
	}
	
	public List listAllIndentOrderByIndentIdAndUserId(int user_id,int begin, int offset) throws Exception{
		List indents = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent where user_id="+user_id+" order by indent_id desc limit "
				+ begin + "," + offset;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Indent u = new Indent();
			u.setIndent_id(result.getInt("indent_id"));
			u.setUser_id(result.getInt("user_id"));
			u.setIndent_date(result.getString("indent_date"));
			u.setIndent_state(result.getInt("indent_state"));
			u.setDelivery_id(result.getInt("delivery_id"));
			u.setIndent_price(result.getDouble("indent_price"));
			indents.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return indents;
	}
	
	public int getIndentTotalNum() throws Exception{
		int indent_num = 0;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			indent_num = result.getRow();
		} else {
			indent_num = 0;
		}
		DBPoolUtil.closeConnection(conn);
		return indent_num;
	}

	public int getIndentTotalNumByUserId(int user_id) throws Exception{
		int indent_num = 0;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent where user_id="+user_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			indent_num = result.getRow();
		} else {
			indent_num = 0;
		}
		DBPoolUtil.closeConnection(conn);
		return indent_num;
	}
	
	public Indent getIndentByIndentId(int indent_id) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indent where indent_id="+indent_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		Indent indent = new Indent();
		if (result.next()) {
			
			
			indent.setIndent_id(result.getInt("indent_id"));
			indent.setUser_id(result.getInt("user_id"));
			indent.setIndent_date(result.getString("indent_date"));
			indent.setIndent_state(result.getInt("indent_state"));
			indent.setDelivery_id(result.getInt("delivery_id"));
			indent.setIndent_price(result.getDouble("indent_price"));
		}
		DBPoolUtil.closeConnection(conn);
		return indent;
	}
}
