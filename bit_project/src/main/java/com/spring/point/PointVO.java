package com.spring.point;

import java.util.Date;

public class PointVO {
	private int point_num;
	private String email;
	private Date occur_date;
	private String state;
	private int variation;
	private String reason;
	private int start;
	private int end;
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getOccur_date() {
		return occur_date;
	}
	public void setOccur_date(Date occur_date) {
		this.occur_date = occur_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getVariation() {
		return variation;
	}
	public void setVariation(int variation) {
		this.variation = variation;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
}
