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
	private int brCount;
	private String brISBN;
	private String brCondition;
	private String brComment;
	private int brPrice;
	private Date brRegDate;
	private String brStatus;
	private String brOrderStatus;
	private String brMemberName;
	private String originalFileName;
	private String renameFileName;
		
	public BookReg() {}

	public BookReg(String brBnumber, String brStudentId, String brName, String brCategory, String brWriter,
			String brPublisher, Date brIssueDate, int brCount, String brISBN, String brCondition, String brComment,
			int brPrice, Date brRegDate, String brStatus, String brOrderStatus, String brMemberName,
			String originalFileName, String renameFileName) {
		super();
		this.brBnumber = brBnumber;
		this.brStudentId = brStudentId;
		this.brName = brName;
		this.brCategory = brCategory;
		this.brWriter = brWriter;
		this.brPublisher = brPublisher;
		this.brIssueDate = brIssueDate;
		this.brCount = brCount;
		this.brISBN = brISBN;
		this.brCondition = brCondition;
		this.brComment = brComment;
		this.brPrice = brPrice;
		this.brRegDate = brRegDate;
		this.brStatus = brStatus;
		this.brOrderStatus = brOrderStatus;
		this.brMemberName = brMemberName;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
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

	public int getBrCount() {
		return brCount;
	}

	public void setBrCount(int brCount) {
		this.brCount = brCount;
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

	public String getBrMemberName() {
		return brMemberName;
	}

	public void setBrMemberName(String brMemberName) {
		this.brMemberName = brMemberName;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	@Override
	public String toString() {
		return "BookReg [brBnumber=" + brBnumber + ", brStudentId=" + brStudentId + ", brName=" + brName
				+ ", brCategory=" + brCategory + ", brWriter=" + brWriter + ", brPublisher=" + brPublisher
				+ ", brIssueDate=" + brIssueDate + ", brCount=" + brCount + ", brISBN=" + brISBN + ", brCondition="
				+ brCondition + ", brComment=" + brComment + ", brPrice=" + brPrice + ", brRegDate=" + brRegDate
				+ ", brStatus=" + brStatus + ", brOrderStatus=" + brOrderStatus + ", brMemberName=" + brMemberName
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + "]";
	}


}
