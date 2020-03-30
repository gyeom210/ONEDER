package com.spring.payment;

public class SubscriptionVO {

	private int subscribe_num;
	private String email;
	private String grade;
	private String state;
	private int count;
	
	public int getSubscribe_num() {
		return subscribe_num;
	}
	public void setSubscribe_num(int subscribe_num) {
		this.subscribe_num = subscribe_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}
