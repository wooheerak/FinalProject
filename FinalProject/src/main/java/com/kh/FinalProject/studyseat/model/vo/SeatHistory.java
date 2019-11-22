package com.kh.FinalProject.studyseat.model.vo;

import java.sql.Date;

public class SeatHistory {

		private int shNo ;
		private Date useDate ;
		private String shStatus ;
		private String startTime ;
		private String endTime; 
		private Seat seat ;
		
		public SeatHistory() {
			
		}

		public SeatHistory(int shNo, Date useDate, String shStatus, String startTime, String endTime, Seat seat) {
			super();
			this.shNo = shNo;
			this.useDate = useDate;
			this.shStatus = shStatus;
			this.startTime = startTime;
			this.endTime = endTime;
			this.seat = seat;
		}

		public int getShNo() {
			return shNo;
		}

		public void setShNo(int shNo) {
			this.shNo = shNo;
		}

		public Date getUseDate() {
			return useDate;
		}

		public void setUseDate(Date useDate) {
			this.useDate = useDate;
		}

		public String getShStatus() {
			return shStatus;
		}

		public void setShStatus(String shStatus) {
			this.shStatus = shStatus;
		}

		public String getStartTime() {
			return startTime;
		}

		public void setStartTime(String startTime) {
			this.startTime = startTime;
		}

		public String getEndTime() {
			return endTime;
		}

		public void setEndTime(String endTime) {
			this.endTime = endTime;
		}

		public Seat getSeat() {
			return seat;
		}

		public void setSeat(Seat seat) {
			this.seat = seat;
		}

		@Override
		public String toString() {
			return "SeatHistory [shNo=" + shNo + ", useDate=" + useDate + ", shStatus=" + shStatus + ", startTime="
					+ startTime + ", endTime=" + endTime + ", seat=" + seat + "]";
		}

		
		
		
}
