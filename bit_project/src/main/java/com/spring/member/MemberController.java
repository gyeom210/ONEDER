package com.spring.member;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/signup.me", method = RequestMethod.GET)
	public String signup(Model model) {
		return "signup";
	}

	@RequestMapping(value = "/subscribestep1.me", method = RequestMethod.GET)
	public String subscribestep1(Model model) {
		return "subscribestep1";
	}

	@RequestMapping(value = "/subscribestep2.me", method = RequestMethod.GET)
	public String subscribestep2(Model model) {
		return "subscribestep2";
	}

//	@RequestMapping(value = "/subscribestep3.me")
//	public String subscribestep3(Model model) {
//		return "subscribestep3";
//	}

	@RequestMapping(value = "/findemail.me", method = RequestMethod.GET)
	public String findemail(HttpServletRequest request, HttpServletResponse response, Model model, MemberVO membervo)
			throws Exception {
		MemberVO memVO = new MemberVO();
		try {

			memVO = memberService.findEmail(membervo);
			if(memberService.findEmail(membervo) != null) {
				model.addAttribute("findEmail", memVO.getEmail());
				
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('일치하는 ID가 없습니다.'); history.go(-1);</script>");
				out.flush();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "findemail";

	}

	@RequestMapping(value = "/findpassword.me", method = RequestMethod.GET)
	public String findpassword(HttpServletRequest request, HttpServletResponse response, Model model, MemberVO membervo, @RequestParam("email") String email)
			throws Exception {
		MemberVO memVO = new MemberVO();

		try {
			if(memberService.findPassword(membervo).getPassword().equals("WrongPw")) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('입력하신 정보가 일치하지 않습니다.'); history.go(-1);</script>");
				out.flush();
				
			} else {
				System.out.println("Controller if문 진입.");
				memVO = memberService.findPassword(membervo);

				model.addAttribute("findPassword", memVO.getPassword());

			String setfrom = "onedershop@gmail.com"; // host 메일 주소
//		    String email  = request.getParameter("email");     // 받는 사람 이메일
			String title = "ONEDER 비밀번호"; // 제목
			String content = "새로운 비밀번호는 " + membervo.getPassword(); // 메일 내용


				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는 사람 생략하면 정상작동 안함
				messageHelper.setTo(membervo.getEmail()); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일 제목은 생략 가능
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "findpassword";
	}

	@RequestMapping(value = "/forgotIdPw.me", method = RequestMethod.GET)
	public String forgotIdPw(Model model) {
		return "forgotIdPw";
	}

	@RequestMapping(value = "/signedup.me", method = RequestMethod.GET)
	public String signedup(Model model) {
		return "signedup";
	}


	/* 회원가입 DB insert */
	@RequestMapping(value = "/memberInsert.me", method = RequestMethod.POST)
	public String memberInsert(MultipartHttpServletRequest request, HttpServletResponse response, MemberVO membervo,
			RedirectAttributes redirect) throws Exception {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer;
		MultipartFile mf = request.getFile("img2"); // 파일
		

		try {
			 /* default image */
		     if(mf.isEmpty()) {
		    	   membervo.setImg("/bit_project/image/0c57c52f289644ceb799d673566eed91.png"); //upload 폴더에 있는 default_profile 이미지명. 확장자명까지 넣을 것.   
		     } else {
	      
		    	String uploadPath = "/Users/nagyeom/upload/";
		        String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
		        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		        
		        if (mf.getSize() != 0) {
		        	mf.transferTo(new File(uploadPath + storedFileName));
		        	membervo.setImg("/bit_project/image/" + storedFileName);
		        }  
		     }
		     
		    /* 마케팅 수신  */
			if(membervo.getReceive_email() == null) {
				membervo.setReceive_email("N");
			}
			if(membervo.getReceive_text() == null) {
				membervo.setReceive_text("N");
			}
			
			/* 특수문자 제거 */
			String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]"; //특수문자 제거 정규식
//			membervo.setPhone(membervo.getPhone().replaceAll(match,"")); // phone - DB타입 varchar2로 바꿀 것.
			membervo.setBirth(membervo.getBirth().replaceAll(match,"")); // 유저 생년월일
			membervo.setChildren_birth(membervo.getChildren_birth().replaceAll(match,"")); // 자녀 생년월일
			
			/* DB insert */ 
			int res = memberService.memberInsert(membervo);
			writer = response.getWriter();
			
			/* 페이지 이동 */
			if(res == 1) {
//				writer.write("<script>alert('메일을 확인해주세요.'); location.href='main.ma';</script>");
				redirect.addAttribute("email", request.getParameter("email"));  
				return "redirect:/mailSending.me";
			} else {
				writer.write("<script>alert('회원 가입 실패.'); location.href='main.ma';</script>");
			}
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	
	  /* mailSending 코드 */
	  @RequestMapping(value = "/mailSending.me")
	  public String mailSending(HttpServletRequest request, HttpServletResponse response, @RequestParam("email") String email) throws Exception {
	   
	    String setfrom = "onedershop@gmail.com";  //host 메일 주소       
//	    String email  = request.getParameter("email");     // 받는 사람 이메일
	    String title = "ONEDER 회원가입 인증메일"; //제목
	    String content= "http://localhost:8080/bit_project/verifyEmail.me?id="+ email; //메일 내용
	   
	    response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는 사람 생략하면 정상작동 안함
	      messageHelper.setTo(email);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일 제목은 생략 가능
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	      
	      writer.write("<script>alert('인증 메일을 확인해주세요.'); location.href='main.ma';</script>");
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return null;
	  }
	
	/* 메일 인증 url */

	@RequestMapping(value = "/verifyEmail.me", method = RequestMethod.GET)
	public String verifyEmail(HttpServletRequest request, HttpServletResponse response, MemberVO membervo) {
		membervo.setEmail(request.getParameter("id"));

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer;
		int res = memberService.verifyEmail(membervo);

		try {

			writer = response.getWriter();

			if (res == 1) {
				writer.write("<script>alert('회원 가입 성공!!'); location.href='signedup.me';</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping(value = "/membercheck.me", method = RequestMethod.POST)
	public String membercheck(HttpServletRequest request, HttpServletResponse response, MemberVO membervo) {
		String url = request.getParameter(membervo.getImg());
		System.out.println(url);

		return "redirect:/main.ma";
	}
	
	@RequestMapping(value = "/memberupdate.me")
	public String memberupdate(HttpServletRequest request, HttpServletResponse response, MemberVO membervo) {
		
		
		
		return "mypage_update";
	}
	

}
