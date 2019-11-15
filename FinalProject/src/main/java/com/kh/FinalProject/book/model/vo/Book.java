package com.kh.FinalProject.book.model.vo;

import java.sql.Date;

public class Book {
	
	private int bNo;
	private String bName;
	private String bWriter;
	private String bTrans;
	private String bPublisher;
	private int bPage;
	private int price;
	private String bMainCTG;
	private Date bIssueDate;
	private String bLanguage;
	private String bISBN;
	private String bLocation;
	private String status;
	private String bIMG;
	
	private BookReservation bookReservation;

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(int bNo, String bName, String bWriter, String bTrans, String bPublisher, int bPage, int price,
			String bMainCTG, Date bIssueDate, String bLanguage, String bISBN, String bLocation, String status,
			String bIMG, BookReservation bookReservation) {
		super();
		this.bNo = bNo;
		this.bName = bName;
		this.bWriter = bWriter;
		this.bTrans = bTrans;
		this.bPublisher = bPublisher;
		this.bPage = bPage;
		this.price = price;
		this.bMainCTG = bMainCTG;
		this.bIssueDate = bIssueDate;
		this.bLanguage = bLanguage;
		this.bISBN = bISBN;
		this.bLocation = bLocation;
		this.status = status;
		this.bIMG = bIMG;
		this.bookReservation = bookReservation;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbTrans() {
		return bTrans;
	}

	public void setbTrans(String bTrans) {
		this.bTrans = bTrans;
	}

	public String getbPublisher() {
		return bPublisher;
	}

	public void setbPublisher(String bPublisher) {
		this.bPublisher = bPublisher;
	}

	public int getbPage() {
		return bPage;
	}

	public void setbPage(int bPage) {
		this.bPage = bPage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getbMainCTG() {
		return bMainCTG;
	}

	public void setbMainCTG(String bMainCTG) {
		this.bMainCTG = bMainCTG;
	}

	public Date getbIssueDate() {
		return bIssueDate;
	}

	public void setbIssueDate(Date bIssueDate) {
		this.bIssueDate = bIssueDate;
	}

	public String getbLanguage() {
		return bLanguage;
	}

	public void setbLanguage(String bLanguage) {
		this.bLanguage = bLanguage;
	}

	public String getbISBN() {
		return bISBN;
	}

	public void setbISBN(String bISBN) {
		this.bISBN = bISBN;
	}

	public String getbLocation() {
		return bLocation;
	}

	public void setbLocation(String bLocation) {
		this.bLocation = bLocation;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getbIMG() {
		return bIMG;
	}

	public void setbIMG(String bIMG) {
		this.bIMG = bIMG;
	}

	public BookReservation getBookReservation() {
		return bookReservation;
	}

	public void setBookReservation(BookReservation bookReservation) {
		this.bookReservation = bookReservation;
	}

	@Override
	public String toString() {
		return "Book [bNo=" + bNo + ", bName=" + bName + ", bWriter=" + bWriter + ", bTrans=" + bTrans + ", bPublisher="
				+ bPublisher + ", bPage=" + bPage + ", price=" + price + ", bMainCTG=" + bMainCTG + ", bIssueDate="
				+ bIssueDate + ", bLanguage=" + bLanguage + ", bISBN=" + bISBN + ", bLocation=" + bLocation
				+ ", status=" + status + ", bIMG=" + bIMG + ", bookReservation=" + bookReservation + "]";
	}

	
}
