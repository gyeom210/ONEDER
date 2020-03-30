package com.spring.account;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.MemberVO;

@Controller
public class AccountController {
	
	@Autowired(required = false)
	private AccountService accountService;
	
	
	@RequestMapping(value="/checkPW.at", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public Map<String, Object> checkPW (@RequestParam("email") String email, @RequestParam("password") String password) {
		  Map<String, Object> retVal = new HashMap<String, Object>();
	      MemberVO membervo = new MemberVO();
	      
	      try {
	         membervo.setEmail(email);
	         membervo.setPassword(password);
	         int res = accountService.checkPW(membervo);
	         if(res == 1) {
	            retVal.put("res", "OK");
	         } else if(res == -1) {
	            retVal.put("res", "FAIL");
	         }
	      } catch(Exception e) {
	         retVal.put("res", "FAIL");
	         retVal.put("message", "Failure");
	      }
	      return retVal;

	}
	
	@RequestMapping(value = "/deleteMyAccount.ac", method = RequestMethod.POST)
	public String deleteMyAccount(@RequestParam("email") String email, HttpSession session) {
		int res = 0;
		try {
			res = accountService.deleteMyAccount(email);
			if(res == 1) {
				 session.invalidate();
			} else if(res == 0) {
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "main";
	}
	

}
