package com.spring.admin2;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.member.MemberAdminVO;
import com.spring.member.MemberService;
import com.spring.member.MemberSubscribeVO;
import com.spring.member.MemberVO;
import com.spring.mypage.PStateVO;
import com.spring.payment.SubscriptionVO;
import com.spring.product.SettlementVO;
import com.spring.tazo.ShareWatingListVO;

@Controller
public class AdminController2 {

	@Autowired
	private MemberService memberService;

	@Autowired
	private SubscribePaymentService subscribePaymentService;

	@RequestMapping(value = "/member_adminj.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String member_adminj() {
		List<MemberAdminVO> list = memberService.getMemberListjeon();

		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}

	
	
	@RequestMapping(value = "/member_admin.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getMemberList() {
		List<MemberSubscribeVO> list = memberService.getMemberList();

		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}

	@RequestMapping(value = "/member_group.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGroupList() {
		List<MemberVO> list = memberService.getGroupList();

		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}

	@PostMapping(value = "/normal_to_bad.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> normal_to_bad(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.normal_to_bad(membervo);

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

	@PostMapping(value = "/bad_to_normal.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> bad_to_normal(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.bad_to_normal(membervo);

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

	@RequestMapping(value = "/member_share.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getShareWaitingList() {
		List<ShareWatingListVO> shareList = subscribePaymentService.getShareList();

		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(shareList); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}

	@RequestMapping(value = "/shareAcceptOrDeny.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> shareAcceptOrDeny(int waiting_num, String chk) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		int chk_num = 0;
		try {
			if (chk.equals("Accept")) {
				chk_num = 1;
				subscribePaymentService.shareWaitingListAcceptOrDeny(waiting_num, chk_num);
			} else {
				chk_num = 2;
				subscribePaymentService.shareWaitingListAcceptOrDeny(waiting_num, chk_num);
			}
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
		}
		return retVal;
	}

	@RequestMapping(value = "/shareAcceptList.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<ShareWatingListVO> shareAcceptList() {
		List<ShareWatingListVO> List = null;
		try {
			List = subscribePaymentService.getShareAcceptList();

		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return List;
	}

	@RequestMapping(value = "/member_share_settle.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String member_share_settle() {
		List<SettlementVO> settleList = subscribePaymentService.getSettleList();
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(settleList); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}

	@RequestMapping(value = "/admin_batch.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void admin_batch() {
		int randomPnum = 0,pnum = 0;
		ArrayList<Integer> wishList = null;
		ArrayList<SubscriptionVO> list = new ArrayList<SubscriptionVO>();
		try {
			List<SubscriptionVO> emailList = subscribePaymentService.getEmail();
			list = (ArrayList) emailList;
			for (SubscriptionVO vo : list) {
				wishList = (ArrayList)subscribePaymentService.getWish(vo.getEmail());
				if(wishList.size()==0) {
					pnum = subscribePaymentService.adminSelectWish(vo.getGrade());
					subscribePaymentService.adminInsertWish(pnum, vo.getEmail());
					wishList = (ArrayList)subscribePaymentService.getWish(vo.getEmail());
				}
				Collections.shuffle(wishList);
				randomPnum = wishList.get(0);
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
				Calendar cal = Calendar.getInstance();
				String today = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
						+ cal.get(Calendar.DAY_OF_MONTH);
				Date date = formatter.parse(today);
				int dayNum = cal.get(Calendar.DAY_OF_WEEK);
				switch (dayNum) {
				case 1:
					date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 4));
					System.out.println(date);
					break;
				case 2:
					date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 3));
					System.out.println(date);
					break;
				case 3:
					date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 2)); 
					System.out.println(date);
					break;
				case 4:
					date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 1)); 
					System.out.println(date);
					break;
				case 5:
					date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 7)); 
					System.out.println(date);
					break;
				case 6:
					date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 6)); 
					System.out.println(date);
					break;
				case 7:
					date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 5));
					System.out.println(date);
					break;
				}
				// 개인쉐어일 경우, product, product_share 두 테이블의 수량 바꿔야되고, 적립금 줘야됨.
				int res = 0;
				res = subscribePaymentService.personalSharingCheck(randomPnum);
				subscribePaymentService.insertWish(randomPnum, vo.getSubscribe_num(), date);
				if(res==1) {
				subscribePaymentService.personalSharingFund(randomPnum);
				}
				subscribePaymentService.updateProductAmount(randomPnum);
				subscribePaymentService.deleteWish(randomPnum, vo.getEmail());
				System.out.println("foreach 도는중 쿠쿠");
			}
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
	
	}
	
	@RequestMapping(value = "/admin_return.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_return() {
		List<PStateVO> returnList = subscribePaymentService.getReturnList();
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(returnList); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}
	
	@RequestMapping(value = "/admin_pickuplist.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_pickuplist() {
		List<PStateVO> pickupList = subscribePaymentService.pickupList();
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(pickupList); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}

		return str;
	}
	
	@RequestMapping(value = "/pickAccept.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> pickAccept(int state_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		int chk_num = 0;
		try {
		subscribePaymentService.pickAccept(state_num);
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
		}
		return retVal;
	}
	
	@RequestMapping(value = "/settleAccept.tz", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> settleAccept(int settlement_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		int chk_num = 0;
		try {
			subscribePaymentService.settleAccept(settlement_num);
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
		}
		return retVal;
	}
}
