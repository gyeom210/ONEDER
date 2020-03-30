package com.spring.community;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.login.LoginService;
import com.spring.login.LoginVO;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired(required = false)
	private LoginService service;

	@RequestMapping(value = "/main.ma", method = RequestMethod.GET)
	public String main(Model model) {

		return "main";
	}

	@RequestMapping(value = "/about.ma", method = RequestMethod.GET)
	public String about(Model model) {

		return "about";
	}
	@RequestMapping(value = "/community.co", method = RequestMethod.GET)
	public String community(HttpServletRequest request, Model model) throws Exception{		
		String category = request.getParameter("category");
		
		if(category == null) {
			category = "자유게시판";
		}
		model.addAttribute("category", category);
		
		return "community";
	}
	
	//닉네임 검색
	@RequestMapping(value = "/community_user.co", method = RequestMethod.GET)
	public String community_user(HttpServletRequest request, Model model) throws Exception {
		String nickname = request.getParameter("nickname");
		
		model.addAttribute("nickname", nickname);
		
		return "community_user";
	}
	
	//게시글 상세보기
	@RequestMapping(value = "/community_detail.co", method = RequestMethod.GET)
	public String community_detail(HttpServletRequest request, Model model) throws Exception {
		CommunityVO cmvo = new CommunityVO();
		LoginVO dbvo = null;
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		cmvo = communityService.detailCommunity(board_num); //게시글 가져오기
		communityService.updateCount(board_num); //조회수 올리기
		int count1 = communityService.getCommentCount(board_num); //게시글의 댓글수 조회
		int count2 = communityService.getAnswerCount(board_num); //게시글의 대댓수 조회
		int cocount = count1 + count2;
		
		String email = cmvo.getEmail();
//		String img = communityService.getuserImg(email); //작성자 이메일로 프로필사진 가져오기
		dbvo = service.getDetail(email);
		String img = dbvo.getImg();
		String email_co = dbvo.getEmail();
		
		model.addAttribute("email_co", email_co);
		model.addAttribute("img", img);
		model.addAttribute("cocount", cocount);
		model.addAttribute("cmvo", cmvo);

		return "community_detail";
	}
	
}
