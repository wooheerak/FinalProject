package com.kh.FinalProject.book.model.vo;


public class BookRent {
	
	private int br_no;
	private int b_no;
	private String br_date;
	private String br_return_date;
	private String user_id;
	private String br_status;
	private String m_status ;
	private Book book;

	public BookRent() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookRent(int br_no, int b_no, String br_date, String br_return_date, String user_id, String br_status,
			String m_status, Book book) {
		super();
		this.br_no = br_no;
		this.b_no = b_no;
		this.br_date = br_date;
		this.br_return_date = br_return_date;
		this.user_id = user_id;
		this.br_status = br_status;
		this.m_status = m_status;
		this.book = book;
	}

	public int getBr_no() {
		return br_no;
	}

	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getBr_date() {
		return br_date;
	}

	public void setBr_date(String br_date) {
		this.br_date = br_date;
	}

	public String getBr_return_date() {
		return br_return_date;
	}

	public void setBr_return_date(String br_return_date) {
		this.br_return_date = br_return_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBr_status() {
		return br_status;
	}

	public void setBr_status(String br_status) {
		this.br_status = br_status;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "BookRent [br_no=" + br_no + ", b_no=" + b_no + ", br_date=" + br_date + ", br_return_date="
				+ br_return_date + ", user_id=" + user_id + ", br_status=" + br_status + ", m_status=" + m_status
				+ ", book=" + book + "]";
	}
	
	
}
