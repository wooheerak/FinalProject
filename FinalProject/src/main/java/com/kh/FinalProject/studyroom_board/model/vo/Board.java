package com.kh.FinalProject.studyroom_board.model.vo;

import java.sql.Date;

public class Board {
	private int bo_primary;	// 기본번호 (pk)
	private int bo_number;	// 글 번호
	private String bo_detail;	// 내용
	private String bo_name;	// 작성자
	private int bo_member;	// 현재 인원
	private int bo_maxmember;	// 모집 인원
	private Date bo_date;	// 작성일
	private String bo_complete; // 모집 완료
	private String bo_join;	// 참여자
	private String bo_reinfo;	// 예약 정보
	private String bo_ing;	// 게시글 상태
	
	
	public Board() {}

	
	// 전체
	public Board(int bo_primary, int bo_number, String bo_detail, String bo_name, int bo_member, int bo_maxmember,
			Date bo_date, String bo_complete, String bo_join, String bo_reinfo, String bo_ing) {
		super();
		this.bo_primary = bo_primary;
		this.bo_number = bo_number;
		this.bo_detail = bo_detail;
		this.bo_name = bo_name;
		this.bo_member = bo_member;
		this.bo_maxmember = bo_maxmember;
		this.bo_date = bo_date;
		this.bo_complete = bo_complete;
		this.bo_join = bo_join;
		this.bo_reinfo = bo_reinfo;
		this.bo_ing = bo_ing;
	}

	// 기본번호 제외
	public Board(int bo_number, String bo_detail, String bo_name, int bo_member, int bo_maxmember, Date bo_date,
			String bo_complete, String bo_join, String bo_reinfo, String bo_ing) {
		super();
		this.bo_number = bo_number;
		this.bo_detail = bo_detail;
		this.bo_name = bo_name;
		this.bo_member = bo_member;
		this.bo_maxmember = bo_maxmember;
		this.bo_date = bo_date;
		this.bo_complete = bo_complete;
		this.bo_join = bo_join;
		this.bo_reinfo = bo_reinfo;
		this.bo_ing = bo_ing;
	}


	public int getBo_primary() {
		return bo_primary;
	}


	public void setBo_primary(int bo_primary) {
		this.bo_primary = bo_primary;
	}


	public int getBo_number() {
		return bo_number;
	}


	public void setBo_number(int bo_number) {
		this.bo_number = bo_number;
	}


	public String getBo_detail() {
		return bo_detail;
	}


	public void setBo_detail(String bo_detail) {
		this.bo_detail = bo_detail;
	}


	public String getBo_name() {
		return bo_name;
	}


	public void setBo_name(String bo_name) {
		this.bo_name = bo_name;
	}


	public int getBo_member() {
		return bo_member;
	}


	public void setBo_member(int bo_member) {
		this.bo_member = bo_member;
	}


	public int getBo_maxmember() {
		return bo_maxmember;
	}


	public void setBo_maxmember(int bo_maxmember) {
		this.bo_maxmember = bo_maxmember;
	}


	public Date getBo_date() {
		return bo_date;
	}


	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}


	public String getBo_complete() {
		return bo_complete;
	}


	public void setBo_complete(String bo_complete) {
		this.bo_complete = bo_complete;
	}


	public String getBo_join() {
		return bo_join;
	}


	public void setBo_join(String bo_join) {
		this.bo_join = bo_join;
	}


	public String getBo_reinfo() {
		return bo_reinfo;
	}


	public void setBo_reinfo(String bo_reinfo) {
		this.bo_reinfo = bo_reinfo;
	}


	public String getBo_ing() {
		return bo_ing;
	}


	public void setBo_ing(String bo_ing) {
		this.bo_ing = bo_ing;
	}


	@Override
	public String toString() {
		return "Board [bo_primary=" + bo_primary + ", bo_number=" + bo_number + ", bo_detail=" + bo_detail
				+ ", bo_name=" + bo_name + ", bo_member=" + bo_member + ", bo_maxmember=" + bo_maxmember + ", bo_date="
				+ bo_date + ", bo_complete=" + bo_complete + ", bo_join=" + bo_join + ", bo_reinfo=" + bo_reinfo
				+ ", bo_ing=" + bo_ing + "]";
	}
	
	

}