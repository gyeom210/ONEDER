package com.spring.product;

import java.util.Date;

public class reviewjoinmemberVO {
	//
	private String rimg;
	private Date regist;
	private String mimg;
	//리뷰
	private int review_num;
	private int product_num;
	private String nickname;
	private String content;
	private double gpa;	
	private int point_details;
	// 멤버
	private String email;
	private String usergroup;
	private String name;
	private String password;
	private String phone;
	private String address;
	private String address_detail;
	private int postal_num;
	private String birth;
	private String children_birth;/*N, Y*/
	private int point;
	private Date last_connection;
	private String subscribe; /*N, Y*/
	private String instagram_id;/*N, Y*/
	private String receive_email;/*N, Y*/
	private String receive_text;/*N, Y*/
	
	
	public int getPoint_details() {
		return point_details;
	}
	public void setPoint_details(int point_details) {
		this.point_details = point_details;
	}
	public String getRimg() {
		return rimg;
	}
	public void setRimg(String rimg) {
		this.rimg = rimg;
	}
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
		this.regist = regist;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
		this.gpa = gpa;
	}
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
	
	
}
