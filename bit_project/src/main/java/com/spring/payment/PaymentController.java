package com.spring.payment;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.request.ScheduleData;
import com.siot.IamportRestClient.request.ScheduleEntry;
import com.siot.IamportRestClient.request.UnscheduleData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Schedule;
import com.spring.member.MemberVO;

@Controller
public class PaymentController {

	private IamportClient client;

	@Autowired(required = false)
	public void setup() {
		String api_key = "6309798726474324";
		String api_secret = "mDbo9qHQOKOwHGhVmJHP2Xhw2Hyzyf7VSij2I1SwLG3tmkpJ47y74QE7ycH6rO2k6lmPmfl8VoBiJ12O";
		client = new IamportClient(api_key, api_secret);
	}

	@Autowired(required = false)
	private PaymentService paymentService;

	
	//관리자 결제 페이지 예약대기 불러오기
	@RequestMapping(value= "/subscribemember.su", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public ArrayList<PMemberVO> subscribeMember(HttpServletRequest request) throws Exception {
		ArrayList<PMemberVO> data = new ArrayList<PMemberVO> (); //데이터 받을 객체
		try {
			String state = "예약대기";
			data = paymentService.allSubscribe(state);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return data; //리스트 반환
	}
	
	//관리자 결제 페이지 예약완료 불러오기
	@RequestMapping(value="/paymember.su", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<PMemberVO> payMember(HttpServletRequest request) throws Exception {
		ArrayList<PMemberVO> data = new ArrayList<PMemberVO> ();
		try {
			String state = "예약완료";
			data = paymentService.allSubscribe(state);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return data;
	}
	
	//관리자 결제 페이지 결제완료 불러오기
		@RequestMapping(value="/paidhistory.su", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<PMemberVO> paidHistory(HttpServletRequest request) throws Exception {
			ArrayList<PMemberVO> data = new ArrayList<PMemberVO> ();
			try {
				String state = "결제완료";
				data = paymentService.allSubscribe(state);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return data;
		}
		 

	/* 구독결제자 정보 */
	@RequestMapping(value = "/selectSubscription.su", method = RequestMethod.POST)
	public String selectSubscription(@RequestParam("group1") String grade, HttpSession session,
			HttpServletRequest request, Model model) throws Exception {
		
		if (grade.equals("silver")) {
			model.addAttribute("price", 29000);
		} else if (grade.equals("gold")) {
			model.addAttribute("price", 59000);
		} else if (grade.equals("platinum")) {
			model.addAttribute("price", 79000);
		} else if (grade.equals("1month")) {
			model.addAttribute("price", 34000);
		} else if (grade.equals("2month")) {
			model.addAttribute("price", 68000);
		}
		
		String email = (String) session.getAttribute("email");
		MemberVO result = paymentService.getUserInfo(email);
		model.addAttribute("membervo", result);
		model.addAttribute("grade", grade);
		return "subscribestep2";
	}

	/* 결제 내역 확인 */
	@RequestMapping(value = "/confirmSubscription.su", method = RequestMethod.POST)
	public String subscribestep1(HttpSession session, Model model) {

		return "subscribestep2";
	}

	/* 빌링키 발급 후 DB에 정보저장 */
	@RequestMapping(value = "/insertSP.su", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, String> insertSP(PaymentVO paymentvo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		SubscriptionVO vo = new SubscriptionVO(); //Subscribe테이블 정보
		
		int price = paymentvo.getPrice();
		String imp_uid = paymentvo.getImp_uid();
		String merchant_uid = paymentvo.getMerchant_uid();
		String email = request.getParameter("email");
		String grade = null;
		int count = 0;
		
		System.out.println("빌링키 정보 : " + price + ", " + imp_uid + ", " + merchant_uid + ", " + email);
		
		switch(price) {
			case 29000 : grade = "실버";
						 count = 1; //반납가능 횟수
						 break;
			case 59000 : grade = "골드";
						 count = 2;
						 break;
			case 79000 : grade = "플래티넘";
						 count = 2;
						 break;
			case 34000 : grade = "비정기"; 
						 count = 0;
						 break;
			case 68000 : grade = "비정기";
						 count = 0;
						 break;
		}
		
		// DB에 결제내역 저장
		try {
			// 멤버 테이블 subscribe 컬럼 값 'Y'로 변경
			int res1 = paymentService.updateMemberColumn(email);
			if(res1 != 0) {
				System.out.println("멤버테이블 구독 변경 성공");
			} else {
				System.out.println("멤버테이블 구독 변경 실패");
			}
			
			int check = 0;
			check = paymentService.checkSubCancel(email);
			if(check == 0) {
				// 구독정보 저장
				vo.setEmail(email);
				vo.setGrade(grade);
				vo.setCount(count);
				int res2 = paymentService.insertSubscribe(vo);
					if(res2 != 0) {
						System.out.println("구독등록 성공");
					} else {
						System.out.println("구독등록 실패");
					}
			} else {
				paymentService.updateRestate(email); 
			}
			
			// 구독번호 가져오기
			SubscriptionVO subvo = paymentService.getSubscribe(email);
			int subscribe_num = subvo.getSubscribe_num();
			
			// 받아온 구독번호로 구독결제정보 저장
			paymentvo.setSubscribe_num(subscribe_num);
			
			int res3 = paymentService.insertPayment(paymentvo);
			if(res3 != 0) {
				System.out.println("구독결제 등록 성공");
			} else {
				System.out.println("구도결제 등록 실패");
			}
			
			map.put("res", "OK");
		} catch(Exception e) {
			e.printStackTrace();
			map.put("res", "False");
		}

		return map; //성공여부 map에 저장
	}

	@RequestMapping(value = "/subscribestep3.me")
	public String subscribestep3(Model model, HttpServletRequest request) {

		return "subscribestep3";
	}

	// 결제예약 신청
	@RequestMapping(value = "/schedulepayment.su", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, String> schedulepayment(PaymentVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HashMap<String, String> map = new HashMap<String, String>(); //성공/실패 결과
		String state = "예약대기";
		ArrayList<PMemberVO> member = paymentService.allSubscribe(state); //결제할 사용자 목록
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date time = new Date();
		String today = format.format(time);
		
		String beforeDate = request.getParameter("date");
		String[] date = beforeDate.split("/");	
		System.out.println(today);
		System.out.println(beforeDate);
		//예약날짜가 오늘보다 이전인지 확인
		Date day1 = format.parse(today);
		Date day2 = format.parse(beforeDate);
		System.out.println(day1);
		System.out.println(day2);		
		
		//결제일 설정 (datepicker로 받아온 날의 오전 10시에 결제)
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, Integer.parseInt(date[2]));
		cal.set(Calendar.MONTH, Integer.parseInt(date[0])-1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date[1]));
		cal.set(Calendar.HOUR_OF_DAY, 10);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		Date d1 = cal.getTime();
		
		int pay_price = 0;
		
		//merchant_uid 중요 (customer_uid, merchant_uid는 모든 사람이 달라야 한다, merchant_uid는 빌링키 발급받을 때 사용했던 값 사용못한다.)
		String merchant_uid = "merchant_";
		String[] before = null;
		String customer_uid = null;
		//결제일, merchant_uid, amount 설정 
		ScheduleData schedule_data = null;
		String regrade = "";
		
		try {
		//결제할 사용자 목록으로 예약 (customer_uid 만들기)
		for(int i = 0; i < member.size(); i++) {
			PMemberVO user = member.get(i);

			before = user.getEmail().split("@");
			//customer_uid 설정
			customer_uid = before[0] + before[1];
			
			if(!(user.getState().equals("구독취소"))) { 
			//pay_price 설정
			int ch = paymentService.checkCgrade(user.getEmail());
			if(ch != 0) {
				regrade = paymentService.getCgrade(user.getEmail());
				switch(regrade) {
				case "실버" :
					pay_price = 29000;
					break;
				case "골드" :
					pay_price = 59000;
					break;
				case "플래티넘" : 
					pay_price = 79000;
					break;
				}
				int ch2 = paymentService.updateSgrade(user.getEmail(), regrade);
				if(ch2 != 0) {
					System.out.println(customer_uid + "의 구독등급 변경 성공");
					paymentService.deleteCancel(user.getEmail());
					System.out.println(customer_uid + "의 변경내역 삭제 성공");
				} else {
					System.out.println(customer_uid + "의 구독등급 변경 실패");
				}
			} else {
				pay_price = user.getPrice() + user.getPoint_price();
			}
			
			//merchant_uid 생성할 난수 생성
			for(int j = 0; j < 15; j++) {
			    double dValue = Math.random();
			    int iValue = (int)(dValue * 10);
			    merchant_uid += Integer.toString(iValue);
			}
			System.out.println("customer_uid : " + customer_uid);
			System.out.println("merchant_uid : " + merchant_uid);
			
			//스케줄 생성
			schedule_data = new ScheduleData(customer_uid);
			schedule_data.addSchedule(new ScheduleEntry(merchant_uid, d1, BigDecimal.valueOf(pay_price)));
			
			//예약요청
			IamportResponse<List<Schedule>> schedule_response = client.subscribeSchedule(schedule_data);
			String message = schedule_response.getMessage();
			int code = schedule_response.getCode();
			System.out.println(customer_uid + "의 예약요청 결과 : " + message + ", " + code);	
			
			//DB state, pay_price, merchant_uid 수정 (지금 저장된 merchant_uid로 예약 취소 가능)
			vo.setSubscribe_num(user.getSubscribe_num());
			vo.setPay_price(pay_price);
			vo.setMerchant_uid(merchant_uid);
			
			int res = paymentService.updatePayState(vo);
			merchant_uid = "merchant_"; //merchant_uid 초기화
			} else {
				System.out.println(customer_uid + "은 구독취소했습니다.");
			}
		}
			map.put("res", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("res", "False");
		}
		return map;
	}

	// 결제예약 취소
	@RequestMapping(value = "/unschedulepayment.su", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, String> unschedulepayment(PaymentVO vo, HttpServletRequest request) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		String email = request.getParameter("email");
		String customer_uid = null;
		String merchant_uid = null;
		vo = paymentService.selectCancel(email);
		String[] before = email.split("@");
		customer_uid = before[0] + before[1];
		merchant_uid = vo.getMerchant_uid();
		
		try {
			System.out.println(customer_uid + "예약취소 신청");
			UnscheduleData unschedule_data = new UnscheduleData(customer_uid);
			unschedule_data.addMerchantUid(merchant_uid);
			
			IamportResponse<List<Schedule>> unschedule_response = client.unsubscribeSchedule(unschedule_data);
			String message = unschedule_response.getMessage();
			int code = unschedule_response.getCode();
			System.out.println(customer_uid + "의 예약취소 결과 : " + message + ", " + code);	
			
			//state값 예약대기로 변경
			vo.setPay_price(0);
			int res = paymentService.rePayState(vo);
			
			map.put("res", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("res", "False");
		}

		return map;
	}

	@RequestMapping(value = "/yong", produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public void callbbb(@RequestBody HashMap<String, String> map) {
	      int newPnum = 0, amount = 0, reser_chk = 0, pnum = 0;
	      boolean flag = true;
	      System.out.println(map.get("status"));
	      System.out.println(map.get("merchant_uid"));
	      System.out.println(map.get("imp_uid"));
	      String state = "예약완료";
	      try {
	         // Ch1. 예약완료 리스트 가져온다
	         PMemberVO data = paymentService.allSubscribe2(map.get("merchant_uid"), state);
	         // Ch2. 결제완료로 바꾼다 / 결제목록생성                                             
	         paymentService.paidState(data.getSubscribe_num());
	         String[] before = new String[2];
	         before = null;
	         PaymentVO pvo = new PaymentVO();
	         before = data.getEmail().split("@");
	         System.out.println("before(0) : " + before[0] + "before(1) : " + before[1]);
	         String customer_uid = null;
	         int price = 0;
	         String grade = paymentService.selectSgrade(data.getSubscribe_num()); //구독테이블에서 회원등급가져와서 결제금액 설정
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
				case "비정기" :
					price = 34000;
					break;
				}
	         
	         customer_uid = before[0] + before[1];
	         pvo.setCustomer_uid(customer_uid);
	         pvo.setSubscribe_num(data.getSubscribe_num());
	         pvo.setPrice(price);
	         pvo.setMerchant_uid("0");
	         pvo.setImp_uid("0");
	         int res = paymentService.insertPayment(pvo);
	         paymentService.updateSubs(data.getSubscribe_num());
	         
	         // 결제완료시 반납횟수 초기화
	         int count = 0;
	         String check = data.getGrade();
	         switch(check) {
	         	case "실버" :
	         		count = 1;
	         		break;
	         	case "골드" :
	         		count = 2;
	         		break;
	         	case "플래티넘" :
	         		count = 2;
	         		break;
	         	case "비정기" :
	         		count = 0;
	         		break;
	         }
	         paymentService.updateCount(count, data.getEmail());
	         System.out.println(customer_uid + "의 반납횟수 초기화");
	         
	         // 포인트 차감예정 -> 차감으로 수정
	         int point_check = data.getPoint_price();
	         if(point_check != 0) {
	        	 paymentService.updateMPstate(data.getEmail());
	        	 System.out.println(customer_uid + "의 차감예정 수정");
	         }
	         
	         if (res != 0) {
	            System.out.println(customer_uid + "의 다음결제 목록 생성 성공");
	         } else {
	            System.out.println(customer_uid + "의 다음결제 목록 생성 실패");
	         }

	         // 결제완료 구독완료
	         ArrayList<Integer> getRandomList = new ArrayList<Integer>();
	         getRandomList = null;
	         getRandomList = paymentService.getWishPnum(data.getEmail());
	         //getRandomList 이메일로 상품번호 가져옴.
	         if(getRandomList.size()==0) {
	        	 pnum = paymentService.adminSelectWish(data.getGrade());
	        	 paymentService.adminInsertWish(pnum, data.getEmail());
	        	 getRandomList = paymentService.getWishPnum(data.getEmail());
	         }
	         
	         
	         System.out.println(getRandomList.size());
	         while (flag==false || getRandomList.size()!=0) {
	            Collections.shuffle(getRandomList);
	            newPnum = getRandomList.get(0);
	            // newPnum으로 product에서 current_amount 체크 후 0보다 크면 진행
	               SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
	               Calendar cal = Calendar.getInstance();
	               String today = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
	                     + cal.get(Calendar.DAY_OF_MONTH);
	               Date date = formatter.parse(today); // 날짜 입력하는곳 .
	               int dayNum = cal.get(Calendar.DAY_OF_WEEK);
	               System.out.println("today = "+date);
	               System.out.println("dayNum = "+dayNum);
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
	               int result = 0;
	               result = paymentService.personalSharingCheck(newPnum);
	               
	               paymentService.insertProductState(data.getSubscribe_num(), newPnum, date);
	               // result==1 개인쉐어
	               if(result==1) {
	            	   paymentService.personalSharingFund(newPnum);
	               }
	               paymentService.updateProductAmount(newPnum);
	               paymentService.deleteWish(newPnum, data.getEmail());
	               getRandomList.remove(0);
	               flag = false;
	            
	         }

	         System.out.println("while 종료");

	         // delivery_date DATE,
	         // return_application DATE
	      } catch (Exception e) {
	         e.getMessage();
	         e.printStackTrace();
	      }


	   }


}
