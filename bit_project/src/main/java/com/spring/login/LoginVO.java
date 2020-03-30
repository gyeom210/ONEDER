package com.spring.login;

import java.sql.Timestamp;

public class LoginVO {
	private String email;
	private String usergroup;
	private String nickname;
	private String name;
	private String password;
	private String phone;
	private String address;
	private String address_detail;
	private int postal_num;
	private String birth;
	private String children_birth;
	private String children_name;
	private String point;
	private Timestamp regist;
	private Timestamp last_connection;
	private String subscribe;
	private String instagram_id;
	private String receive_email;
	private String receive_text;
	private String img;
	private String email_state;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public int getPostal_num() {
		return postal_num;
	}
	public void setPostal_num(int postal_num) {
		this.postal_num = postal_num;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getChildren_birth() {
		return children_birth;
	}
	public void setChildren_birth(String children_birth) {
		this.children_birth = children_birth;
	}
	public String getChildren_name() {
		return children_name;
	}
	public void setChildren_name(String children_name) {
		this.children_name = children_name;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public Timestamp getRegist() {
		return regist;
	}
	public void setRegist(Timestamp regist) {
		this.regist = regist;
	}
	public Timestamp getLast_connection() {
		return last_connection;
	}
	public void setLast_connection(Timestamp last_connection) {
		this.last_connection = last_connection;
	}
	public String getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}
	public String getInstagram_id() {
		return instagram_id;
	}
	public void setInstagram_id(String instagram_id) {
		this.instagram_id = instagram_id;
	}
	public String getReceive_email() {
		return receive_email;
	}
	public void setReceive_email(String receive_email) {
		this.receive_email = receive_email;
	}
	public String getReceive_text() {
		return receive_text;
	}
	public void setReceive_text(String receive_text) {
		this.receive_text = receive_text;
	}
	public String getEmail_state() {
		return email_state;
	}
	public void setEmail_state(String email_state) {
		this.email_state = email_state;
	}
		
}
