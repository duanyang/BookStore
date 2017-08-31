package com.imu.csbookstore.javabean;

public class Indent {

	private int indent_id;
	private int user_id;
	private String indent_date;
	private int indent_state;
	private int delivery_id;
	private double indent_price;

	public double getIndent_price() {
		return indent_price;
	}

	public void setIndent_price(double indent_price) {
		this.indent_price = indent_price;
	}

	public int getIndent_id() {
		return indent_id;
	}

	public void setIndent_id(int indent_id) {
		this.indent_id = indent_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getIndent_date() {
		return indent_date;
	}

	public void setIndent_date(String indent_date) {
		this.indent_date = indent_date;
	}

	public int getIndent_state() {
		return indent_state;
	}

	public void setIndent_state(int indent_state) {
		this.indent_state = indent_state;
	}

	public int getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(int delivery_id) {
		this.delivery_id = delivery_id;
	}

}
