package com.kh.FinalProject.studyseat.model.vo;

import java.sql.Date;

public class SeatHistory {

		private int shNo ;
		private Date useDate ;
		private String shStatus ;
	
		private Seat seat ;
		
		public SeatHistory() {
			
		}

		public SeatHistory(int shNo, Date useDate, String shStatus, Seat seat) {
			super();
			this.shNo = shNo;
			this.useDate = useDate;
			this.shStatus = shStatus;
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

		public Seat getSeat() {
			return seat;
		}

		public void setSeat(Seat seat) {
			this.seat = seat;
		}

		@Override
		public String toString() {
			return "SEAT_HISTORY [shNo=" + shNo + ", useDate=" + useDate + ", shStatus=" + shStatus + ", seat=" + seat
					+ "]";
		}
		
		

		
		
}
