package com.imu.csbookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.imu.csbookstore.javabean.IndentDetails;
import com.imu.csbookstore.util.DBPoolUtil;

public class IndentDetailsDao {
	public void addIndent(IndentDetails indentdetails) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_indentdetails (indent_id,book_id,number,price) values(?,?,?,?) ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, indentdetails.getIndent_id());
		pstmt.setInt(2, indentdetails.getBook_id());
		pstmt.setInt(3, indentdetails.getNumber());
		pstmt.setDouble(4, indentdetails.getPrice());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
	}

	public boolean modifyIndentDetails(IndentDetails indentdetails)
			throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_indent set (number,price) values(?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, indentdetails.getNumber());
		pstmt.setDouble(2, indentdetails.getPrice());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public List listIndentDetailsByIndentDetailsID(int indent_id)
			throws Exception {
		List indentdetails = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_indentdetails where indent_id="
				+ indent_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			IndentDetails u = new IndentDetails();
			u.setIndent_id(result.getInt("indent_id"));
			u.setBook_id(result.getInt("book_id"));
			u.setNumber(result.getInt("number"));
			u.setPrice(result.getDouble("price"));
			indentdetails.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return indentdetails;

	}
}
