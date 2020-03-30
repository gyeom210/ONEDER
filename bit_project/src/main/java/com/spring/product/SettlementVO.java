package com.spring.product;

import java.util.Date;

public class SettlementVO {
	//공통
	private int settlement_num;
	private int share_num;
	private int product_num;
	private String email;
	private String product_name;
	private int accumulated_fund;
	private String name;
	private String bank;
	private String account;
	private Date settlement_day;
	private String state;
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getSettlement_day() {
		return settlement_day;
	}
	public void setSettlement_day(Date settlement_day) {
		this.settlement_day = settlement_day;
	}
	public int getSettlement_num() {
		return settlement_num;
	}
	public void setSettlement_num(int settlement_num) {
		this.settlement_num = settlement_num;
	}
	public int getShare_num() {
		return share_num;
	}
	public void setShare_num(int share_num) {
		this.share_num = share_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
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
	public int getAccumulated_fund() {
		return accumulated_fund;
	}
	public void setAccumulated_fund(int accumulated_fund) {
		this.accumulated_fund = accumulated_fund;
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
	
}
