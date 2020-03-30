package com.spring.mypage;

import java.util.Date;

public class WishlistVO {
	private int wish_num;
	private String email;
	private int product_num;
	private Date regist;
	
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
	
}
