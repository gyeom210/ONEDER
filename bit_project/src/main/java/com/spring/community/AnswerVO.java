package com.spring.community;

import java.util.Date;

public class AnswerVO {
	private int answer_num;
	private int comment_num;
	private String nickname;
	private String content;
	private Date regist;
	//
	private String email;
	private String profile;
	private int board_num;
	
	public int getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(int answer_num) {
		this.answer_num = answer_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
		this.regist = regist;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
}
