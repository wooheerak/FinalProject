package com.kh.FinalProject.studyroom_order.model.vo;

import java.sql.Date;

public class StudyroomOrder {
	private int so_no;
	private String so_floor;
	private String so_name;
	private int so_maxpeople;
	private String so_organizer;
	private String so_participant;
	private String so_start_time;
	private String so_end_time;
	private Date so_date;
	
	public StudyroomOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getSo_no() {
		return so_no;
	}
	public void setSo_no(int so_no) {
		this.so_no = so_no;
	}
	public String getSo_floor() {
		return so_floor;
	}
	public void setSo_floor(String so_floor) {
		this.so_floor = so_floor;
	}
	public String getSo_name() {
		return so_name;
	}
	public void setSo_name(String so_name) {
		this.so_name = so_name;
	}
	public int getSo_maxpeople() {
		return so_maxpeople;
	}
	public void setSo_maxpeople(int so_maxpeople) {
		this.so_maxpeople = so_maxpeople;
	}
	public String getSo_organizer() {
		return so_organizer;
	}
	public void setSo_organizer(String so_organizer) {
		this.so_organizer = so_organizer;
	}
	public String getSo_participant() {
		return so_participant;
	}
	public void setSo_participant(String so_participant) {
		this.so_participant = so_participant;
	}
	public String getSo_start_time() {
		return so_start_time;
	}
	public void setSo_start_time(String so_start_time) {
		this.so_start_time = so_start_time;
	}
	public String getSo_end_time() {
		return so_end_time;
	}
	public void setSo_end_time(String so_end_time) {
		this.so_end_time = so_end_time;
	}
	public Date getSo_date() {
		return so_date;
	}
	public void setSo_date(Date so_date) {
		this.so_date = so_date;
	}
	
	
	public StudyroomOrder(int so_no, String so_floor, String so_name, int so_maxpeople, String so_organizer,
			String so_participant, String so_start_time, String so_end_time, Date so_date) {
		super();
		this.so_no = so_no;
		this.so_floor = so_floor;
		this.so_name = so_name;
		this.so_maxpeople = so_maxpeople;
		this.so_organizer = so_organizer;
		this.so_participant = so_participant;
		this.so_start_time = so_start_time;
		this.so_end_time = so_end_time;
		this.so_date = so_date;
	}

	@Override
	public String toString() {
		return "StudyroomOrder [so_no=" + so_no + ", so_floor=" + so_floor + ", so_name=" + so_name + ", so_maxpeople="
				+ so_maxpeople + ", so_organizer=" + so_organizer + ", so_participant=" + so_participant
				+ ", so_start_time=" + so_start_time + ", so_end_time=" + so_end_time + ", so_date=" + so_date + "]";
	}
	
	
	
	
}
