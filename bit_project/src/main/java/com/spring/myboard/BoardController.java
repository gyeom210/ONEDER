package com.spring.myboard;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.community.CommentVO;

@RestController
public class BoardController {
	
	@Autowired(required = false)
	private ActiveService service;
	
	@PostMapping(value="/getAcHistory.my", produces="application/json;charset=UTF-8")
	public ActiveVO getAcHistory(String nickname) throws Exception {
		ActiveVO data = new ActiveVO();
		
		ActiveVO vo1 = null;
		ActiveVO vo2 = null;
		vo1 = service.getLastconnection(nickname);
		data.setLast_connection(vo1.getLast_connection());

		if(service.getBoardCount(nickname) == 0) {
			data.setRegist(null);
		} else {
			vo2 = service.getWriteDate(nickname);
			data.setRegist(vo2.getRegist());
		}


		data.setBoard_count(service.getBoardCount(nickname));
		data.setReview_count(service.getReviewCount(nickname));
		data.setComment_count(service.getRCommentCount(nickname));
		data.setScrap_count(service.getScrapCount(nickname));
		
		
		System.out.println(data.getBoard_count());
		System.out.println(data.getComment_count());
		System.out.println(data.getReview_count());
		System.out.println(data.getScrap_count());
		System.out.println(data.getLast_connection());
		System.out.println(data.getRegist());
		return data;
	}
	
	/* 자유게시판 */
	@PostMapping(value="/getboard1.my", produces="application/json;charset=UTF-8")
	public ArrayList<BoardVO> getboard1(BoardVO vo) throws Exception {
		ArrayList<BoardVO> data = new ArrayList<BoardVO>();
		try {
			data = service.getBoard1(vo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	/* 육아사진 */
	@PostMapping(value="/getboard2.my", produces="application/json;charset=UTF-8")
	public ArrayList<BoardVO> getboard2(BoardVO vo) throws Exception {
		ArrayList<BoardVO> data = new ArrayList<BoardVO>();
		try {
			data = service.getBoard1(vo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	/* 정보공유(팁) */
	@PostMapping(value="/getboard3.my", produces="application/json;charset=UTF-8")
	public ArrayList<BoardVO> getboard3(BoardVO vo) throws Exception {
		ArrayList<BoardVO> data = new ArrayList<BoardVO>();
		try {
			data = service.getBoard1(vo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	 /* 공구게시판 */
	@PostMapping(value="/getboard4.my", produces="application/json;charset=UTF-8")
	public ArrayList<BoardVO> getboard4(BoardVO vo) throws Exception {
		ArrayList<BoardVO> data = new ArrayList<BoardVO>();
		try {
			data = service.getBoard1(vo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	/* 육아관련질문 */
	@PostMapping(value="/getboard5.my", produces="application/json;charset=UTF-8")
	public ArrayList<BoardVO> getboard5(BoardVO vo) throws Exception {
		ArrayList<BoardVO> data = new ArrayList<BoardVO>();
		try {
			data = service.getBoard1(vo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	/* 이슈.토론 */
	@PostMapping(value="/getboard6.my", produces="application/json;charset=UTF-8")
	public ArrayList<BoardVO> getboard6(BoardVO vo) throws Exception {
		ArrayList<BoardVO> data = new ArrayList<BoardVO>();
		try {
			data = service.getBoard1(vo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	/* 댓글 */
	@PostMapping(value="/getboard7.my", produces="application/json;charset=UTF-8")
	public ArrayList<CommentVO> getComment(CommentVO vo) throws Exception {
		ArrayList<CommentVO> data = new ArrayList<CommentVO>();
		try {
			data = service.getComment(vo);	
			System.out.println("테스트 = " + data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	/* 후기 */
	@PostMapping(value="/getboard8.my", produces="application/json;charset=UTF-8")
	public ArrayList<MyReviewVO> getReview(MyReviewVO vo) throws Exception {
		ArrayList<MyReviewVO> data = new ArrayList<MyReviewVO>();
		try {
			data = service.getReview(vo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	
	
}
