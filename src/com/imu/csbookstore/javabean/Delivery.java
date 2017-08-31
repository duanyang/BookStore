package com.imu.csbookstore.javabean;

public class Delivery {
	private int delivery_id;
	private int user_id;
	private String delivery_name;
	private String delivery_address;
	private String delivery_phone;
	private String delivery_zipcode;

	public int getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(int delivery_id) {
		this.delivery_id = delivery_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getDelivery_name() {
		return delivery_name;
	}

	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}

	public String getDelivery_address() {
		return delivery_address;
	}

	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}

	public String getDelivery_phone() {
		return delivery_phone;
	}

	public void setDelivery_phone(String delivery_phone) {
		this.delivery_phone = delivery_phone;
	}

	public String getDelivery_zipcode() {
		return delivery_zipcode;
	}

	public void setDelivery_zipcode(String delivery_zipcode) {
		this.delivery_zipcode = delivery_zipcode;
	}

}
