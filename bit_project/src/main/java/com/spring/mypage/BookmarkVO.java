package com.spring.mypage;

import java.util.Date;

public class BookmarkVO {
	private int mark_num;
	private String email;
	private int product_num;
	private Date regist;
	

	public int getMark_num() {
		return mark_num;
	}
	public void setMark_num(int mark_num) {
		this.mark_num = mark_num;
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
