package com.spring.chat;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.login.LoginVO;

@Controller
public class ChatController {
	
	@Autowired(required = false)
	private ChatService chatservice;
	
	@RequestMapping(value = "/index.ct", method = { RequestMethod.GET , RequestMethod.POST })
	public String index(Model model, HttpSession session) throws Exception {
		ArrayList<ChatVO> adminlist = null;
		ArrayList<MessageVO> roomlist = null;
		LoginVO userDetail = null;
		
		int check;
		try {
			adminlist = chatservice.allAdmin(); //일반유저일 경우 관리자목록 불러온다
		
			if(session.getAttribute("email") != null) { //세션이 null이 아니라면 유저정보 받아오기
				userDetail = (LoginVO)session.getAttribute("userDetail");
				if(userDetail.getUsergroup() != null) {
				if(userDetail.getUsergroup().equals("admin")) { //관리자일 경우 생성된 방정보 가져오기
					check = chatservice.checkRoom(userDetail.getNickname());
					if(check != 0) {
						roomlist = chatservice.getRoom(userDetail.getNickname());
						model.addAttribute("roomlist", roomlist);
					} else {
							/* System.out.println("생성된 방이 없습니다"); */
					}
				}
				}
			}
			model.addAttribute("adminlist", adminlist);
			return "index";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping(value = "/chatstart.ct", method = { RequestMethod.GET , RequestMethod.POST })
	public String chatstart(Model model, HttpServletRequest request) throws Exception {
		MessageVO messagevo = new MessageVO();
		
		String usergroup = null; //관리자인지 확인
		int room_num;
		int result;
		if(request.getParameter("usergroup") != null) {
			usergroup = request.getParameter("usergroup");
		}
		
		String img = null;
		if(usergroup == null || request.getParameter("sender").equals("비회원")) {
			if(!(request.getParameter("sender").equals("비회원"))) {
				img = chatservice.getImg(request.getParameter("sender"));
			} else {
				img = "/bit_project/image/0c57c52f289644ceb799d673566eed91.png";
			}
				messagevo.setReceiver(request.getParameter("nickname")); //메시지 받을 관리자 닉네임
				messagevo.setSender(request.getParameter("sender")); //보내는 사람 닉네임
				messagevo.setImg(img); //보내는 사람 프로필이미지
					
			try {
				result = chatservice.createRoom(messagevo);
				room_num = chatservice.getNum(request.getParameter("sender"));
				model.addAttribute("room_num", room_num);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			room_num = chatservice.getNum(request.getParameter("sender"));
			img = chatservice.getImg(request.getParameter("sender"));
			
			ArrayList<MessageVO> messagelist = chatservice.getMessage(room_num);
			model.addAttribute("messagelist", messagelist);
			model.addAttribute("img", img);
			model.addAttribute("room_num", room_num);
			model.addAttribute("target", request.getParameter("sender"));
			return "chat";
		}
		
		model.addAttribute("target", request.getParameter("nickname"));
		return "chat";
	}
	
	
}
