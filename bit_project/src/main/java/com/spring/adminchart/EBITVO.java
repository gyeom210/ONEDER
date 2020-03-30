package com.spring.adminchart;

import java.util.Date;

public class EBITVO {
	private Date month;
	private int price;
	private int point_price;
	private int expenses;
	
	public Date getMonth() {
		return month;
	}
	public void setMonth(Date month) {
		this.month = month;
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
	public int getExpenses() {
		return expenses;
	}
	public void setExpenses(int expenses) {
		this.expenses = expenses;
	}

	

}
