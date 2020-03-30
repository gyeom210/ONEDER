package com.spring.member;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.login.LoginService;
import com.spring.login.LoginVO;

@RestController
public class MemberAjaxController {

	@Autowired(required = false)
	private MemberService memberService;
	
	@Autowired(required = false)
	private LoginService loginService;

	@PostMapping(value = "/nicknameCheck.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> nicknameCheck(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.nicknameCheck(membervo);

			if (res == 0) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res == 1) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	@PostMapping(value = "/nnupdateCheck.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> nnupdateCheck(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.nnupdateCheck(membervo);

			if (res == 0) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res == 1) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}

	@PostMapping(value = "/emailCheck.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> emailCheck(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.emailCheck(membervo);

			if (res == 0) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res == 1) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}

	@PostMapping(value = "/passwordCheck.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> passwordCheck(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.passwordCheck(membervo);

			if (res == 1) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res == 0) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}

		return retVal;
	}

	@PostMapping(value = "/passwordUpdate.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> passwordUpdate(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.passwordUpdate(membervo);

			if (res == 1) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res == 0) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}

		return retVal;
	}

	@PostMapping(value = "/nicknameupdateCheck.pr", produces = "application/json;charset=UTF-8")
	public Map<String, Object> nicknameupdateCheck(MultipartHttpServletRequest request, HttpServletResponse response,
			MemberVO membervo, HttpSession session) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MultipartFile mf = request.getFile("filename"); // 파일

		try {

		if (!(mf.isEmpty())) {

	    	String uploadPath = "/Users/nagyeom/upload/";
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

			if (mf.getSize() != 0) {
				// mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
				mf.transferTo(new File(uploadPath + storedFileName));
				membervo.setImg("/bit_project/image/" + storedFileName);
				}
			}

			int res = memberService.nicknameupdateCheck(membervo);

			if (res == 0) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값

			} else if (res == 1) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}
			
			
			LoginVO userDetail = new LoginVO();
			userDetail = loginService.getDetail(membervo.getEmail());
			session.setAttribute("email", userDetail.getEmail());
			session.setAttribute("nickname", userDetail.getNickname());
			session.setAttribute("img", userDetail.getImg());
			session.setAttribute("userDetail", userDetail);
			
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}

		return retVal;
	}
}
