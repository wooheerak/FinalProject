package com.kh.FinalProject.book.model.vo;

import java.sql.Date;

public class BookRequest {
	
	private int BQ_NO;
	private String BQ_STUDENT_ID;
	private String BQ_NAME;
	private String BQ_WRITER;
	private String BQ_TRANS;
	private String BQ_PUBLISHER;
	private String BQ_ISBN;
	private int BQ_PRICE;
	private String BQ_MESSAGE;
	private Date BQ_DATE;
	private String BQ_STATUS;
	public BookRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookRequest(int bQ_NO, String bQ_STUDENT_ID, String bQ_NAME, String bQ_WRITER, String bQ_TRANS,
			String bQ_PUBLISHER, String bQ_ISBN, int bQ_PRICE, String bQ_MESSAGE, Date bQ_DATE, String bQ_STATUS) {
		super();
		BQ_NO = bQ_NO;
		BQ_STUDENT_ID = bQ_STUDENT_ID;
		BQ_NAME = bQ_NAME;
		BQ_WRITER = bQ_WRITER;
		BQ_TRANS = bQ_TRANS;
		BQ_PUBLISHER = bQ_PUBLISHER;
		BQ_ISBN = bQ_ISBN;
		BQ_PRICE = bQ_PRICE;
		BQ_MESSAGE = bQ_MESSAGE;
		BQ_DATE = bQ_DATE;
		BQ_STATUS = bQ_STATUS;
	}
	public int getBQ_NO() {
		return BQ_NO;
	}
	public void setBQ_NO(int bQ_NO) {
		BQ_NO = bQ_NO;
	}
	public String getBQ_STUDENT_ID() {
		return BQ_STUDENT_ID;
	}
	public void setBQ_STUDENT_ID(String bQ_STUDENT_ID) {
		BQ_STUDENT_ID = bQ_STUDENT_ID;
	}
	public String getBQ_NAME() {
		return BQ_NAME;
	}
	public void setBQ_NAME(String bQ_NAME) {
		BQ_NAME = bQ_NAME;
	}
	public String getBQ_WRITER() {
		return BQ_WRITER;
	}
	public void setBQ_WRITER(String bQ_WRITER) {
		BQ_WRITER = bQ_WRITER;
	}
	public String getBQ_TRANS() {
		return BQ_TRANS;
	}
	public void setBQ_TRANS(String bQ_TRANS) {
		BQ_TRANS = bQ_TRANS;
	}
	public String getBQ_PUBLISHER() {
		return BQ_PUBLISHER;
	}
	public void setBQ_PUBLISHER(String bQ_PUBLISHER) {
		BQ_PUBLISHER = bQ_PUBLISHER;
	}
	public String getBQ_ISBN() {
		return BQ_ISBN;
	}
	public void setBQ_ISBN(String bQ_ISBN) {
		BQ_ISBN = bQ_ISBN;
	}
	public int getBQ_PRICE() {
		return BQ_PRICE;
	}
	public void setBQ_PRICE(int bQ_PRICE) {
		BQ_PRICE = bQ_PRICE;
	}
	public String getBQ_MESSAGE() {
		return BQ_MESSAGE;
	}
	public void setBQ_MESSAGE(String bQ_MESSAGE) {
		BQ_MESSAGE = bQ_MESSAGE;
	}
	public Date getBQ_DATE() {
		return BQ_DATE;
	}
	public void setBQ_DATE(Date bQ_DATE) {
		BQ_DATE = bQ_DATE;
	}
	public String getBQ_STATUS() {
		return BQ_STATUS;
	}
	public void setBQ_STATUS(String bQ_STATUS) {
		BQ_STATUS = bQ_STATUS;
	}
	@Override
	public String toString() {
		return "BookRequest [BQ_NO=" + BQ_NO + ", BQ_STUDENT_ID=" + BQ_STUDENT_ID + ", BQ_NAME=" + BQ_NAME
				+ ", BQ_WRITER=" + BQ_WRITER + ", BQ_TRANS=" + BQ_TRANS + ", BQ_PUBLISHER=" + BQ_PUBLISHER
				+ ", BQ_ISBN=" + BQ_ISBN + ", BQ_PRICE=" + BQ_PRICE + ", BQ_MESSAGE=" + BQ_MESSAGE + ", BQ_DATE="
				+ BQ_DATE + ", BQ_STATUS=" + BQ_STATUS + "]";
	}
	
	
}
