package com.spring.mypage;

import java.util.Date;

public class ReservationVO {
	private int reserve_num;
	private String email;
	private int product_num;
	private Date regist;
	private String state;
	
	public int getReserve_num() {
		return reserve_num;
	}
	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
