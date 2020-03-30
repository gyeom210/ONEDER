package com.spring.mypage;

import java.sql.Timestamp;

public class PStateVO {
	private int state_num;
	private int subscribe_num;
	private int product_num;
	private String state;
	private Timestamp delivery_date;
	private String return_application;
	private String email;
	private String product_name;
	
	public int getState_num() {
		return state_num;
	}
	public void setState_num(int state_num) {
		this.state_num = state_num;
	}
	public int getSubscribe_num() {
		return subscribe_num;
	}
	public void setSubscribe_num(int subscribe_num) {
		this.subscribe_num = subscribe_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Timestamp delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getReturn_application() {
		return return_application;
	}
	public void setReturn_application(String return_application) {
		this.return_application = return_application;
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
}
