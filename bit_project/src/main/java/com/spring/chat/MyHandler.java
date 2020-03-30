package com.spring.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class MyHandler extends TextWebSocketHandler {
	//연결 요청 처리
	//메시지 받기, 메시지 전달
	
	//WebSocketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 이용할 수 있는 객체
	//해당 객체를 통해 메시지를 주고 받음
	
	@Autowired(required = false) //메시지 저장하기위해 필요
	private ChatService chatservice;
	
	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public MyHandler() {
		users = new ArrayList<WebSocketSession>();
		userMap = new HashMap<String, Object>();
	}
	
	@Override
	//소켓 연결 생성 후 실행 메서드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/* System.out.println("TextWebSocketHandler : 연결 생성! "); */
		users.add(session);
	}
	
	@Override
	//메시지 수신 후 실행 메서드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		/*
		 * System.out.println("TextWebSocketHandler : 메시지 수신! ");
		 * System.out.println("메시지 : " + message.getPayload());
		 */
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		MessageVO messagevo = new MessageVO();
		int result;
		
		if(type != null && type.equals("register")) {
			//등록 요청 메시지 
			String user = object.getString("userid");
			//아이디랑 Session이랑 매핑 >>> Map
			userMap.put(user, session);
		} else {
			//채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼것이기 때문에
			//Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
			String target = object.getString("target");
			WebSocketSession ws = null;
			ws = (WebSocketSession)userMap.get(target);
			
			String msg = object.getString("message");
			int room_num = Integer.parseInt(object.getString("room_num"));
			messagevo.setContent(msg);
			messagevo.setRoom_num(room_num);
			messagevo.setState("0");
			
			//타겟이 관리자중 한명인지 체크 -- 관리자면 state값 0 아니면 state값 1
			ArrayList<String> anickname = chatservice.getAdmin(); //관리자 닉네임 불러오기
			for(int i = 0; i < anickname.size(); i++) {
				String anick = anickname.get(i);
				if(target.equals(anick)) {
					messagevo.setState("1");
				}
			}
			
			/* 관리자 체크수정
			 * if(target.equals(anickname.get(0)) || target.equals("관리자2") ||
			 * target.equals("관리자3")) { messagevo.setState("1"); } else {
			 * messagevo.setState("0"); }
			 */	
			
			//DB에 메시지 내용 저장
			
			
			try {
				if(target.equals(anickname.get(0)) || target.equals(anickname.get(1)) || target.equals(anickname.get(2)) || target.equals(anickname.get(3))) { 
					result = chatservice.insertContent(messagevo);
				} else {
					if(ws == null) {
						/* System.out.println("채팅상대가 나갔습니다"); */		
					} else {
						result = chatservice.insertContent(messagevo);
					}
				}
			
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(ws != null) {
				ws.sendMessage(new TextMessage(msg));
			} else {
				if(target.equals("관리자1") || target.equals("관리자2") || target.equals("관리자3")) {
					/* System.out.println("관리자가 없다"); */
				} else {
					/* System.out.println("채팅방 없음"); */
				}
				
			}
		}
	}
	
	@Override
	//연결 해제 후 실행 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Set set = userMap.keySet();
		Iterator iterator = set.iterator();
		String imp = null;
		String key = null;
		//DB에서 채팅방 삭제후 연결 종료
		while(iterator.hasNext()) {
			key = (String)iterator.next();
			if(session == userMap.get(key)) {			
				imp = key;
				int count = chatservice.ckRoom(key);
				if(count != 0) {
					int room_num = chatservice.getNum(key); //방번호 조회
					chatservice.deleteMessage(room_num); //채팅내용 삭제
					chatservice.deleteRoom(key); //채팅방 삭제
					break;
				}
			} 
		}
		userMap.remove(imp);		
		users.remove(session);
	}
	
}
