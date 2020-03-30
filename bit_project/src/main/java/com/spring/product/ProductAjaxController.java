package com.spring.product;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.nurigo.java_sdk.api.Message;

@RestController
public class ProductAjaxController {

	@Autowired(required = false)
	private PDService service;
	
	
	/********************** 북마크, 위시리스트, 예약, 입고알림 시작 **********************/
	@PostMapping(value = "/addbookmark.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> addbookmark(int product_num, String email) {
		HashMap<String,String> addbookMessage = new HashMap<String,String>();
		try {
			service.addBookMark(product_num,email);
			addbookMessage.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addbookMessage;
	}
	@PostMapping(value = "/deletebookmark.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> deletebookmark(int product_num, String email) {
		HashMap<String,String> deletebookMessage = new HashMap<String,String>();
		try {
			service.deleteBookMark(product_num,email);
			deletebookMessage.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deletebookMessage;
	}
	
	@PostMapping(value = "/addwishlist.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> addwishlist(int product_num, String email) {
		HashMap<String,String> addwishMessage = new HashMap<String,String>();
		try {
			service.addWishList(product_num, email);
			addwishMessage.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addwishMessage;
	}
	@PostMapping(value = "/deletewishlist.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> deletewishlist(int product_num, String email) {
		HashMap<String,String> deletewishMessage = new HashMap<String,String>();
		try {
			service.deleteWishList(product_num, email);
			deletewishMessage.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deletewishMessage;
	}
	
	@PostMapping(value = "/addreservation.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> addreservation(int product_num, String email) {
		HashMap<String,String> addreserMessage = new HashMap<String,String>();
		try {
			service.addReservation(product_num, email);
			addreserMessage.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addreserMessage;
	}
	@PostMapping(value = "/deletereservation.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> deletereservation(int product_num, String email) {
		HashMap<String,String> deletereserMessage = new HashMap<String,String>();
		try {
			service.deleteReservation(product_num, email);
			deletereserMessage.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deletereserMessage;
	}
	@GetMapping(value = "/alarmCheck.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> amount_alarm(String alert_email, int alert_pnum, String alert_phone) {
		//String email = alert_email;
		//String email_cut = email.replace("%40", "@");

		HashMap<String,String> alarmList = new HashMap<String,String>();
		try {
			int res =service.getAlarm(alert_email, alert_pnum, alert_phone);
			if(res==0) {
				alarmList.put("val", "no");	
			}else {
				alarmList.put("val", "kookoo");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alarmList;
	}
	
	@GetMapping(value = "/addalarm.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> addalarm(String alert_email, int alert_pnum, String alert_phone) {
		//String email = alert_email;
		//String email_cut = email.replace("%40", "@");
		HashMap<String,String> alarmList = new HashMap<String,String>();
		try {
			service.addAlarm(alert_email, alert_pnum, alert_phone);
			alarmList.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alarmList;
	}
	
	@GetMapping(value = "/deletealarm.pr", produces = "application/json;charset=UTF-8")
	public HashMap<String, String> deletealarm(String alert_email, int alert_pnum, String alert_phone) {
		HashMap<String,String> alarmList = new HashMap<String,String>();
		try {
			service.deleteAlarm(alert_email, alert_pnum, alert_phone);
			alarmList.put("val", "kookoo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alarmList;
	}
	
	
	/********************** 북마크, 위시리스트, 예약, 입고알림 종료 **********************/
	
	
	/********************** 상품 검색 시작 **********************/
	@PostMapping(value = "/selectProductList.pr", produces = "application/json;charset=UTF-8")
	   public List<ProductVO> selectProductList(String search_type, String search_word, int pno) {
	      List<ProductVO> list = null;
	      try {
	         list = service.selectProductList(search_type, search_word, pno);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	/********************** 상품 검색 종료 **********************/
	
	/********************** 상품 필터&스크롤 시작 **********************/
	@PostMapping(value = "/filterSearch.pr", produces = "application/json;charset=UTF-8")
	public List<ProductVO> filterSearch(int pno, String[] category_l, String[] category_m, String[] category_s, String special) {
		HashMap<String, String> cateMap1 = new HashMap<String, String>();
		HashMap<String, String> cateMap2 = new HashMap<String, String>();
		HashMap<String, String> cateMap3 = new HashMap<String, String>();
		cateMap1.clear();
		cateMap2.clear();
		cateMap3.clear();
		List<ProductVO> list = null;
		if(special.equals("")) {
			special = null;
		}
		try {
			if (category_l == null && category_m == null && category_s == null && special == null) {
				//list = service.startSearch();
				list = service.scrollSearch(pno);
			} else {
				// 문자열 끝만 지우기string=string.substring(0, string.length()-1);
				if (category_l != null) {
					for (int i = 0; i < category_l.length; i++) {
						if (i == 0) {
							category_l[i] = category_l[i].substring(9);
						}
							if (category_l[i].equals("실버")) {
								cateMap1.put("실버", "category_l");
							} else if (category_l[i].equals("골드")) {
								cateMap1.put("골드", "category_l");
							} else if (category_l[i].equals("플레티넘")) {
								cateMap1.put("플레티넘", "category_l");
							} else if (category_l[i].equals("개인쉐어")) {
								cateMap1.put("개인쉐어", "category_l");
							}
					}
				}
				if (category_m != null) {
					for (int i = 0; i < category_m.length; i++) {
						if (i == 0) {
							category_m[i] = category_m[i].substring(9);
						} 
							if (category_m[i].equals("04")) {
								cateMap2.put("04", "category_m");
							} else if (category_m[i].equals("57")) {
								cateMap2.put("57", "category_m");
							}
						
					}
				}
				if (category_s != null) {
					for (int i = 0; i < category_s.length; i++) {
						if (i == 0) {
							category_s[i] = category_s[i].substring(9);
						}
							if (category_s[i].equals("장난감")) {
								cateMap3.put("장난감", "category_s");
							} else if (category_s[i].equals("나무 장난감")) {
								cateMap3.put("나무 장난감", "category_s");
							} else if (category_s[i].equals("역할놀이")) {
								cateMap3.put("역할놀이", "category_s");
							} else if (category_s[i].equals("놀이")) {
								cateMap3.put("놀이", "category_s");
							} else if (category_s[i].equals("기타")) {
								cateMap3.put("기타", "category_s");
							}
					}
				}
				list = service.filterScroll(pno, cateMap1, cateMap2, cateMap3, special);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return list;
	}
	/********************** 상품 필터&스크롤 종료 **********************/
	
	/********************** 상품문의, 리뷰 시작 **********************/
	@PostMapping(value = "/qna.pr", produces = "application/json;charset=UTF-8")
	public List<QnaVO> qnaSearch(int page, int product_num) {
		List<QnaVO> list = null;
		int limit = 10;
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		try {
			list = service.qnaSearch(startrow, endrow, product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@PostMapping(value = "/qna2.pr", produces = "application/json;charset=UTF-8")
	public List<QnaAnsVO> qnaSearch2(int question_num) {
		List<QnaAnsVO> list = null;
		try {
			list = service.qnaAnsSearch(question_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@PostMapping(value = "/qnacount.pr", produces = "application/json;charset=UTF-8")
	public int qnatotalcount(int product_num) {	
		int res=0;
		try {
			res = service.qnaCount(product_num);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return res;
	}
	@PostMapping(value = "/qnadelete.pr", produces = "application/json;charset=UTF-8")
	public int qnadelete(int question_num, int product_num) {
		int res = 0;
		try {
			service.qnaDelete(question_num, product_num);
			res = 1;
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return res;
	}
	
	@PostMapping(value = "/qnaemailchk.pr", produces = "application/json;charset=UTF-8")
	public String qnaemailchk(String email) {
		String emailChk = null;
		String str = null;
		try {
			emailChk = service.qnaemailchk(email);
			System.out.println(emailChk);
			ObjectMapper mapper = new ObjectMapper();
			try {
				str = mapper.writeValueAsString(emailChk); // writeValueAsString -> list객체를 json형식으로 바꿔줌.
			} catch (Exception e) {
				System.out.println("first() mapper : " + e.getMessage());
			}

		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return str;
	}
	@PostMapping(value = "/ansWrite.pr", produces = "application/json;charset=UTF-8")
	public int ansWrite(QnaAnsVO qvo) {
		try {
			service.ansWrite(qvo);
			//qna 답변상태 바꿔야함
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return 1;
	}
	
	@PostMapping(value = "/reviewcount.pr", produces = "application/json;charset=UTF-8")
	public int reviewtotalcount(int product_num) {	
		int res=0;
		try {
			res = service.reviewCount(product_num);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return res;
	}
	@PostMapping(value = "/review.pr", produces = "application/json;charset=UTF-8")
	public List<reviewjoinmemberVO> reviewSearch(int page, int product_num) {
		List<reviewjoinmemberVO> list = null;
		int limit = 5;
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		try {
			list = service.reviewSearch(startrow, endrow, product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@PostMapping(value = "/reviewdelete.pr", produces = "application/json;charset=UTF-8")
	public int reviewdelete(int review_num, int product_num) {
		int res = 0;
		try {
			service.reviewDelete(review_num, product_num);
			service.reviewGpa(product_num);
			res = 1;
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return res;
	}
	@GetMapping(value = "/Addpoint.pr", produces = "application/json;charset=UTF-8")
	public int Addpoint(String email, String nickname, int product_num) {
		int res = 0;
		try {
			res = service.addPoint(email);
			service.pointDetail(email, product_num);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return res;
	}
	@PostMapping(value = "/reviewoverflow.pr", produces = "application/json;charset=UTF-8")
	public int reviewoverflow(String email, int product_num) {
		int res = 0;
		try {
			res = service.reviewoverflow(email, product_num);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return res;
	}
	
	/********************** 상품문의, 리뷰 종료 **********************/
}
