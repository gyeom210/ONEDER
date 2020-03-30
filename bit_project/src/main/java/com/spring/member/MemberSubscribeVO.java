package com.spring.member;

import java.util.Date;

public class MemberSubscribeVO {

	private String email;
	private String nickname;
	private String phone;
	private Date regist;
	private String subscribe;
	private String grade;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
		this.regist = regist;
	}
	public String getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getUsergroup() {
		return usergroup;
	}
	public void setUsergroup(String usergroup) {
		this.usergroup = usergroup;
	}
	private String usergroup;
}
