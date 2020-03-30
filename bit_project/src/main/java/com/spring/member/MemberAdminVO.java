package com.spring.member;

import java.sql.Timestamp;
import java.util.Date;

public class MemberAdminVO {
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
	private String children_birth;/*N, Y*/
	private int point;
	private Date regist;
	private Date last_connection;
	private String subscribe; /*N, Y*/
	private String instagram_id;/*N, Y*/
	private String receive_email;/*N, Y*/
	private String receive_text;/*N, Y*/
	private String img;
	private String grade;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsergroup() {
		return usergroup;
	}
	public void setUsergroup(String usergroup) {
		this.usergroup = usergroup;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
		this.regist = regist;
	}
	public Date getLast_connection() {
		return last_connection;
	}
	public void setLast_connection(Date last_connection) {
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	

	}
