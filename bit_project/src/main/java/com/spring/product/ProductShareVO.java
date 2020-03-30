package com.spring.product;

import java.util.Date;

public class ProductShareVO {
	private int share_num;
	private int waiting_num;
	private int product_num;
	private String product_name;
	private String email;
	private Date consignment_start_date;
	private Date consignment_end_date;
	private int total_share_count;
	private int total_accumulated_fund;
	private int accumulated_fund;
	private int total_amount;
	private int share_amount;
	private int current_amount;
	
	
	
	public int getWaiting_num() {
		return waiting_num;
	}
	public void setWaiting_num(int waiting_num) {
		this.waiting_num = waiting_num;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getTotal_share_count() {
		return total_share_count;
	}
	public void setTotal_share_count(int total_share_count) {
		this.total_share_count = total_share_count;
	}
	public int getTotal_accumulated_fund() {
		return total_accumulated_fund;
	}
	public void setTotal_accumulated_fund(int total_accumulated_fund) {
		this.total_accumulated_fund = total_accumulated_fund;
	}
	public int getAccumulated_fund() {
		return accumulated_fund;
	}
	public void setAccumulated_fund(int accumulated_fund) {
		this.accumulated_fund = accumulated_fund;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getShare_amount() {
		return share_amount;
	}
	public void setShare_amount(int share_amount) {
		this.share_amount = share_amount;
	}
	public int getCurrent_amount() {
		return current_amount;
	}
	public void setCurrent_amount(int current_amount) {
		this.current_amount = current_amount;
	}
	
}
