package com.imu.csbookstore.javabean;

public class ShoppingCart {

	private int book_id;
	private int book_number;
	private String book_name;
	private String book_locationName;
	private double book_price;
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getBook_price() {
		return book_price;
	}

	public void setBook_price(double book_price) {
		this.book_price = book_price;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_locationName() {
		return book_locationName;
	}

	public void setBook_locationName(String book_locationName) {
		this.book_locationName = book_locationName;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public int getBook_number() {
		return book_number;
	}

	public void setBook_number(int book_number) {
		this.book_number = book_number;
	}

}
