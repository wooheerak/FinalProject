package com.kh.FinalProject.studyroom_order.model.vo;

import java.sql.Date;

public class StudyroomOrder {
	private int 	so_no;				// 예약번호
	private String 	so_floor;		// 층
	private String 	so_name;			// 스터디룸 이름
	private int 	bo_number;		// 스터디룸 게시글 번호
	private String 	so_organizer;	// 예약자
	private String 	so_participant;	// 참여자
	private String 	so_start_time;	// 예약시작 시간
	private String 	so_end_time;		// 예약 종료 시간
	private Date 	so_date;			// 예약 일
	private String 	so_bColor;			// 랜덤 배경 색상
	
	public StudyroomOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudyroomOrder(int so_no, String so_floor, String so_name, int bo_number, String so_organizer,
			String so_participant, String so_start_time, String so_end_time, Date so_date, String so_bColor) {
		super();
		this.so_no = so_no;
		this.so_floor = so_floor;
		this.so_name = so_name;
		this.bo_number = bo_number;
		this.so_organizer = so_organizer;
		this.so_participant = so_participant;
		this.so_start_time = so_start_time;
		this.so_end_time = so_end_time;
		this.so_date = so_date;
		this.so_bColor = so_bColor;
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
	public int getBo_number() {
		return bo_number;
	}
	public void setBo_number(int bo_number) {
		this.bo_number = bo_number;
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
	public String getSo_bColor() {
		return so_bColor;
	}
	public void setSo_bColor(String so_bColor) {
		this.so_bColor = so_bColor;
	}
	@Override
	public String toString() {
		return "StudyroomOrder [so_no=" + so_no + ", so_floor=" + so_floor + ", so_name=" + so_name + ", bo_number="
				+ bo_number + ", so_organizer=" + so_organizer + ", so_participant=" + so_participant
				+ ", so_start_time=" + so_start_time + ", so_end_time=" + so_end_time + ", so_date=" + so_date
				+ ", so_bColor=" + so_bColor + "]";
	}
	
		
	
	
	
	
	
	
}
