package com.spring.chat;

import java.util.ArrayList;

public interface ChatService {
	public ArrayList<ChatVO> allAdmin() throws Exception;
	public ArrayList<MessageVO> getRoom(String nickname) throws Exception;
	public ArrayList<MessageVO> getMessage(int room_num) throws Exception;
	public int createRoom(MessageVO messagevo) throws Exception;
	public int insertContent(MessageVO messagevo) throws Exception;
	public int getNum(String sender) throws Exception;
	public void deleteRoom(String key) throws Exception;
	public int checkRoom(String nickname) throws Exception;
	public String getImg(String sender) throws Exception;
	public void deleteMessage(int room_num) throws Exception;
	public int ckRoom(String sender) throws Exception;
	public ArrayList<String> getAdmin() throws Exception;
}
