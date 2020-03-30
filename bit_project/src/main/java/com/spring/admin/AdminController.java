package com.spring.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.member.MemberVO;
import com.spring.menu.CompanyVO;
import com.spring.partner.PartnerService;
import com.spring.partner.PartnerVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping(value = "/share.se")
	public String share(Model model, HttpSession session) {
		
		return "admin/share";
	}
	@RequestMapping(value = "/shareOK.se")
	public String shareOK(Model model, HttpSession session) {
		
		return "admin/shareOK";
	}
	@RequestMapping(value = "/share_settle.se")
	public String sharesettle(Model model, HttpSession session) {
		
		return "admin/share_settle";
	}
	@RequestMapping(value = "/payment.se")
	public String payment(Model model, HttpSession session) {
		
		return "admin/payment";

	}

	@RequestMapping(value = "/login.se", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {

		return "admin/login";
	}

	@RequestMapping(value = "/profile.se", method = RequestMethod.GET)
	public String profile(Model model, HttpSession session) {

		return "admin/profile";
	}


//	@RequestMapping(value = "/index.se", method = RequestMethod.GET)
//	public String index(Model model, HttpSession session) {
//
//		return "admin/index";
//	}

	@RequestMapping(value = "/member_admin.se", method = RequestMethod.GET)
	public String member_admin(Model model, HttpSession session) {

		return "admin/member_admin";
	}

	@RequestMapping(value = "/member_group.se", method = RequestMethod.GET)
	public String member_group(Model model, HttpSession session) {

		return "admin/member_group";
	}

	@RequestMapping(value = "/kindergarten_admin.se", method = RequestMethod.GET)
	public String kindergarten_admin(Model model, HttpSession session) {

		return "admin/kindergarten_admin";
	}

	@RequestMapping(value = "/partner_admin.se")
	public String partner_admin(Model model, HttpSession session) {
		
		return "admin/partner_admin";
	}

	@RequestMapping(value = "/kindergarten_admin.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getMemberList() {
		List<CompanyVO> list = adminService.getMemberList();

		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;

	}

	@RequestMapping(value = "/partner_admin.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getPartnerinfo() {
		List<PartnerVO> list = adminService.getPartnerinfo();

		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}

	@PostMapping(value = "/ptdelete.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
		  	public Map<String, Object> ptdelete(String name) throws Exception {
		  		//adminService.ptdelete(partnerVO);
		  		Map<String, Object> result = new HashMap<String, Object>();
		  		try {
		  			adminService.ptdelete(name);
		  				result.put("res", "OK"); 

			      } catch (Exception e) {
			    	 result.put("res", "FAIL");
			         result.put("message", "Failure");
			      }
	     
		  		return result;
	}

	@PostMapping(value = "/partneradd.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> partneradd(PartnerVO partnerVO) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try { 
			partnerVO.setAccept_date(new Timestamp(System.currentTimeMillis()));
			int res = adminService.partneradd(partnerVO);

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
	
	@PostMapping(value = "/cpdelete.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
		  	public Map<String, Object> cpdelete(String name) throws Exception {
		  		//adminService.ptdelete(partnerVO);
		  		Map<String, Object> result = new HashMap<String, Object>();
		  		try {
		  			adminService.cpdelete(name);
		  				result.put("res", "OK"); 

			      } catch (Exception e) {
			    	 result.put("res", "FAIL");
			         result.put("message", "Failure");
			      }
	     
		  		return result;
	}

	@PostMapping(value = "/companyadd.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> companyadd(CompanyVO cpVO) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			cpVO.setAccept_date(new Timestamp(System.currentTimeMillis()));
			int res = adminService.companyadd(cpVO);

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
	
	@RequestMapping(value = "/ptsave.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
	
	public Map<String, Object> ptsave(PartnerVO partnerVO) {
		Map<String, Object> save = new HashMap<String, Object>();
		
		try {
			int res = adminService.ptsave(partnerVO);
			/*System.out.println(res);*/
			if (res >= 1 ) {
				save.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res <= 0) {
				save.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			save.put("res", "FAIL");
			save.put("message", "Failure");
		}

		return save;
	}
	
	@RequestMapping(value = "/cpsave.se", produces = "application/json;charset=UTF-8")
	@ResponseBody
	
	public Map<String, Object> cpsave(CompanyVO cpVO) {
		Map<String, Object> save = new HashMap<String, Object>();
		
		try {
			int res = adminService.cpsave(cpVO);
			/*System.out.println(res);*/
			if (res >= 1 ) {
				save.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res <= 0) {
				save.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			save.put("res", "FAIL");
			save.put("message", "Failure");
		}

		return save;
	}
	
	@RequestMapping(value = "/return.se", method = RequestMethod.GET)
	public String returnApp(Model model, HttpSession session) {
		return "admin/return";
	}
	@RequestMapping(value = "/returnpick.se", method = RequestMethod.GET)
	public String returnPick(Model model, HttpSession session) {
		return "admin/returnpick";
	}

	}



