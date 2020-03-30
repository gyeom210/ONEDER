package com.spring.payment;

import java.util.Date;

public class PaymentVO {
	private int pay_num;
	private String customer_uid;
	private int subscribe_num;
	private Date pay_date;
	private int price; //등급별 가격
	private int point_price; //포인트 차감
	private int pay_price; //실제 결제금액
	private String merchant_uid; //주문번호2
	private String imp_uid; //주문번호1
	private String state;
	private String grade;
	
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getCustomer_uid() {
		return customer_uid;
	}
	public void setCustomer_uid(String customer_uid) {
		this.customer_uid = customer_uid;
	}
	public int getSubscribe_num() {
		return subscribe_num;
	}
	public void setSubscribe_num(int subscribe_num) {
		this.subscribe_num = subscribe_num;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPoint_price() {
		return point_price;
	}
	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	


}
