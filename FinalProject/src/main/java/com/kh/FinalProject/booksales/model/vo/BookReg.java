package com.kh.FinalProject.booksales.model.vo;

import java.sql.Date;

public class BookReg {

	private String brBnumber;
	private String brStudentId;
	private String brName;
	private String brCategory;
	private String brWriter;
	private String brPublisher;
	private Date brIssueDate;
	private int brPage;
	private String brISBN;
	private String brCondition;
	private String brComment;
	private int brPrice;
	private Date brRegDate;
	private String brStatus;
	private String brOrderStatus;
		
	public BookReg() {}

	public BookReg(String brBnumber, String brStudentId, String brName, String brCategory, String brWriter,
			String brPublisher, Date brIssueDate, int brPage, String brISBN, String brCondition, String brComment,
			int brPrice, Date brRegDate, String brStatus, String brOrderStatus) {
		super();
		this.brBnumber = brBnumber;
		this.brStudentId = brStudentId;
		this.brName = brName;
		this.brCategory = brCategory;
		this.brWriter = brWriter;
		this.brPublisher = brPublisher;
		this.brIssueDate = brIssueDate;
		this.brPage = brPage;
		this.brISBN = brISBN;
		this.brCondition = brCondition;
		this.brComment = brComment;
		this.brPrice = brPrice;
		this.brRegDate = brRegDate;
		this.brStatus = brStatus;
		this.brOrderStatus = brOrderStatus;
	}

	public String getBrBnumber() {
		return brBnumber;
	}

	public void setBrBnumber(String brBnumber) {
		this.brBnumber = brBnumber;
	}

	public String getBrStudentId() {
		return brStudentId;
	}

	public void setBrStudentId(String brStudentId) {
		this.brStudentId = brStudentId;
	}

	public String getBrName() {
		return brName;
	}

	public void setBrName(String brName) {
		this.brName = brName;
	}

	public String getBrCategory() {
		return brCategory;
	}

	public void setBrCategory(String brCategory) {
		this.brCategory = brCategory;
	}

	public String getBrWriter() {
		return brWriter;
	}

	public void setBrWriter(String brWriter) {
		this.brWriter = brWriter;
	}

	public String getBrPublisher() {
		return brPublisher;
	}

	public void setBrPublisher(String brPublisher) {
		this.brPublisher = brPublisher;
	}

	public Date getBrIssueDate() {
		return brIssueDate;
	}

	public void setBrIssueDate(Date brIssueDate) {
		this.brIssueDate = brIssueDate;
	}

	public int getBrPage() {
		return brPage;
	}

	public void setBrPage(int brPage) {
		this.brPage = brPage;
	}

	public String getBrISBN() {
		return brISBN;
	}

	public void setBrISBN(String brISBN) {
		this.brISBN = brISBN;
	}

	public String getBrCondition() {
		return brCondition;
	}

	public void setBrCondition(String brCondition) {
		this.brCondition = brCondition;
	}

	public String getBrComment() {
		return brComment;
	}

	public void setBrComment(String brComment) {
		this.brComment = brComment;
	}

	public int getBrPrice() {
		return brPrice;
	}

	public void setBrPrice(int brPrice) {
		this.brPrice = brPrice;
	}

	public Date getBrRegDate() {
		return brRegDate;
	}

	public void setBrRegDate(Date brRegDate) {
		this.brRegDate = brRegDate;
	}

	public String getBrStatus() {
		return brStatus;
	}

	public void setBrStatus(String brStatus) {
		this.brStatus = brStatus;
	}

	public String getBrOrderStatus() {
		return brOrderStatus;
	}

	public void setBrOrderStatus(String brOrderStatus) {
		this.brOrderStatus = brOrderStatus;
	}

	@Override
	public String toString() {
		return "BookReg [brBnumber=" + brBnumber + ", brStudentId=" + brStudentId + ", brName=" + brName
				+ ", brCategory=" + brCategory + ", brWriter=" + brWriter + ", brPublisher=" + brPublisher
				+ ", brIssueDate=" + brIssueDate + ", brPage=" + brPage + ", brISBN=" + brISBN + ", brCondition="
				+ brCondition + ", brComment=" + brComment + ", brPrice=" + brPrice + ", brRegDate=" + brRegDate
				+ ", brStatus=" + brStatus + ", brOrderStatus=" + brOrderStatus + "]";
	}

	
	
}
