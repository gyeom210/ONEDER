package com.spring.tazo;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	@RequestMapping(value = "/mypage_main#6.my", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		return "mypage/mypage_update";
	}
	
	@RequestMapping(value = "/main_test.tz")
	public String share(Model model, HttpSession session) {
		
		return "main2";
	}
	
	@RequestMapping(value = "/about.tz")
	public String about(Model model, HttpSession session) {
		
		return "about_test";
	}
	
	
}
