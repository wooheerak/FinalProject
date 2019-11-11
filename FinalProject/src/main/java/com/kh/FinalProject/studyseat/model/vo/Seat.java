package com.kh.FinalProject.studyseat.model.vo;

public class Seat {

		private int ss_no ;         // 좌석번호
		private String ss_floor ;   // 열람실 층수
		private String ss_use ;     // 좌석 사용여부
		private String ss_cert ;    // 좌석 예약 인증 여부
		private String cert_code ;  // 좌석 예약 인증 코드
		private String student_id ; // 사용 or 예약한 학생의 학번
		private String strat_Time ; // 좌석 사용 시작 시간
		private String end_time ;   //좌석 사용 끝나는 시간
		
		public Seat() {
			
		}

		public Seat(int ss_no, String ss_floor, String ss_use, String ss_cert, String cert_code, String student_id,
				String strat_Time, String end_time) {
			super();
			this.ss_no = ss_no;
			this.ss_floor = ss_floor;
			this.ss_use = ss_use;
			this.ss_cert = ss_cert;
			this.cert_code = cert_code;
			this.student_id = student_id;
			this.strat_Time = strat_Time;
			this.end_time = end_time;
		}

		public int getSs_no() {
			return ss_no;
		}

		public void setSs_no(int ss_no) {
			this.ss_no = ss_no;
		}

		public String getSs_floor() {
			return ss_floor;
		}

		public void setSs_floor(String ss_floor) {
			this.ss_floor = ss_floor;
		}

		public String getSs_use() {
			return ss_use;
		}

		public void setSs_use(String ss_use) {
			this.ss_use = ss_use;
		}

		public String getSs_cert() {
			return ss_cert;
		}

		public void setSs_cert(String ss_cert) {
			this.ss_cert = ss_cert;
		}

		public String getCert_code() {
			return cert_code;
		}

		public void setCert_code(String cert_code) {
			this.cert_code = cert_code;
		}

		public String getStudent_id() {
			return student_id;
		}

		public void setStudent_id(String student_id) {
			this.student_id = student_id;
		}

		public String getStrat_Time() {
			return strat_Time;
		}

		public void setStrat_Time(String strat_Time) {
			this.strat_Time = strat_Time;
		}

		public String getEnd_time() {
			return end_time;
		}

		public void setEnd_time(String end_time) {
			this.end_time = end_time;
		}

		@Override
		public String toString() {
			return "Seat [ss_no=" + ss_no + ", ss_floor=" + ss_floor + ", ss_use=" + ss_use + ", ss_cert=" + ss_cert
					+ ", cert_code=" + cert_code + ", student_id=" + student_id + ", strat_Time=" + strat_Time
					+ ", end_time=" + end_time + "]";
		}
		
		
		
}
