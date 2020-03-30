package com.spring.mypage;


import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.payment.PaymentService;
import com.spring.payment.PaymentVO;
import com.spring.product.ProductShareVO;
import com.spring.product.PsharePlusWatingVO;
import com.spring.product.SettlementVO;
import com.spring.product.reviewjoinmemberVO;
import com.spring.tazo.ShareWatingListVO;
@RestController
public class MypageAjaxController {
	@Autowired(required = false)
	private MypageService service;
	
	@Autowired(required = false)
	private PaymentService paymentservice;

	@GetMapping(value = "/mypage_bookmark.my", produces = "application/json;charset=UTF-8")
	public List<BookmarkVO> getMyPageBookMark(String email) {
		System.out.println(email);
		List<BookmarkVO> booklist = null;
		try {
			booklist = service.getMyPageBookMark(email);
			System.out.println(booklist.size());
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return booklist;
	}
	@GetMapping(value = "/mypage_reservation.my", produces = "application/json;charset=UTF-8")
	public List<ReservationVO> getMyPageReservation(String email) {
		System.out.println(email);
		List<ReservationVO> reserlist = null;
		try {
			reserlist = service.getMyPageReservation(email);
			System.out.println(reserlist.size());
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return reserlist;
	}
	@GetMapping(value = "/mypage_wishlist.my", produces = "application/json;charset=UTF-8")
	public List<WishlistVO> getMyPageWishList(String email) {
		System.out.println(email);
		List<WishlistVO> wishlist = null;
		try {
			wishlist = service.getMyPageWishList(email);
			System.out.println(wishlist.size());
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return wishlist;
	}
	
	@GetMapping(value = "/mypage_share.my", produces = "application/json;charset=UTF-8")
	public List<ShareWatingListVO> getMyPageShare(String email, int page) {
		List<ShareWatingListVO> shareList = null;
		int limit = 5;
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		try {
			shareList = service.getMyPageShare(startrow, endrow, email);
			System.out.println(shareList.size());
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return shareList;
		
		
			
	}
	@GetMapping(value = "/mypage_share2.my", produces = "application/json;charset=UTF-8")
	public List<ProductShareVO> getMyPageShare2(String email, int page) {
		int limit = 5;
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		List<ProductShareVO> shareList = null;
		try {
			shareList = service.getMyPageShare2(startrow, endrow, email);
			System.out.println(shareList.size());
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return shareList;
	}
	@GetMapping(value = "/mypage_share_Detail.my", produces = "application/json;charset=UTF-8")
	public List<PsharePlusWatingVO> mypage_share_Detail(int share_num, int waiting_num) {
		List<PsharePlusWatingVO> pvo = null;
		try {
			pvo = service.getMyPageShareDetail(share_num, waiting_num);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return pvo;
	}
	
	//정산버튼 눌렀을 때
	@GetMapping(value = "/mypage_share_settle.my", produces = "application/json;charset=UTF-8")
	public void getMyPageShare2(String email, int settle, int share_num, String product_name) {
		try {
			SettlementVO sVO = new SettlementVO();
			sVO = service.getShareJoin(share_num, product_name);
			sVO.setAccumulated_fund(settle);
			System.out.println(sVO.getAccumulated_fund());
			service.addMyPageShareSettle(sVO);
			//product share에서 적립금 까야함
			service.updateShareJoin(share_num, settle);
			
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	}
	
	@PostMapping(value = "/mypage_subscribe_payment.my", produces = "application/json;charset=UTF-8")
	public ArrayList<PaymentVO> getMySubscribe(String email, int page) {
		ArrayList<PaymentVO> data = null;
		try {
			data = new ArrayList<PaymentVO> ();
			int limit = 5;
			int start = (page - 1) * 5 + 1;
			int end = start + limit - 1;
			data = paymentservice.selectSP(email, start, end);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}

		return data;
	}

	@PostMapping(value = "/myShareCount.my", produces = "application/json;charset=UTF-8")
	public HashMap<String, Object> myShareCount(String email) {
		int result_share = 0, result_sharehis = 0;
		System.out.println(email);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.clear();
		try {
			result_share = service.scount(email);
			result_sharehis = service.hcount(email);
			map.put("share", result_share);
			map.put("sharehis", result_sharehis);

		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}

		return map;
	}
	
	@PostMapping(value = "/mypage_subscribe_history.my", produces = "application/json;charset=UTF-8")
	public ArrayList<PStateVO> getMyHistory(String email, int page) {
		ArrayList<PStateVO> data = null;
		try {
			data = new ArrayList<PStateVO> ();
			int limit = 5;
			int start = (page - 1) * 5 + 1;
			int end = start + limit - 1;
			data = service.selectPS(email, start, end);
			System.out.println(data);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return data;
	}
	
	@PostMapping(value = "/mypage_subscribe_cancel.my", produces = "application/json;charset=UTF-8")
	public Map<String, Object> canSubscribe(String email) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = paymentservice.cancelSub(email);
			retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;

	}
	
	@PostMapping(value = "/mypage_subscribe_cancel2.my", produces = "application/json;charset=UTF-8")
	public Map<String, Object> canSubscribe2(String email) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = paymentservice.cancelSub2(email);
			retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;

	}
	
	@PostMapping(value = "/mypage_subscribe_change.my", produces = "application/json;charset=UTF-8")
	public Map<String, Object> subChange(String email, int subscribe_num, String grade) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		int price = 0;
			switch(grade) {
				case "실버" :
					price = 29000;
					break;
				case "골드" :
					price = 59000;
					break;
				case "플래티넘" :
					price = 79000;
					break;
			}
		
		try {
			int res = paymentservice.insertChange(subscribe_num, grade, price);
			retVal.put("res", "OK");  
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	@PostMapping(value = "/mypage_subscribe_changecancel.my", produces = "application/json;charset=UTF-8")
	public Map<String, Object> changeCancel(String email) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			paymentservice.deleteCancel(email);
			retVal.put("res", "OK");  
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}

	
}
