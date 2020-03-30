package com.spring.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PDService {
	// 1. 상품 페이지 관련 	
		// 상품등록
		public void prAdd(ProductVO pdVO) throws Exception;
		// 상품 수정
		public void prModify(ProductVO pdVO) throws Exception;
		//상품 삭제
		public void prDelete(int product_num) throws Exception;
		// 전체조회(쓸일없음)
		public List<ProductVO> allSearch() throws Exception;
		// 필터값이 null인 상태에서 스크롤 시 추가 데이터 8개 출력
		public List<ProductVO> scrollSearch(@Param("pno") int pno) throws Exception;	
		// 필터설정 후 조회하거나, 필터설정 후 스크롤 내릴 경우.
		public List<ProductVO> filterScroll(@Param("pno") int pno, @Param("cateMap1") HashMap<String, String> cateMap1, @Param("cateMap2") HashMap<String, String> cateMap2, @Param("cateMap3") HashMap<String, String> cateMap3, @Param("special") String special) throws Exception;
		//public List<ProductVO> filterSearch(@Param("category_l") String category_l, @Param("category_m") String category_m, @Param("category_s") String category_s) throws Exception;
		//public List<ProductVO> selectList(int pno, HashMap<String, String> cateMap1, HashMap<String, String> cateMap2, HashMap<String, String> cateMap3) throws Exception;
		// 수량 체크
		public int amountCheck(@Param("product_num") int product_num) throws Exception;
		public List<AlarmVO> SMSalarm(@Param("product_num") int product_num) throws Exception;
		
	// 2. 상품 상세 페이지 관련 
		// 상품 클릭 시 해당 상품 데이터 받아서 상세페이지에 띄워줌
		public ProductVO getProductDetail(@Param("product_num") int product_num) throws Exception;
		// 상품 클릭 시 조회수 + 1
		public void getProductReadCount(@Param("readcount") int readcount, @Param("product_num") int product_num) throws Exception;
		// 찜 여부
		public int getBookMark(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 찜 on
		public void addBookMark(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 찜 off
		public void deleteBookMark(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 위시리스트 여부
		public int getWishList(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 위시리스트 on
		public void addWishList(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 위시리스트 off
		public void deleteWishList(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 예약 여부
		public int getReservation(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 예약 on
		public void addReservation(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 예약 off
		public void deleteReservation(@Param("product_num") int product_num, @Param("email") String email) throws Exception;
		// 알람 여부
		public int getAlarm(@Param("email") String email, @Param("product_num") int product_num, @Param("phone") String phone) throws Exception;
		// 알람 여부 v2
		public int getAlarm2(@Param("email") String email, @Param("product_num") int product_num) throws Exception;
		// 알람 등록
		public void addAlarm(@Param("email") String email, @Param("product_num") int product_num, @Param("phone") String phone) throws Exception;
		// 알람 삭제
		public void deleteAlarm(@Param("email") String email, @Param("product_num") int product_num, @Param("phone") String phone) throws Exception;
		// 구독 등급 체크. 위시리스트나 예약 시 권한 부여
		public String getMemberSubsState(@Param("email") String email) throws Exception;
		
		
	// 3. 상세 페이지 상품 문의
		// 페이징 처리
		public List<QnaVO> qnaSearch(@Param("startPage") int startPage,@Param("endPage") int endPage, @Param("product_num") int product_num) throws Exception;
		// qna 답변 가져오기
		public List<QnaAnsVO> qnaAnsSearch(@Param("question_num") int question_num) throws Exception;
		// 등록된 문의 개수 출력
		public int qnaCount(@Param("product_num") int product_num) throws Exception;
		// 문의 등록
		public void qnaWrite(QnaVO qnaVO) throws Exception;
		// 문의 삭제
		public void qnaDelete(@Param("question_num") int question_num, @Param("product_num") int product_num) throws Exception;
		// 문의 수정
		public void qnaModify(QnaVO qnaVO) throws Exception;
		// 문의 비공개 작성자 체크
		public String qnaemailchk(@Param("email") String email) throws Exception;
	// 4. 상세 페이지 상품 리뷰
		// 페이징 처리
		public List<reviewjoinmemberVO> reviewSearch(@Param("startPage") int startPage,@Param("endPage") int endPage, @Param("product_num") int product_num) throws Exception;
		// 등록된 리뷰 개수 출력
		public int reviewCount(@Param("product_num") int product_num) throws Exception;
		// 리뷰 등록
		public void reviewWrite(ReviewVO reviewVO) throws Exception;
		// 리뷰 삭제
		public void reviewDelete(@Param("review_num") int review_num, @Param("product_num") int product_num) throws Exception;
		// 리뷰 수정(이미지 수정까지)
		public void reviewModify(ReviewVO reviewVO) throws Exception;
		// 리뷰 수정(이미지는 안건드린 상태면, 기존 이미지 그대로
		public void reviewModifyNoImg(ReviewVO reviewVO) throws Exception;
		// 리뷰 포인트 지급
		public int addPoint(@Param("email") String email) throws Exception;
		// 리뷰 지급 후 reviewVO의 point_Details 값 1로 변경
		public void pointDetail(@Param("email") String email, @Param("product_num") int product_num) throws Exception;
		// 리뷰 평점 수정
		public void reviewGpa(@Param("product_num") int product_num) throws Exception;
		// 리뷰는 상품당 하나요~!
		public int reviewoverflow(@Param("email") String email, @Param("product_num") int product_num) throws Exception;
		
		
	// 5. 상품 검색
		public int productListGetCount(@Param("search_type") String search_type, @Param("search_word") String search_word) throws Exception;
	    public List<ProductVO> selectProductList(@Param("search_type") String search_type, @Param("search_word") String search_word, @Param("pno") int pno) throws Exception;
	    
	// 6. 개인 쉐어 상품 등록 부분
	    public int getPnum() throws Exception;
	    public void shareState(int share_state, int waiting_num) throws Exception;
	    public void shareAdd(ProductShareVO psVO) throws Exception;
	    
	// 7. 관리자
	    public void ansWrite(QnaAnsVO qvo) throws Exception;
}
