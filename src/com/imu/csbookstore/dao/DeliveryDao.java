package com.imu.csbookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.imu.csbookstore.javabean.Delivery;
import com.imu.csbookstore.util.DBPoolUtil;

public class DeliveryDao {
	public boolean deleteDeliveryByDeliveryID(int delivery_id) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_delivery where delivery_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, delivery_id);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public boolean modifyDelivery(Delivery delivery) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_delivery set delivery_name=?,delivery_address=?,delivery_phone=?,delivery_zipcode=?  where delivery_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, delivery.getDelivery_name());
		pstmt.setString(2, delivery.getDelivery_address());
		pstmt.setString(3, delivery.getDelivery_phone());
		pstmt.setString(4, delivery.getDelivery_zipcode());
		pstmt.setInt(5, delivery.getDelivery_id());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public boolean addDelivery(Delivery delivery) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_delivery(delivery_name,delivery_address,delivery_phone,delivery_zipcode,user_id) values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, delivery.getDelivery_name());
		pstmt.setString(2, delivery.getDelivery_address());
		pstmt.setString(3, delivery.getDelivery_phone());
		pstmt.setString(4, delivery.getDelivery_zipcode());
		pstmt.setInt(5, delivery.getUser_id());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}

	public List searchDeliveryByUser(int user_id) throws Exception {
		List deliveryes = new ArrayList();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_delivery where user_id=" + user_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Delivery u = new Delivery();
			u.setDelivery_id(result.getInt("delivery_id"));
			u.setUser_id(result.getInt("user_id"));
			u.setDelivery_name(result.getString("delivery_name"));
			u.setDelivery_address(result.getString("delivery_address"));
			u.setDelivery_phone(result.getString("delivery_phone"));
			u.setDelivery_zipcode(result.getString("delivery_zipcode"));
			deliveryes.add(u);
		}
		DBPoolUtil.closeConnection(conn);
		return deliveryes;
	}

	public Delivery getDeliveryByDeliveryID(int delivery_id) throws Exception {
		Delivery delivery = new Delivery();
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_delivery where delivery_id="
				+ delivery_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			delivery.setDelivery_id(delivery_id);
			delivery.setUser_id(result.getInt("user_id"));
			delivery.setDelivery_name(result.getString("delivery_name"));
			delivery.setDelivery_address(result.getString("delivery_address"));
			delivery.setDelivery_phone(result.getString("delivery_phone"));
			delivery.setDelivery_zipcode(result.getString("delivery_zipcode"));
		}
		DBPoolUtil.closeConnection(conn);
		return delivery;
	}

	public String getDeliveryInfoByDeliveryId(int delivery_id) throws Exception {
		String str = "";
		Connection conn = DBPoolUtil.getConnection();
		Statement stmt;
		String sql = "select * from tb_delivery where delivery_id="
				+ delivery_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			str = result.getString("delivery_name") + ","
					+ result.getString("delivery_address") + ","
					+ result.getString("delivery_phone") + ","
					+ result.getString("delivery_zipcode");
		}
		DBPoolUtil.closeConnection(conn);
		return str;
	}

}
