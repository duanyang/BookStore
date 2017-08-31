package com.imu.csbookstore.service;

import java.util.List;

import com.imu.csbookstore.dao.IndentDetailsDao;
import com.imu.csbookstore.javabean.IndentDetails;

public class IndentDetailsService {
	IndentDetailsDao dao = new IndentDetailsDao();

	public void addIndent(IndentDetails indentdetails) throws Exception {
		dao.addIndent(indentdetails);

	}

	public boolean modifyIndentDetails(IndentDetails indentdetails)
			throws Exception {
		return dao.modifyIndentDetails(indentdetails);

	}

	public List listIndentDetailsByIndentDetailsID(int indent_id)
			throws Exception {
		return dao.listIndentDetailsByIndentDetailsID(indent_id);
	}
}
