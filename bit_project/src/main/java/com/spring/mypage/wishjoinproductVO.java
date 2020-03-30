package com.spring.mypage;

import java.util.Date;

public class wishjoinproductVO {
	//공통
	private int product_num;
	private Date regist;
	
	//위시리스트
	private int wish_num;
	private String email;
	
	//상품
	private String product_name;
	private int total_amount;
	private int rental_amount;
	private int current_amount;
	private String manufacturer;
	private String product_content;
	private double gpa;
	private String category_l;
	private String category_m;
	private String category_s;
	private String img_sum;
	private String img_main;
	private String img_detail;
	private int readcount;
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
		this.regist = regist;
	}
	public int getWish_num() {
		return wish_num;
	}
	public void setWish_num(int wish_num) {
		this.wish_num = wish_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getRental_amount() {
		return rental_amount;
	}
	public void setRental_amount(int rental_amount) {
		this.rental_amount = rental_amount;
	}

	public int getCurrent_amount() {
		return current_amount;
	}
	public void setCurrent_amount(int current_amount) {
		this.current_amount = current_amount;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
		this.gpa = gpa;
	}
	public String getCategory_l() {
		return category_l;
	}
	public void setCategory_l(String category_l) {
		this.category_l = category_l;
	}
	public String getCategory_m() {
		return category_m;
	}
	public void setCategory_m(String category_m) {
		this.category_m = category_m;
	}
	public String getCategory_s() {
		return category_s;
	}
	public void setCategory_s(String category_s) {
		this.category_s = category_s;
	}
	public String getImg_sum() {
		return img_sum;
	}
	public void setImg_sum(String img_sum) {
		this.img_sum = img_sum;
	}
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	public String getImg_detail() {
		return img_detail;
	}
	public void setImg_detail(String img_detail) {
		this.img_detail = img_detail;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}
