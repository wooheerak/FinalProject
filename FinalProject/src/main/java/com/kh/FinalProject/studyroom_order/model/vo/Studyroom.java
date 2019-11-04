package com.kh.FinalProject.studyroom_order.model.vo;

public class Studyroom {
	private String Sr_floor;
	private String Sr_name;
	private int sr_maxPeople;
	
	
	
	public Studyroom() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Studyroom(String sr_floor, String sr_name, int sr_maxPeople) {
		super();
		Sr_floor = sr_floor;
		Sr_name = sr_name;
		this.sr_maxPeople = sr_maxPeople;
	}

	public String getSr_floor() {
		return Sr_floor;
	}
	public void setSr_floor(String sr_floor) {
		Sr_floor = sr_floor;
	}
	public String getSr_name() {
		return Sr_name;
	}
	public void setSr_name(String sr_name) {
		Sr_name = sr_name;
	}
	public int getSr_maxPeople() {
		return sr_maxPeople;
	}
	public void setSr_maxPeople(int sr_maxPeople) {
		this.sr_maxPeople = sr_maxPeople;
	}

	@Override
	public String toString() {
		return "studyroom [Sr_floor=" + Sr_floor + ", Sr_name=" + Sr_name + ", sr_maxPeople=" + sr_maxPeople + "]";
	}
	
	
}
