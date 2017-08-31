package com.imu.csbookstore.service;

import java.sql.SQLException;
import java.util.List;

import com.imu.csbookstore.dao.AdministratorDao;
import com.imu.csbookstore.javabean.*;

public class AdministratorService {
	private AdministratorDao dao = new AdministratorDao();


	/*
	 * 用户注册，在数据库中添加一个用户
	 * 
	 * @param User实体类，代表要添加的用户信息
	 * 
	 * @return 如果用户名与数据库中的用户有重复，则注册失败，返回false,添加成功返回true
	 */

	public boolean addAdministrator(Administrator u) throws Exception {
		return dao.addAdministrator(u);
	}

	public List listAllAdministrator() throws Exception {
		return dao.listAllAdministrator();
	}

	/*
	 * 检查用户是否存在
	 * 
	 * @param User实体类，含有用户登录信息
	 * 
	 * @return 如果用户存在返回true，不存在返回false
	 */
	public List listAllAdministratorOrderByAdministratorId(int begin, int offset)
			throws Exception {
		return dao.listAllAdministratorOrderByAdministratorId(begin, offset);
	}

	public boolean isExist(Administrator u) throws Exception {
		return dao.isExist(u);
	}

	/*
	 * 通过UID删除一个用户
	 * 
	 * @param userName用户在数据库中账号名称
	 * 
	 * @return 删除成功返回true,失败返回false
	 */
	public boolean deleteAdministratorByAdministratorId(int administrator_id)
			throws Exception {
		return dao.deleteAdministratorByAdministratorId(administrator_id);
	}

	/*
	 * 修改用户信息
	 * 
	 * @param User含有用户信息
	 * 
	 * @return 修改成功返回true,修改失败返回false
	 */
	public boolean modifyAdministrator(Administrator u) throws Exception {
		return dao.modifyAdministrator(u);
	}

	public Administrator getAdministratorById(int administrator_id)
			throws Exception {
		return dao.getAdministratorById(administrator_id);
	}

	public int getAdministratorTotalNum() throws Exception {
		return dao.getAdministratorTotalNum();
	}
}
