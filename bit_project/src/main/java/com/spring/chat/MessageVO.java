package com.spring.chat;

public class MessageVO {
	private int message_num;
	private String content;
	private int room_num;
	private String receiver;
	private String sender;
	private String img;
	private String state;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
