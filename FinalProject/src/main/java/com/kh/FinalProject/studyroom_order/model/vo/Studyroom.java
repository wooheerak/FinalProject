package com.kh.FinalProject.studyroom_order.model.vo;

public class Studyroom {
	private String sr_name;
	private String sr_floor;
	private int sr_maxPeople;
	
	public Studyroom() {
		super();
	}
	
	public String getSr_name() {
		return sr_name;
	}
	public void setSr_name(String sr_name) {
		this.sr_name = sr_name;
	}
	public String getSr_floor() {
		return sr_floor;
	}
	public void setSr_floor(String sr_floor) {
		this.sr_floor = sr_floor;
	}
	public int getSr_maxPeople() {
		return sr_maxPeople;
	}
	public void setSr_maxPeople(int sr_maxPeople) {
		this.sr_maxPeople = sr_maxPeople;
	}
	
	public Studyroom(String sr_name, String sr_floor, int sr_maxPeople) {
		super();
		this.sr_name = sr_name;
		this.sr_floor = sr_floor;
		this.sr_maxPeople = sr_maxPeople;
	}
	
	
	
}
