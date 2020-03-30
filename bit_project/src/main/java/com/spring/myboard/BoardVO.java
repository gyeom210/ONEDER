package com.spring.myboard;

import java.sql.Timestamp;

public class BoardVO {
	private int board_num;
	private String email;
	private String nickname;
	private String board_name; //게시글 제목
	private String content;
	private Timestamp regist;
	private String img;
	private int count;
	private String category; //게시글 게시판종류
	private int scrap_count;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegist() {
		return regist;
	}
	public void setRegist(Timestamp regist) {
		this.regist = regist;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getScrap_count() {
		return scrap_count;
	}
	public void setScrap_count(int scrap_count) {
		this.scrap_count = scrap_count;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
