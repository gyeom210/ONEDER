package com.spring.mapper;

import java.util.ArrayList;

import com.spring.chat.ChatVO;
import com.spring.chat.MessageVO;

public interface ChatMapper {
	ArrayList<ChatVO> allAdmin();
	ArrayList<MessageVO> getRoom(String nickname);
	ArrayList<MessageVO> getMessage(int room_num);
	int createRoom(MessageVO messagevo);
	int insertContent(MessageVO messagevo);
	int getNum(String sender);
	void deleteRoom(String key);
	int checkRoom(String nickname);
	String getImg(String sender);
	void deleteMessage(int room_num);
	int ckRoom(String sender);
	ArrayList<String> getAdmin();
}
