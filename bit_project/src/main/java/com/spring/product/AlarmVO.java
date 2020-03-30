package com.spring.product;

public class AlarmVO {
	private int alarm_num;
	private String email;
	private int product_num;
	private String phone;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAlarm_num() {
		return alarm_num;
	}
	public void setAlarm_num(int alarm_num) {
		this.alarm_num = alarm_num;
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
	
}
