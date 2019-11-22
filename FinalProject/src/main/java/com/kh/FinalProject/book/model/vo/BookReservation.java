package com.kh.FinalProject.book.model.vo;


public class BookReservation {
	private int BV_NO;
	private int B_NO;
	private String USER_ID;
	private String BV_DATE;
	private String BV_RETURN_DATE;
	private String BV_STATUS;
	
	private Book book;

	public BookReservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookReservation(int bV_NO, int b_NO, String uSER_ID, String bV_DATE, String bV_RETURN_DATE, String bV_STATUS,
			Book book) {
		super();
		BV_NO = bV_NO;
		B_NO = b_NO;
		USER_ID = uSER_ID;
		BV_DATE = bV_DATE;
		BV_RETURN_DATE = bV_RETURN_DATE;
		BV_STATUS = bV_STATUS;
		this.book = book;
	}

	public int getBV_NO() {
		return BV_NO;
	}

	public void setBV_NO(int bV_NO) {
		BV_NO = bV_NO;
	}

	public int getB_NO() {
		return B_NO;
	}

	public void setB_NO(int b_NO) {
		B_NO = b_NO;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getBV_DATE() {
		return BV_DATE;
	}

	public void setBV_DATE(String bV_DATE) {
		BV_DATE = bV_DATE;
	}

	public String getBV_RETURN_DATE() {
		return BV_RETURN_DATE;
	}

	public void setBV_RETURN_DATE(String bV_RETURN_DATE) {
		BV_RETURN_DATE = bV_RETURN_DATE;
	}

	public String getBV_STATUS() {
		return BV_STATUS;
	}

	public void setBV_STATUS(String bV_STATUS) {
		BV_STATUS = bV_STATUS;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "BookReservation [BV_NO=" + BV_NO + ", B_NO=" + B_NO + ", USER_ID=" + USER_ID + ", BV_DATE=" + BV_DATE
				+ ", BV_RETURN_DATE=" + BV_RETURN_DATE + ", BV_STATUS=" + BV_STATUS + ", book=" + book + "]";
	}

	
}