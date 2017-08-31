package com.imu.csbookstore.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.imu.csbookstore.dao.FavourateDao;
import com.imu.csbookstore.javabean.Favorate;

public class FavorateService {
	FavourateDao dao = new FavourateDao();

	public List listFavorateByUserID(int user_id) throws Exception {
		return dao.listFavorateByUserID(user_id);
	}

	public boolean deleteFavoraterByFavorateID(int book_id, int user_id)
			throws Exception {
		return dao.deleteFavoraterByFavorateID(book_id, user_id);
	}

	public boolean isExist(int user_id, int book_id) throws Exception {
		return dao.isExist(user_id, book_id);
	}

	public boolean addFavorate(Favorate u) throws Exception {
		return dao.addFavorate(u);
	}
	
	public int getFavorateTotalNumByUserId(int user_id) throws Exception {
		return dao.getFavorateTotalNumByUserId(user_id);
	}
	
	public List listAllFavorateOrderByUserId(int user_id,int begin, int offset) throws Exception{
		return dao.listAllFavorateOrderByUserId(user_id,begin, offset);
	}
}
