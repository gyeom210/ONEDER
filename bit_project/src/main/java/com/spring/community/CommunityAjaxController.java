package com.spring.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.login.LoginService;
import com.spring.login.LoginVO;

@RestController
public class CommunityAjaxController {

	@Autowired(required = false)
	private CommunityService communityService;
	
	@Autowired(required = false)
	private LoginService service;
	
	//카테고리 선택 후 게시글 조회
	
	@PostMapping(value="/getCM.co", produces="application/json;charset=UTF-8")
	public List<CommunityVO> getCM(String category, String option) {
		List<CommunityVO> list = null;
		
		if(option.equals("최신순")) {
			list = communityService.filter1(category);
		} else if(option.equals("조회순")) {
			list = communityService.filter2(category);
		}else { //댓글순
			list = communityService.filter3(category);
		}
		
		return list;
	}
	
//	@PostMapping(value="/getCM.co", produces="application/json;charset=UTF-8")
//	public List<CommunityVO> getCM(int page, String category, String option) {
//		List<CommunityVO> list = null;
//		int limit = 0;
//		int start = 0;
//		int end = 0;
//		
//		if(category.equals("육아사진")) {
//			limit = 9;
//			start = (page - 1) * 9 + 1;
//			end = start + limit - 1;
//		}
//		else {
//			limit = 5;
//			start = (page - 1) * 5 + 1;
//			end = start + limit - 1;
//		}
//		System.out.println("컨트롤러부분 옵션값 : " + option + "카테고리 : " +category + " page: " +start + end);
//		
//		if(option.equals("최신순")) {
//			list = communityService.filter1(category, start, end);
//		} else if(option.equals("조회순")) {
//			list = communityService.filter2(category, start, end);
//		}else { //댓글순
//			list = communityService.filter3(category, start, end);
//		}
//		
//		return list;
//	}
	
	//검색
	@PostMapping(value="/getCMsearch.co", produces="application/json;charset=UTF-8")
	public List<CommunityVO> getCMsearch(String search_Data, String category) {
		List<CommunityVO> search_list = null;
		search_list = communityService.getCMsearch(search_Data, category);
		
		return search_list;
	}
	
//	@PostMapping(value="/getCMsearch.co", produces="application/json;charset=UTF-8")
//	public List<CommunityVO> getCMsearch(String search_Data, String category, int page) {
//		List<CommunityVO> search_list = null;
//		System.out.println("search_data : " + search_Data + " c : " + category + " page : " + page);
//		int limit = 0;
//		int start = 0;
//		int end = 0;
//		
//		if(category.equals("육아사진")) {
//			limit = 9;
//			start = (page - 1) * 9 + 1;
//			end = start + limit - 1;
//		}
//		else {
//			limit = 5;
//			start = (page - 1) * 5 + 1;
//			end = start + limit - 1;
//		}
//		
//		search_list = communityService.getCMsearch(search_Data, category, start, end);
//		System.out.println("Controller 출력 : " + search_list);
//		return search_list;
//	}
	
	//닉네임검색
	@PostMapping(value="/getuserSearch.co", produces="application/json;charset=UTF-8")
	public List<CommunityVO> getuserSearch(String nickname) {
		List<CommunityVO> getuserSearch = null;
		getuserSearch = communityService.getuserSearch(nickname);
		
		return getuserSearch;
	}
//	
//	@PostMapping(value="/getuserSearch.co", produces="application/json;charset=UTF-8")
//	public List<CommunityVO> getuserSearch(String nickname, int page) {
//		List<CommunityVO> getuserSearch = null;
//		
//		int limit = 5;
//		int start = (page - 1) * 5 + 1;
//		int end = start + limit - 1;
//		
//		System.out.println("nickname : " + nickname + "start , end : " + start + end);
//		getuserSearch = communityService.getuserSearch(nickname, start, end);
//		
//		System.out.println("Controller 출력 : " + getuserSearch);
//		return getuserSearch;
//	}
	
	//게시판 댓글 보여주기
	@PostMapping(value="/getCO.co", produces="application/json;charset=UTF-8")
	public List<CommentVO> getCO(int board_num) {
		List<CommentVO> list = communityService.getCO(board_num);
		System.out.println(board_num);
		return list;
	}
	
//	@PostMapping(value="/getCO.co", produces="application/json;charset=UTF-8")
//	public List<CommentVO> getCO(int board_num, int page) {
//		int limit = 5;
//		int start = (page - 1) * 5 + 1;
//		int end = start + limit - 1;
//
//		List<CommentVO> list = communityService.getCO(board_num, start, end);
//		List<CommentVO> list = communityService.getCO(board_num);
//		return list;
//	}
	
	//스크랩
	@PostMapping(value="/updateScrap.co", produces="application/json;charset=UTF-8")
	public Map<String, Object> updateScrap(int board_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = communityService.updateScrap(board_num);
			retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	//댓글 작성
	@PostMapping(value="/writeCO.co", produces="application/json;charset=UTF-8")
	public Map<String, Object> writeCO(CommentVO covo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = communityService.writeCO(covo);
			retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	//댓글 수정
	@PostMapping(value="/updateCO.co", produces="application/json;charset=UTF-8")
	public Map<String, Object> updateCO(int comment_num, String content) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		 
		try {
			int res = communityService.updateCO(comment_num, content);
			retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	//댓글 삭제
		@PostMapping(value="/deleteCO.co", produces="application/json;charset=UTF-8")
		public Map<String, Object> deleteCO(@RequestParam(value="comment_num", required=false, defaultValue="1") int comment_num) {
			Map<String, Object> retVal = new HashMap<String, Object>();
			
			try {
				int res = communityService.deleteCO(comment_num);
				retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

			} catch (Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}
			return retVal;
		}
	
		//대댓글 작성
		@PostMapping(value="/writeAnswer.co", produces="application/json;charset=UTF-8")
		public Map<String, Object> writeAnswer(AnswerVO answervo) {
			Map<String, Object> retVal = new HashMap<String, Object>();
			
			try {
				int res = communityService.writeAnswer(answervo);
				retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

			} catch (Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}
			return retVal;
		}
		
		//대댓글 보여주기
		@PostMapping(value="/getAnswer.co", produces="application/json;charset=UTF-8")
		public List<AnswerVO> getAnswer(int comment_num) {
			List<AnswerVO> list = communityService.getAnswer(comment_num);
			
			return list;
		}
		
		//대댓글 프로필 사진가져오기
		@PostMapping(value="/getuserImg.co", produces="application/json;charset=UTF-8")
		public String getuserImg(String email) throws Exception {
			System.out.println(email);
			LoginVO dbvo = null;
			
			dbvo = service.getDetail(email);
			System.out.println(dbvo.getNickname());
			String img = dbvo.getImg();
			System.out.println(dbvo.getImg());
				
			return img;
		}
		
		//대댓 수정
		@PostMapping(value="/updateAnswer.co", produces="application/json;charset=UTF-8")
		public Map<String, Object> updateAnswer(int answer_num, String content) {
			Map<String, Object> retVal = new HashMap<String, Object>();
			 
			try {
				int res = communityService.updateAnswer(answer_num, content);
				retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

			} catch (Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}
			return retVal;
		}
		
		//대댓글 삭제
		@PostMapping(value="/deleteAnswer.co", produces="application/json;charset=UTF-8")
		public Map<String, Object> deleteAnswer(@RequestParam(value="answer_num", required=false, defaultValue="1") int answer_num) {
			Map<String, Object> retVal = new HashMap<String, Object>();
			
			try {
				int res = communityService.deleteAnswer(answer_num);
				retVal.put("res", "OK");   //맵객체 "res"는 키 , "OK" 값  

			} catch (Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}
			return retVal;
		}

		
//	//카테고리 선택 후 페이징(기본값=자유게시판)
//	@PostMapping(value = "/getCommunityCount.co", produces="application/json;charset=UTF-8")
//    public int getCommunityCount(String category) throws Exception {
//		int res = 0;
//		try {
//			res = communityService.getCommunityCount(category);
//			System.out.println("총 게시글 수 : " + res);
//			return res;
//		} catch (Exception e) {
//			e.getMessage();
//		}
//        return res;
//    }
	
//	//필터 선택 후 페이징
//	@PostMapping(value = "/getCommunityfilter.co", produces="application/json;charset=UTF-8")
//	    public List<CommunityVO> getCommunityfilter(String category, String option){
//			List<CommunityVO> list = null;
//			// 최신순은 regist정렬
//			// 조회순은 count정렬
//			// 스크랩순은 scrap_count정렬
//			int listcount = 0;
//			int limit = 5;
//			int start = (1 - 1) * 5 + 1;
//			int end = start + limit - 1;
//			
//			System.out.println("컨트롤러부분 옵션값 : " +option);
//			
//			if(option.equals("최신순")) {
//				list = communityService.filter1(category, start, end);
//			} else if(option.equals("조회순")) {
//				list = communityService.filter2(category, start, end);
//			}else {
//				list = communityService.filter3(category, start, end);
//			}
//			
//			return list;
//	    }
	
	
}
