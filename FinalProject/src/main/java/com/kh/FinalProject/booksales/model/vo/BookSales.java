package com.kh.FinalProject.booksales.model.vo;

import java.sql.Date;

public class BookSales {
	private int bsOrderNo;
	private int bsBnumber;
	private String sStudent;
	private String bStudent;
	private Date bsDate;
	private String bsStatus;
	private String bName;
	private int bPrice;
	
	public BookSales() {}

	public BookSales(int bsOrderNo, int bsBnumber, String sStudent, String bStudent, Date bsDate, String bsStatus,
			String bName, int bPrice) {
		super();
		this.bsOrderNo = bsOrderNo;
		this.bsBnumber = bsBnumber;
		this.sStudent = sStudent;
		this.bStudent = bStudent;
		this.bsDate = bsDate;
		this.bsStatus = bsStatus;
		this.bName = bName;
		this.bPrice = bPrice;
	}

	public int getBsOrderNo() {
		return bsOrderNo;
	}

	public void setBsOrderNo(int bsOrderNo) {
		this.bsOrderNo = bsOrderNo;
	}

	public int getBsBnumber() {
		return bsBnumber;
	}

	public void setBsBnumber(int bsBnumber) {
		this.bsBnumber = bsBnumber;
	}

	public String getsStudent() {
		return sStudent;
	}

	public void setsStudent(String sStudent) {
		this.sStudent = sStudent;
	}

	public String getbStudent() {
		return bStudent;
	}

	public void setbStudent(String bStudent) {
		this.bStudent = bStudent;
	}

	public Date getBsDate() {
		return bsDate;
	}

	public void setBsDate(Date bsDate) {
		this.bsDate = bsDate;
	}

	public String getBsStatus() {
		return bsStatus;
	}

	public void setBsStatus(String bsStatus) {
		this.bsStatus = bsStatus;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public int getbPrice() {
		return bPrice;
	}

	public void setbPrice(int bPrice) {
		this.bPrice = bPrice;
	}

	@Override
	public String toString() {
		return "BookSales [bsOrderNo=" + bsOrderNo + ", bsBnumber=" + bsBnumber + ", sStudent=" + sStudent
				+ ", bStudent=" + bStudent + ", bsDate=" + bsDate + ", bsStatus=" + bsStatus + ", bName=" + bName
				+ ", bPrice=" + bPrice + "]";
	}
	
	
	
}
