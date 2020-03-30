

package com.spring.chat;

import java.sql.Timestamp;

public class ChatVO {
	private String email;
	private String nickname;
	private String password;
	private String phone;
	private Timestamp regist;
	private String img;
	private String usergroup;
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getRegist() {
		return regist;
	}
	public void setRegist(Timestamp regist) {
		this.regist = regist;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUsergroup() {
		return usergroup;
	}
	public void setUsergroup(String usergroup) {
		this.usergroup = usergroup;
	}

}
