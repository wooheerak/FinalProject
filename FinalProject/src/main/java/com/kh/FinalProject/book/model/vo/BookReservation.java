package com.kh.FinalProject.book.model.vo;


public class BookReservation {
	private int bv_no;
	private int b_no;
	private String user_id;
	private String bv_date;
	private String bv_return_date;
	private String bv_status;
	
	private Book book;

	public BookReservation() {
		super();
	}

	public BookReservation(int bv_no, int b_no, String user_id, String bv_date, String bv_return_date, String bv_status,
			Book book) {
		super();
		this.bv_no = bv_no;
		this.b_no = b_no;
		this.user_id = user_id;
		this.bv_date = bv_date;
		this.bv_return_date = bv_return_date;
		this.bv_status = bv_status;
		this.book = book;
	}

	public int getBv_no() {
		return bv_no;
	}

	public void setBv_no(int bv_no) {
		this.bv_no = bv_no;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBv_date() {
		return bv_date;
	}

	public void setBv_date(String bv_date) {
		this.bv_date = bv_date;
	}

	public String getBv_return_date() {
		return bv_return_date;
	}

	public void setBv_return_date(String bv_return_date) {
		this.bv_return_date = bv_return_date;
	}

	public String getBv_status() {
		return bv_status;
	}

	public void setBv_status(String bv_status) {
		this.bv_status = bv_status;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "BookReservation [bv_no=" + bv_no + ", b_no=" + b_no + ", user_id=" + user_id + ", bv_date=" + bv_date
				+ ", bv_return_date=" + bv_return_date + ", bv_status=" + bv_status + ", book=" + book + "]";
	}

	
}