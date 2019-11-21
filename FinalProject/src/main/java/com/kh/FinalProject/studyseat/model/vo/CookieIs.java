package com.kh.FinalProject.studyseat.model.vo;

public class CookieIs {

		private String cName ; //쿠키 이름
		private int sNo ;	   //좌석 번호
		private String cStatus ; // 쿠키 구분
		
		public CookieIs() {
			
		}

		public CookieIs(String cName, int sNo, String cStatus) {
			super();
			this.cName = cName;
			this.sNo = sNo;
			this.cStatus = cStatus;
		}

		public String getcName() {
			return cName;
		}

		public void setcName(String cName) {
			this.cName = cName;
		}

		public int getsNo() {
			return sNo;
		}

		public void setsNo(int sNo) {
			this.sNo = sNo;
		}

		public String getcStatus() {
			return cStatus;
		}

		public void setcStatus(String cStatus) {
			this.cStatus = cStatus;
		}

		@Override
		public String toString() {
			return "CookieIs [cName=" + cName + ", sNo=" + sNo + ", cStatus=" + cStatus + "]";
		}
		
		

				
}
