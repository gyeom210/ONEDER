package com.spring.calendar;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	
	@Autowired(required = false)
	private CalendarService calendarservice;
	
	@RequestMapping(value = "/updatePS_application.my", produces="application/json;charset=UTF-8", method = { RequestMethod.GET , RequestMethod.POST })
	@ResponseBody
	public HashMap<String, String> updatePS(CalendarVO vo, HttpServletRequest request) throws Exception {
		HashMap<String, String> data = new HashMap<String, String>();
		vo = calendarservice.getSC(vo.getEmail()); //subscribe_num
		vo.setState("반납신청");
		vo.setReturn_application(request.getParameter("return_application"));
		
		try {
			int res = calendarservice.updatePS(vo);
			data.put("res", "OK");
		} catch(Exception e) {
			e.printStackTrace();
			data.put("res", "Fail");
		}
		
		return data;
	}
	
	@RequestMapping(value = "/updatePS_reset.my", produces="application/json;charset=UTF-8", method = { RequestMethod.GET , RequestMethod.POST })
	@ResponseBody
	public HashMap<String, String> resetPS(CalendarVO vo, HttpServletRequest request) throws Exception {
		HashMap<String, String> data = new HashMap<String, String>();
		vo = calendarservice.getSC(vo.getEmail());
		vo.setState("대여중");
		vo.setReturn_application("N");
		
		try {
			int res = calendarservice.resetPS(vo);
			data.put("res", "OK");
		} catch(Exception e) {
			e.printStackTrace();
			data.put("res", "Fail");
		}

		return data;
	}
	

}
