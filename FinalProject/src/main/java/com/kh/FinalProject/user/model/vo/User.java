package com.kh.FinalProject.user.model.vo;

public class User {
	
	private String Member_Id;
	private String Member_Password;
	private String Member_Name;
	private String Member_No;
	private String Phone;
	private String Address;
	private String Member_Sep;
	private String Member_Email;
	
	//수진쓰가 추가한 부분
	private int rseatNo ; // 예약한 자리 번호
	private int useatNo ; // 현재 사용중인 죄석번호
	private String cStatus ; //쿠키 구분
	
	public User() {
		super();
		
	}

	public User(String member_Id, String member_Password, String member_Name, String member_No, String phone,
			String address, String member_Sep, String member_Email, int rseatNo, int useatNo, String cStatus) {
		super();
		Member_Id = member_Id;
		Member_Password = member_Password;
		Member_Name = member_Name;
		Member_No = member_No;
		Phone = phone;
		Address = address;
		Member_Sep = member_Sep;
		Member_Email = member_Email;
		this.rseatNo = rseatNo;
		this.useatNo = useatNo;
		this.cStatus = cStatus;
	}

	public String getMember_Id() {
		return Member_Id;
	}

	public void setMember_Id(String member_Id) {
		Member_Id = member_Id;
	}

	public String getMember_Password() {
		return Member_Password;
	}

	public void setMember_Password(String member_Password) {
		Member_Password = member_Password;
	}

	public String getMember_Name() {
		return Member_Name;
	}

	public void setMember_Name(String member_Name) {
		Member_Name = member_Name;
	}

	public String getMember_No() {
		return Member_No;
	}

	public void setMember_No(String member_No) {
		Member_No = member_No;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getMember_Sep() {
		return Member_Sep;
	}

	public void setMember_Sep(String member_Sep) {
		Member_Sep = member_Sep;
	}

	public String getMember_Email() {
		return Member_Email;
	}

	public void setMember_Email(String member_Email) {
		Member_Email = member_Email;
	}

	public int getRseatNo() {
		return rseatNo;
	}

	public void setRseatNo(int rseatNo) {
		this.rseatNo = rseatNo;
	}

	public int getUseatNo() {
		return useatNo;
	}

	public void setUseatNo(int useatNo) {
		this.useatNo = useatNo;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	@Override
	public String toString() {
		return "User [Member_Id=" + Member_Id + ", Member_Password=" + Member_Password + ", Member_Name=" + Member_Name
				+ ", Member_No=" + Member_No + ", Phone=" + Phone + ", Address=" + Address + ", Member_Sep="
				+ Member_Sep + ", Member_Email=" + Member_Email + ", rseatNo=" + rseatNo + ", useatNo=" + useatNo
				+ ", cStatus=" + cStatus + "]";
	}

	
	

}
