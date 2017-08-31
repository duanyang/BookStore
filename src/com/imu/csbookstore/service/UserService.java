package com.imu.csbookstore.service;

import java.sql.SQLException;
import java.util.List;

import com.imu.csbookstore.dao.UserDao;
import com.imu.csbookstore.javabean.User;

public class UserService {
	UserDao dao = new UserDao();

	public boolean addUser(User u) throws Exception {
		/*
		 * 用户注册，在数据库中添加一个用户
		 * 
		 * @param User实体类，代表要添加的用户信息
		 * 
		 * @return 如果用户名与数据库中的用户有重复，则注册失败，返回false,添加成功返回true
		 */
		return dao.addUser(u);

	}

	public boolean isExist(User u) throws Exception {
		/*
		 * 检查用户是否存在
		 * 
		 * @param User实体类，含有用户登录信息
		 * 
		 * @return 如果用户存在返回true，不存在返回false
		 */
		return dao.isExist(u);
	}

	public boolean deleteUserByUid(int userName) throws Exception {
		/*
		 * 通过UID删除一个用户
		 * 
		 * @param userName用户在数据库中账号名称
		 * 
		 * @return 删除成功返回true,失败返回false
		 */
		return dao.deleteUserByUid(userName);
	}

	public boolean modifyUser(User u) throws Exception {
		/*
		 * 修改用户信息
		 * 
		 * @param User含有用户信息
		 * 
		 * @return 修改成功返回true,修改失败返回false
		 */
		return dao.modifyUser(u);
	}

	public List listAllUsers() throws Exception {
		return dao.listAllUsers();
	}

	public User getUserByUserId(int user_id) throws Exception {
		return dao.getUserByUserId(user_id);
	}

	public int getUserIdByUserName(String user_name) throws SQLException {
		return dao.getUserIdByUserName(user_name);
	}

	public String getUserNameByUserId(int user_id) throws Exception {
		return dao.getUserNameByUserId(user_id);
	}
	public int getUserTotalNum() throws Exception {
		return dao.getUserTotalNum();
	}
	public List listAllUserOrderByUserId(int begin, int offset) throws Exception{
		return dao.listAllUserOrderByUserId(begin, offset);
	}
}
