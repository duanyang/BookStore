package com.imu.csbookstore.service;

import java.util.List;

import com.imu.csbookstore.dao.BookClassDao;
import com.imu.csbookstore.javabean.BookClass;

public class BookClassService {
	BookClassDao dao = new BookClassDao();

	public boolean addBookClass(BookClass bookclass) throws Exception {
		return dao.addBookClass(bookclass);
	}

	public boolean deleteBookClassByBookClassId(int class_id) throws Exception {
		return dao.deleteBookClassByBookClassId(class_id);

	}

	public boolean modifyBookClass(BookClass bookclass) throws Exception {
		return dao.modifyBookClass(bookclass);
	}

	public List ListAllBookClasses() throws Exception {
		return dao.ListAllBookClasses();
	}

	public String getClassNameByClassId(int class_id) throws Exception {
		return dao.getClassNameByClassId(class_id);
	}
}
