package com.imu.csbookstore.service;

import java.util.List;

import com.imu.csbookstore.dao.DeliveryDao;
import com.imu.csbookstore.javabean.Delivery;

public class DeliveryService {
	DeliveryDao dao = new DeliveryDao();

	public boolean deleteDeliveryByDeliveryID(int delivery_id) throws Exception {
		return dao.deleteDeliveryByDeliveryID(delivery_id);
	}

	public boolean modifyDelivery(Delivery delivery) throws Exception {
		return dao.modifyDelivery(delivery);
	}

	public boolean addDelivery(Delivery delivery) throws Exception {
		return dao.addDelivery(delivery);
	}

	public List searchDeliveryByUser(int user_id) throws Exception {
		return dao.searchDeliveryByUser(user_id);
	}

	public Delivery getDeliveryByDeliveryID(int delivery_id) throws Exception {
		return dao.getDeliveryByDeliveryID(delivery_id);
	}

	public String getDeliveryInfoByDeliveryId(int delivery_id) throws Exception {
		return dao.getDeliveryInfoByDeliveryId(delivery_id);
	}

}
