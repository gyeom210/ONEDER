package com.spring.myboard;

import java.sql.Timestamp;

public class ActiveVO {
	private Timestamp last_connection;
	private Timestamp regist;
	private int board_count;
	private int review_count;
	private int comment_count;
	private int scrap_count;
	
	public Timestamp getLast_connection() {
		return last_connection;
	}
	public void setLast_connection(Timestamp last_connection) {
		this.last_connection = last_connection;
	}
	
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getScrap_count() {
		return scrap_count;
	}
	public void setScrap_count(int scrap_count) {
		this.scrap_count = scrap_count;
	}
	public Timestamp getRegist() {
		return regist;
	}
	public void setRegist(Timestamp regist) {
		this.regist = regist;
	}
}
