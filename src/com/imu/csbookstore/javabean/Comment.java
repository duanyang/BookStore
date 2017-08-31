package com.imu.csbookstore.javabean;

public class Comment {
	private int comment_id;
	private int book_id;
	private int user_id;
	private String content;
	private String comment_time;
	private int comment_state;
	private int rating;

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComment_time() {
		return comment_time;
	}

	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}

	public int getComment_state() {
		return comment_state;
	}

	public void setComment_state(int comment_state) {
		this.comment_state = comment_state;
	}

}
