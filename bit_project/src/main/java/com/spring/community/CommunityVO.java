package com.spring.community;

import java.util.Date;

public class CommunityVO {

	private int board_num;
	private String nickname;
	private String board_name;
	private String content;
	private Date regist;
	private String img;
	private int count;
	private String category;
	private int scrap_count;
	private String email;
	//
	private int start;
	private int end;
	private int co_count;
	private int an_count;
	private int cm_count;
	private int cmsearch_count;
	private String profile;
	
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
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
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
	public int getCo_count() {
		return co_count;
	}
	public void setCo_count(int co_count) {
		this.co_count = co_count;
	}
	public int getCm_count() {
		return cm_count;
	}
	public void setCm_count(int cm_count) {
		this.cm_count = cm_count;
	}
	public int getCmsearch_count() {
		return cmsearch_count;
	}
	public void setCmsearch_count(int cmsearch_count) {
		this.cmsearch_count = cmsearch_count;
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
	public int getAn_count() {
		return an_count;
	}
	public void setAn_count(int an_count) {
		this.an_count = an_count;
	}
}
