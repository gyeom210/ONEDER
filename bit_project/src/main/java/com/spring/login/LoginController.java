package com.spring.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.member.MemberVO;

@Controller
public class LoginController {
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	/* Naver BO */
	@Autowired(required = false)
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	/* nomalLogin */
	@Autowired(required = false)
	private LoginService service;
	

	@RequestMapping(value = "/nomal_login.me", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView nomal_login(LoginVO vo, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter writer = response.getWriter();
			
		ModelAndView mav = new ModelAndView();
		String email = vo.getEmail();
		String password = vo.getPassword();		
		
		// 이전페이지 정보
		String pre_url = request.getParameter("pre_url");
		System.out.println(pre_url);
		String url1 = null;
		String url2 = null;
		// 이전 페이지가 main페이지면 오류해결
		if(pre_url.substring(34).equals("/")) {
			url1 = "main.ma";
		} else {
			url1 = pre_url.substring(34);
		}
			
		// email, password, url 확인
		System.out.println(email +"/"+ password);
		System.out.println(pre_url +", "+ url1);
			
		// DB에서 Email 불러와서 등록된 이메일인지 확인
		LoginVO dbvo = null;
		LoginVO admindbvo = null;
		int check;
		int checkadmin;
		try {
			check = service.checkMember(email); // 등록된 이메일인지 확인
			if(check == 0) {
				checkadmin = service.checkAdmin(email);
				if(checkadmin == 0) {
					writer.write("<script>alert('등록되지 않은 이메일입니다.');location.href='./login.me?pre_url="+pre_url+"';</script>");
				} else { // admin테이블에서 이메일 조회후 카운트가0이 아니면 관리자 계정이므로 정보 조회후 세션에 저장
					admindbvo = service.getAdmin(email);
					if(admindbvo.getPassword().equals(password)) {
						session.setAttribute("email", admindbvo.getEmail());
						session.setAttribute("nickname", admindbvo.getNickname());
						session.setAttribute("img", admindbvo.getImg());
						session.setAttribute("userDetail", admindbvo);
						writer.write("<script>alert('관리자로 로그인했습니다.');location.href='./"+url1+"';</script>");
					} else {
						writer.write("<script>alert('잘못된 비밀번호입니다.');location.href='./login.me?pre_url="+pre_url+"';</script>");
					}
				}	
			} else { 
				dbvo = service.getDetail(email); // 등록된 이메일일 경우 상세정보 불러와서 패스워드 확인작업
				if(dbvo.getPassword().equals(password)) {
					if(dbvo.getEmail_state().equals("N")) { // 이메일 인증이 되지않은 이메일은 로그인 불가
						writer.write("<script>alert('인증되지 않은 이메일입니다. 이메일을 확인해주세요.');location.href='./login.me?pre_url="+pre_url+"';</script>");
					} else {
					session.setAttribute("email", dbvo.getEmail());
					session.setAttribute("nickname", dbvo.getNickname());
					session.setAttribute("img", dbvo.getImg());
					session.setAttribute("userDetail", dbvo);
					dbvo.setLast_connection(new Timestamp(System.currentTimeMillis()));
					service.updateConnection(dbvo);
					writer.write("<script>location.href='./"+url1+"';</script>");
					}
				} else {
					writer.write("<script>alert('잘못된 비밀번호입니다.');location.href='./login.me?pre_url="+pre_url+"';</script>");
				}
			}			
		} catch (Exception e) {
			e.printStackTrace();
			writer.write("<script>('시스템 에러');location.href='./login.me?pre_url="+pre_url+"';</script>");
		}
		return null;			
	}
	
	
	/* 일반/카카오/네이버 로그인페이지  (카카오/네이버 Url보내줌) */
	@RequestMapping(value = "/login.me", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		/* 카카오인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String kakaoUrl = KakaoController.getAuthorizationUri(session);
		
		//생성한 인증 URL을 View로 전달
		mav.setViewName("login");
		mav.addObject("kakao_Url", kakaoUrl);
		mav.addObject("naver_Url", naverAuthUrl);
		
		return mav;
		}
	
	
	/* 카카오 로그인 성공시 */
	@RequestMapping(value="/kakaologin.pr", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code, 
	HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		//결과값을 node에 담아줌
		JsonNode node = KakaoController.getAccessToken(code);
		//accessToken에 사용자의 로그인한 모든 정보가 들어있다
		JsonNode accessToken = node.get("access_token");
		//사용자의 정보
		JsonNode userInfo = KakaoController.getKaKaoUserInfo(accessToken);
		//DB에 맞게 받을 정보이름 수정
		String email = null;
		String nickname = null;
		String birthday = null;
		String image = null;
		
		//유저정보 카카오에서 가져오기
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		email = kakao_account.path("email").asText();
		nickname = properties.path("nickname").asText();
		image = properties.path("profile_image").asText();
		birthday = kakao_account.path("birthday").asText();
		System.out.println(email+"/"+nickname+"/"+image+"/"+birthday);
		
		// DB에서 Email 불러와서 등록된 이메일인지 확인
		int check;
		char cValue;
		try {
			check = service.checkMember(email); // 등록된 이메일인지 확인
			if(check == 0) {
				LoginVO dbvo = new LoginVO();
				dbvo.setEmail(email);
				dbvo.setPassword("카카오");
				//닉네임 확인후 동일한 닉네임 있을경우 뒤에 알파벳 추가(랜덤생성)
				ArrayList<LoginVO> list = service.getNickname();
				for(int i = 0; i < list.size(); i++) {
					if(nickname.equals(list.get(i).getNickname())) {
						for(int j = 0; j < 10; j++) {
						    double dValue = Math.random();
						    cValue = (char)((dValue * 26) + 65);   // 대문자
						    nickname += cValue;
						}
					    dbvo.setNickname(nickname);
					    break;
					}
				}
				dbvo.setNickname(nickname);
				if(birthday!=null) {
					dbvo.setBirth(birthday);
				} else {
					dbvo.setBirth("0");
				}
				dbvo.setRegist(new Timestamp(System.currentTimeMillis()));
				dbvo.setImg(image);
				dbvo.setEmail_state("Y");
				dbvo.setLast_connection(new Timestamp(System.currentTimeMillis()));
				int res = service.insertMember(dbvo); // 등록되지 않은 회원이면 DB에 저장
				if(res != 0) {
					LoginVO dbvo3 = new LoginVO();
					dbvo3 = service.getDetail(email);
					session.setAttribute("email", dbvo3.getEmail()); //세션 생성
					session.setAttribute("nickname", dbvo3.getNickname());
					session.setAttribute("img", dbvo3.getImg());
					session.setAttribute("userDetail", dbvo3);
					dbvo3.setLast_connection(new Timestamp(System.currentTimeMillis()));
					service.updateConnection(dbvo3);
				} else {
					System.out.println("등록실패");
					return "redirect:main.ma";
				}		
			} else { 
				System.out.println("등록된 회원입니다");
				LoginVO dbvo2 = new LoginVO();
				dbvo2 = service.getDetail(email); // 이미 등록된 이메일이면 DB에서 정보 가져오기
				session.setAttribute("email", dbvo2.getEmail()); //세션 생성
				session.setAttribute("nickname", dbvo2.getNickname());
				session.setAttribute("img", dbvo2.getImg());
				session.setAttribute("userDetail", dbvo2);
				dbvo2.setLast_connection(new Timestamp(System.currentTimeMillis()));
				service.updateConnection(dbvo2);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:main.ma";
	}
	
	/* 네이버 로그인 성공시 callback호출 메소드 */
	@RequestMapping(value = "/callback.pr", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam(required=false, defaultValue="0") String code, @RequestParam String state, HttpSession session, 
	HttpServletRequest request) throws IOException, ParseException {	
		
		//정보동의 취소시 이전페이지로 이동
		if(code.equals("0")) {
			return "main";
		}
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		String img = (String)response_obj.get("profile_image");
		String email = (String)response_obj.get("email");
		String name = (String)response_obj.get("name");
		String birth = (String)response_obj.get("birthday");
		System.out.println(nickname+"/"+email+"/"+name+"/"+img);
		
		// DB에서 Email 불러와서 등록된 이메일인지 확인
		int check;
		char cValue;
		try {
			check = service.checkMember(email); // 등록된 이메일인지 확인
			if(check == 0) {
				LoginVO dbvo = new LoginVO();
				dbvo.setEmail(email);
				dbvo.setPassword("네이버");
				//닉네임 확인후 동일한 닉네임 있을경우 뒤에 알파벳 추가(랜덤생성)
				ArrayList<LoginVO> list = service.getNickname();
				for(int i = 0; i < list.size(); i++) {
					if(nickname.equals(list.get(i).getNickname())) {
						for(int j = 0; j < 10; j++) {
						    double dValue = Math.random();
						    cValue = (char)((dValue * 26) + 65);   // 대문자
						    nickname += cValue;
						}
					    dbvo.setNickname(nickname);
					    break;
					}
				}
				dbvo.setNickname(nickname);
				dbvo.setBirth("0");
				if(birth!=null) {
					dbvo.setBirth(birth);
				} else {
					dbvo.setBirth("0");
				}
				dbvo.setImg(img);
				dbvo.setRegist(new Timestamp(System.currentTimeMillis()));
				dbvo.setEmail_state("Y");
				dbvo.setLast_connection(new Timestamp(System.currentTimeMillis()));
				int res = service.insertMember(dbvo); // 등록되지 않은 회원이면 DB에 저장
				if(res != 0) {
					LoginVO dbvo3 = new LoginVO();
					dbvo3 = service.getDetail(email);
					session.setAttribute("email", dbvo3.getEmail()); //세션 생성
					session.setAttribute("nickname", dbvo3.getNickname());
					session.setAttribute("img", dbvo3.getImg());
					session.setAttribute("userDetail", dbvo3);
					dbvo3.setLast_connection(new Timestamp(System.currentTimeMillis()));
					service.updateConnection(dbvo3);
					return "redirect:main.ma";
				} else {
					System.out.println("등록실패");
				}		
			} else { 
				System.out.println("등록된 회원입니다");
				LoginVO dbvo2 = new LoginVO();
				dbvo2 = service.getDetail(email); // 이미 등록된 이메일이면 DB에서 정보 가져오기
				session.setAttribute("email", dbvo2.getEmail()); //세션 생성
				session.setAttribute("nickname", dbvo2.getNickname());
				session.setAttribute("img", dbvo2.getImg());
				session.setAttribute("userDetail", dbvo2);
				dbvo2.setLast_connection(new Timestamp(System.currentTimeMillis()));
				service.updateConnection(dbvo2);
				return "redirect:main.ma";
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}					
		
		return "redirect:main.ma";
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout.me", method = { RequestMethod.GET, RequestMethod.POST })
		public String logout(HttpSession session)throws IOException {
		session.invalidate();
		return "redirect:main.ma";
	}
}
