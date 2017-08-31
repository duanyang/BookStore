package com.imu.csbookstore.javabean;

import java.sql.Blob;

public class Book {
	private int book_id;
	private String book_name;
	private String book_author;
	private String book_press;
	private String book_describtion;
	private double book_price;
	private String book_locationName;
	private int book_classId;
	private int book_number;
	private int book_saleNum;

	public int getBook_saleNum() {
		return book_saleNum;
	}

	public void setBook_saleNum(int book_saleNum) {
		this.book_saleNum = book_saleNum;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_press() {
		return book_press;
	}

	public void setBook_press(String book_press) {
		this.book_press = book_press;
	}

	public String getBook_describtion() {
		return book_describtion;
	}

	public void setBook_describtion(String book_describtion) {
		this.book_describtion = book_describtion;
	}

	public double getBook_price() {
		return book_price;
	}

	public void setBook_price(double book_price) {
		this.book_price = book_price;
	}

	public String getBook_locationName() {
		return book_locationName;
	}

	public void setBook_locationName(String book_locationName) {
		this.book_locationName = book_locationName;
	}

	public int getBook_classId() {
		return book_classId;
	}

	public void setBook_classId(int book_classId) {
		this.book_classId = book_classId;
	}

	public int getBook_number() {
		return book_number;
	}

	public void setBook_number(int book_number) {
		this.book_number = book_number;
	}

}
