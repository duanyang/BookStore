package com.imu.csbookstore.service;

import java.util.List;

import com.imu.csbookstore.dao.IndentDao;
import com.imu.csbookstore.javabean.Indent;

public class IndentService {
	IndentDao dao = new IndentDao();

	public void addIndent(Indent indent) throws Exception {
		dao.addIndent(indent);
	}

	public boolean deleteIndentByIndentID(int indentID) throws Exception {
		return dao.deleteIndentByIndentID(indentID);
	}

	public boolean modifyIndent(Indent indent) throws Exception {
		return dao.modifyIndent(indent);
	}

	public List listIndentByUserID(int user_id) throws Exception {
		return dao.listIndentByUserID(user_id);
	}

	public List listAllindent() throws Exception {
		return dao.listAllindent();
	}

	public int getLatestIndentIdByUserId(int user_id) throws Exception {
		return dao.getLatestIndentIdByUserId(user_id);
	}

	public void modifyIndentState(int indent_id, int i) throws Exception {
		dao.modifyIndentState(indent_id, i);

	}
	public List listAllIndentOrderByIndentId(int begin, int offset) throws Exception{
		return dao.listAllIndentOrderByIndentId(begin, offset);
	}
	public List listAllIndentOrderByIndentIdAndUserId(int user_id,int begin, int offset) throws Exception{
		return dao.listAllIndentOrderByIndentIdAndUserId(user_id,begin, offset);
	}
	public int getIndentTotalNum() throws Exception {
		return dao.getIndentTotalNum();
	}
	
	public int getIndentTotalNumByUserId(int user_id) throws Exception {
		return dao.getIndentTotalNumByUserId(user_id);
	}
	
	public Indent getIndentByIndentId(int indent_id) throws Exception {
		return dao.getIndentByIndentId(indent_id);
	}
}
