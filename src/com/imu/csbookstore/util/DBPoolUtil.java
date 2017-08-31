package com.imu.csbookstore.util;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBPoolUtil {
	static ComboPooledDataSource dataSource;
	static {
		dataSource = new ComboPooledDataSource();
		try {
			dataSource.setDriverClass("com.mysql.jdbc.Driver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/csbookstore");
		dataSource.setUser("root");
		dataSource.setPassword("nihaoduan");

		// 设置初始连接池的大小！
		dataSource.setInitialPoolSize(2);
		// 设置连接池的最小值！
		dataSource.setMinPoolSize(1);
		// 设置连接池的最大值！
		dataSource.setMaxPoolSize(10);
		// 设置连接池中的最大Statements数量！
		dataSource.setMaxStatements(50);
		// 设置连接池的最大空闲时间！
		dataSource.setMaxIdleTime(60);
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
