package com.spring.mypage;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.login.LoginService;
import com.spring.login.LoginVO;
import com.spring.payment.PaymentService;
import com.spring.payment.SubscriptionVO;
import com.sun.corba.se.spi.activation.Server;

@Controller
public class MypageController {
	
	@Autowired(required = false)
	private MypageService service;
	
	@Autowired(required = false)
	private LoginService loginservice;
	
	@Autowired(required = false)
	private PaymentService paymentService;
	
	@RequestMapping(value = "/mypage_main.my", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) throws Exception {
		String email = (String)session.getAttribute("email");
		PStateVO vo = new PStateVO();
		String regrade = "";
		
		int co = paymentService.checkCgrade(email); //등급변경 목록이 있는지 체크
		if(co != 0) {
			regrade = paymentService.getCgrade(email);
			model.addAttribute("regrade", regrade);
		}
		
		int reserve = service.checkReserve(email); //예약목록 체크
		if(reserve != 0) { 
			int rnum = service.getReserve(email);
			model.addAttribute("rnum", rnum);
		} else {
			System.out.println("예약목록이 없거나 구독대기/비정기 회원입니다.");
		}
		
		vo.setEmail(email);
		vo.setState("반납신청");
		int check = service.checkPS(vo); //반납신청한 목록이 있는지 체크
		if(check != 0) {
			PStateVO pstate = service.getProductState(vo);
			model.addAttribute("pstate", pstate); 
		} else {
			vo.setEmail(email);
			vo.setState("대여중");
			int check2 = service.checkPS(vo); //대여중인 목록이 있는지 체크
			if(check2 != 0) {
				PStateVO pstate2 = service.getProductState(vo);
				model.addAttribute("pstate", pstate2);
			}
		}
		
		LoginVO dbvo = loginservice.getDetail(email);
		model.addAttribute("dbvo", dbvo);
		
		SubscriptionVO subvo = paymentService.getSubscribe(email);
		model.addAttribute("subvo", subvo);
		
		return "mypage/mypage_main";
	}
}
