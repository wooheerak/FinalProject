package com.kh.FinalProject.studyroom_order.model.vo;

public class Studyroom_orderInfo {
	private String userId;
	private String startTime;
	private String endTime;
	
	public Studyroom_orderInfo() {
		super();
	}

	public Studyroom_orderInfo(String userId, String startTime, String endTime) {
		super();
		this.userId = userId;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "Studyroom_orderInfo [userId=" + userId + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	
	
}
