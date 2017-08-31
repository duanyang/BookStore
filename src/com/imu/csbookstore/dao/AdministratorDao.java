package com.imu.csbookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.imu.csbookstore.javabean.Administrator;
import com.imu.csbookstore.util.DBPoolUtil;

public class AdministratorDao {
	/*
	 * 用户注册，在数据库中添加一个用户
	 * 
	 * @param User实体类，代表要添加的用户信息
	 * 
	 * @return 如果用户名与数据库中的用户有重复，则注册失败，返回false,添加成功返回true
	 */

	public boolean addAdministrator(Administrator u) throws SQLException {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_administrator(administrator_name,administrator_pass,administrator_mail) values(?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, u.getAdministrator_name());
		pstmt.setString(2, u.getAdministrator_pass());
		pstmt.setString(3, u.getAdministrator_mail());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public List listAllAdministrator() throws SQLException {
		List admins = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_administrator";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Administrator admin = new Administrator();
			admin.setAdministrator_id(result.getInt("administrator_id"));
			admin.setAdministrator_name(result.getString("administrator_name"));
			admin.setAdministrator_pass(result.getString("administrator_pass"));
			admin.setAdministrator_mail(result.getString("administrator_mail"));
			admins.add(admin);
		}
		DBPoolUtil.closeConnection(conn);
		return admins;
	}

	/*
	 * 检查用户是否存在
	 * 
	 * @param User实体类，含有用户登录信息
	 * 
	 * @return 如果用户存在返回true，不存在返回false
	 */
	public boolean isExist(Administrator u) throws SQLException {
		boolean flag = false;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_administrator where administrator_name='"
				+ u.getAdministrator_name()
				+ "' and administrator_pass='"
				+ u.getAdministrator_pass() + "'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next())
			flag = true;
		DBPoolUtil.closeConnection(conn);
		return flag;
	}

	/*
	 * 通过UID删除一个用户
	 * 
	 * @param userName用户在数据库中账号名称
	 * 
	 * @return 删除成功返回true,失败返回false
	 */
	public boolean deleteAdministratorByAdministratorId(int administrator_id)
			throws SQLException {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_administrator where administrator_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, administrator_id);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	/*
	 * 修改用户信息
	 * 
	 * @param User含有用户信息
	 * 
	 * @return 修改成功返回true,修改失败返回false
	 */
	public boolean modifyAdministrator(Administrator u) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_administrator set administrator_name=?,administrator_pass=?,administrator_mail=? where administrator_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, u.getAdministrator_name());
		pstmt.setString(2, u.getAdministrator_pass());
		pstmt.setString(3, u.getAdministrator_mail());
		pstmt.setInt(4, u.getAdministrator_id());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public Administrator getAdministratorById(int administrator_id)
			throws Exception {
		Administrator admin = new Administrator();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_administrator where administrator_id="
				+ administrator_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			admin.setAdministrator_id(administrator_id);
			admin.setAdministrator_name(result.getString("Administrator_name"));
			admin.setAdministrator_pass(result.getString("Administrator_pass"));
			admin.setAdministrator_mail(result.getString("Administrator_mail"));
		}
		DBPoolUtil.closeConnection(conn);
		return admin;
	}

	public int getAdministratorTotalNum() throws Exception {
		int administrator_num = 0;
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_administrator ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			administrator_num = result.getRow();
		} else {
			administrator_num = 0;
		}
		DBPoolUtil.closeConnection(conn);
		return administrator_num;
	}

	public List listAllAdministratorOrderByAdministratorId(int begin, int offset)
			throws Exception {
		List admins = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_administrator order by administrator_id desc limit "
				+ begin + "," + offset;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Administrator admin = new Administrator();
			admin.setAdministrator_id(result.getInt("administrator_id"));
			admin.setAdministrator_name(result.getString("administrator_name"));
			admin.setAdministrator_pass(result.getString("administrator_pass"));
			admin.setAdministrator_mail(result.getString("administrator_mail"));
			admins.add(admin);
		}
		DBPoolUtil.closeConnection(conn);
		return admins;
	}
}
