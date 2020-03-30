package com.spring.tazo;

import java.util.Date;

public class ShareWatingListVO {
	private int waiting_num;
	private String email;
	private String name;
	private String product_name;
	private int amount;
	private Date consignment_start_date;
	private Date consignment_end_date;
	private String share_img1;
	private String share_img2;
	private String share_img3;
	private String share_content;
	private String share_state;
	private String bank;
	private String account;
	
	
	public int getWaiting_num() {
		return waiting_num;
	}
	public void setWaiting_num(int waiting_num) {
		this.waiting_num = waiting_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getConsignment_start_date() {
		return consignment_start_date;
	}
	public void setConsignment_start_date(Date consignment_start_date) {
		this.consignment_start_date = consignment_start_date;
	}
	public Date getConsignment_end_date() {
		return consignment_end_date;
	}
	public void setConsignment_end_date(Date consignment_end_date) {
		this.consignment_end_date = consignment_end_date;
	}
	public String getShare_img1() {
		return share_img1;
	}
	public void setShare_img1(String share_img1) {
		this.share_img1 = share_img1;
	}
	public String getShare_img2() {
		return share_img2;
	}
	public void setShare_img2(String share_img2) {
		this.share_img2 = share_img2;
	}
	public String getShare_img3() {
		return share_img3;
	}
	public void setShare_img3(String share_img3) {
		this.share_img3 = share_img3;
	}
	public String getShare_content() {
		return share_content;
	}
	public void setShare_content(String share_content) {
		this.share_content = share_content;
	}
	public String getShare_state() {
		return share_state;
	}
	public void setShare_state(String share_state) {
		this.share_state = share_state;
	}
	
}
