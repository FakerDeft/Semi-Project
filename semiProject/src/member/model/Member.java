package com.semi.member.model.vo;

import java.util.Date;

public class Member {
	
	private String memId;
	private String memPw;
	private String memName;
	private String memEmail;
	private String memPhone;
	private String memAddress;
	private String grade;
	private Date enrolldate;
	private String enrollflag;
	private Date deletedate;
	
	public Member() {
		super();
	}

	public Member(String memId, String memPw, String memName, String memPhone, String memEmail, String memAddress,
			String grade, Date enrolldate, String enrollflag, Date deletedate) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.memAddress = memAddress;
		this.grade = grade;
		this.enrolldate = enrolldate;
		this.enrollflag = enrollflag;
		this.deletedate = deletedate;
	}

	

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getEnrollflag() {
		return enrollflag;
	}

	public void setEnrollflag(String enrollflag) {
		this.enrollflag = enrollflag;
	}

	public Date getDeletedate() {
		return deletedate;
	}

	public void setDeletedate(Date deletedate) {
		this.deletedate = deletedate;
	}

	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memEmail=" + memEmail
				+ ", memPhone=" + memPhone + ", memAddress=" + memAddress + ", grade=" + grade + ", enrolldate="
				+ enrolldate + ", enrollflag=" + enrollflag + ", deletedate=" + deletedate + "]";
	}
	
}
