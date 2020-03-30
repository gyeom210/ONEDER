package com.spring.chat;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<ChatVO> allAdmin() throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			ArrayList<ChatVO> adminlist = chatmapper.allAdmin();
			return adminlist;
		} catch (Exception e) {
			throw new Exception("관리자 조회 실패", e);
		}
	}
	
	@Override
	public ArrayList<MessageVO> getRoom(String nickname) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			ArrayList<MessageVO> roomlist = chatmapper.getRoom(nickname);
			return roomlist;
		} catch (Exception e) {
			throw new Exception("채팅방 조회 실패" , e); 
		}
	}
	
	@Override
	public ArrayList<MessageVO> getMessage(int room_num) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			ArrayList<MessageVO> messagelist = chatmapper.getMessage(room_num);
			return messagelist;
		} catch (Exception e) {
			throw new Exception("채팅글 조회 실패" , e); 
		}
	}
	
	@Override
	public int createRoom(MessageVO messagevo) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			int result = chatmapper.createRoom(messagevo);
			return result;
		} catch (Exception e) {
			throw new Exception("채팅방 생성 실패" , e); 
		}
	}
	
	@Override
	public int insertContent(MessageVO messagevo) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			int result = chatmapper.insertContent(messagevo);
			return result;
		} catch (Exception e) {
			throw new Exception("메시지 등록 실패", e);
		}
	}
	
	@Override
	public int getNum(String sender) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			int num = chatmapper.getNum(sender);
			return num;
		} catch (Exception e) {
			throw new Exception("방번호 조회 실패", e);
		}
	}
	
	@Override
	public void deleteRoom(String key) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			chatmapper.deleteRoom(key);
		} catch (Exception e) {
			throw new Exception("채팅방 삭제 실패", e);
		}
	}
	
	@Override
	public int checkRoom(String nickname) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			int check = chatmapper.checkRoom(nickname);
			return check;
		} catch (Exception e) {
			throw new Exception("채팅방 체크(관리자)", e);
		}
	}
	
	@Override
	public String getImg(String sender) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			String img = chatmapper.getImg(sender);
			return img;
		} catch (Exception e) {
			throw new Exception("이미지 불러오기 실패", e);
		}
	}
	
	@Override
	public void deleteMessage(int room_num) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			chatmapper.deleteMessage(room_num);
		} catch (Exception e) {
			throw new Exception("메시지 삭제 실패", e);
		}
	}
	
	@Override
	public int ckRoom(String sender) throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			int count = chatmapper.ckRoom(sender);
			return count;
		} catch (Exception e) {
			throw new Exception("채팅방 체크 실패(유저)", e);
		}
	}
	
	@Override
	public ArrayList<String> getAdmin() throws Exception {
		try {
			ChatMapper chatmapper = sqlSession.getMapper(ChatMapper.class);
			ArrayList<String> nickname = chatmapper.getAdmin();
			return nickname;
		} catch (Exception e) {
			throw new Exception("관리자 목록조회 실패", e);
		}
	}
}
