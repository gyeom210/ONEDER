package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.product.AlarmVO;
import com.spring.product.ProductShareVO;
import com.spring.product.ProductVO;
import com.spring.product.QnaAnsVO;
import com.spring.product.QnaVO;
import com.spring.product.ReviewVO;
import com.spring.product.reviewjoinmemberVO;

public interface PDMapper {
	void prAdd(ProductVO pdVO);	//상품 등록
	void prModify(ProductVO pdVO); //상품 수정
	void prDelete1(@Param("product_num") int product_num);
	void prDelete2(@Param("product_num") int product_num);
	void prDelete3(@Param("product_num") int product_num);
	void prDelete4(@Param("product_num") int product_num);
	void prDelete5(@Param("product_num") int product_num);
	void prDelete6(@Param("product_num") int product_num);
	void prDelete7(@Param("product_num") int product_num);
	void prDelete8(@Param("product_num") int product_num);
	int getPnum(); //개인쉐어 상품 등록 떄 사용. 현재 product_num의 시퀀스 값 가져옴.
	void shareState(@Param("share_state") int share_state, @Param("waiting_num") int waiting_num);
	void shareAdd(ProductShareVO psVO);
	List<ProductVO> allSearch();//아직 쓰진 않지만 전체 검색
	
	//카테고리가 null일 경우. default 세팅	
	List<ProductVO> scrollSearch(@Param("pno") int pno);//카테고리 null일 경우 pno만 받아서 전체 출력
	
	//스크롤 내리면 카테고리 읽어온 뒤 파라미터로 받은 pno+1 ~ pno+8까지 데이터 추가
	List<ProductVO> filterScroll(@Param("pno") int pno, @Param("cateMap1") HashMap<String, String> cateMap1, @Param("cateMap2") HashMap<String, String> cateMap2, @Param("cateMap3") HashMap<String, String> cateMap3, @Param("special") String special);
	
	
	//카테고리 선택 후 적용 시 해당 카테고리 데이터 8개 출력
	//List<ProductVO> selectList(@Param("pno") int pno, @Param("cateMap1") HashMap<String, String> cateMap1, @Param("cateMap2") HashMap<String, String> cateMap2, @Param("cateMap3") HashMap<String, String> cateMap3);
	//List<ProductVO> filterSearch(@Param("category_l") String category_l, @Param("category_m") String category_m, @Param("category_s") String category_s);
	
	//상품 상세
	ProductVO getProductDetail(@Param("product_num") int product_num);
	//상품 상세 페이지 들어갈 때 조회수 + 1
	void getProductReadCount(@Param("readcount") int readcount, @Param("product_num") int product_num);
	//상품 상세 찜
	int getBookMark(@Param("product_num") int product_num, @Param("email") String email);
	void addBookMark(@Param("product_num") int product_num, @Param("email") String email);
	void deleteBookMark(@Param("product_num") int product_num, @Param("email") String email);
	//상품 상세 위시리스트
	int getWishListCount(@Param("email") String email);
	int getWishList(@Param("product_num") int product_num, @Param("email") String email);
	void addWishList(@Param("product_num") int product_num, @Param("email") String email);
	void deleteWishList(@Param("product_num") int product_num, @Param("email") String email);
	//상품 상세 예약
	int getReservation1(@Param("email") String email);
	int getReservation2(@Param("product_num") int product_num, @Param("email") String email);
	void addReservation(@Param("product_num") int product_num, @Param("email") String email);
	void deleteReservation(@Param("product_num") int product_num, @Param("email") String email);
	//상품 상세 알람
	int getAlarm(@Param("email") String email, @Param("product_num") int product_num, @Param("phone") String phone);
	int getAlarm2(@Param("email") String email, @Param("product_num") int product_num);
	void addAlarm(@Param("email") String email, @Param("product_num") int product_num, @Param("phone") String phone);
	void deleteAlarm(@Param("email") String email, @Param("product_num") int product_num, @Param("phone") String phone);
	//상품 상세 구독 등급
	int getMemberSubsState(@Param("email") String email);
	String getMemberSubsGrade(@Param("email") String email);
	
	//SMS 서비스 관련
	int amountCheck(@Param("product_num") int product_num);
	List<AlarmVO> SMSalarm(@Param("product_num") int product_num);
	
	//상품 문의
	List<QnaVO> qnaSearch(@Param("startPage") int startPage, @Param("endPage") int endPage, @Param("product_num") int product_num);
	List<QnaAnsVO> qnaAnsSearch(@Param("question_num") int question_num);
	
	int qnaCount(@Param("product_num") int product_num);
	void qnaWrite(QnaVO qnaVO) throws Exception;
	void qnaDelete(@Param("question_num") int question_num, @Param("product_num") int product_num);
	void qnaAnsDelete(@Param("question_num") int question_num);
	void qnaModify(QnaVO qnaVO);
	String qnaemailchk(@Param("email") String email);
	String qnaadminchk(@Param("email") String email);
	
	//상품 리뷰
	void reviewWrite(ReviewVO reviewVO) throws Exception;
	List<reviewjoinmemberVO> reviewSearch(@Param("startPage") int startPage, @Param("endPage") int endPage, @Param("product_num") int product_num);
	int reviewCount(@Param("product_num") int product_num);
	void reviewDelete(@Param("review_num") int review_num, @Param("product_num") int product_num);
	void reviewModify(ReviewVO reviewVO);
	void reviewModifyNoImg(ReviewVO reviewVO);
	int addPoint(@Param("email") String email);
	void pointDetail(@Param("email") String email, @Param("product_num") int product_num);
	void reviewGpa(@Param("product_num") int product_num);
	int reviewoverflow(@Param("email") String email, @Param("product_num") int product_num);
	//상품 검색
	int productListGetCount(@Param("search_type") String search_type, @Param("search_word") String search_word);
	List<ProductVO> selectProductList(@Param("search_type") String search_type, @Param("search_word") String search_word, @Param("pno") int pno);
	
	// 관리자
	void ansWrite(QnaAnsVO qvo);
	void ansState(@Param("question_num") int question_num);
}
