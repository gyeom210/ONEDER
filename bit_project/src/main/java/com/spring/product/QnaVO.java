package com.spring.product;

import java.util.Date;

public class QnaVO {

	private int question_num;
	private String question_title;
	private int product_num;
	private String email;
	private String nickname;
	private String content;
	private Date regist;
	private String secret;
	private String answer;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
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
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
