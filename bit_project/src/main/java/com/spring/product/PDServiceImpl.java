package com.spring.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PDMapper;

@Service
public class PDServiceImpl implements PDService {

	@Autowired
	SqlSession sqlSession;

	/********************** 상품리스트 페이지 시작 **********************/
	@Override
	public void prAdd(ProductVO pdVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.prAdd(pdVO);
		} catch (Exception e) {
			throw new Exception("상품등록 실패.", e);
		}
	}
	
	@Override
	public void prModify(ProductVO pdVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.prModify(pdVO);
		} catch (Exception e) {
			throw new Exception("상품수정 실패.", e);
		}
	}
	
	@Override
	public void prDelete(int product_num) throws Exception {
		try {
			
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.prDelete1(product_num);
			pdMapper.prDelete2(product_num);
			pdMapper.prDelete3(product_num);
			pdMapper.prDelete4(product_num);
			pdMapper.prDelete5(product_num);
			pdMapper.prDelete6(product_num);
			pdMapper.prDelete7(product_num);
			pdMapper.prDelete8(product_num);
		} catch (Exception e) {
			throw new Exception("상품삭제 실패.", e);
		}
	}

	@Override
	public int amountCheck(int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			int aChk = pdMapper.amountCheck(product_num);
			return aChk;
		} catch (Exception e) {
			throw new Exception("수량 체크 실패.", e);
		}
	}

	@Override
	public List<AlarmVO> SMSalarm(int product_num) throws Exception {
		try {
			List<AlarmVO> list = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			list = pdMapper.SMSalarm(product_num);
			return list;
		} catch (Exception e) {
			throw new Exception("입고 알림 SMS 전송 실패.", e);
		}
	}


	@Override
	public List<ProductVO> allSearch() throws Exception {
		try {
			List<ProductVO> productList = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			productList = pdMapper.allSearch();
			return productList;
		} catch (Exception e) {
			throw new Exception("전체상품조회 실패.", e);
		}
	}
	@Override
	public List<ProductVO> scrollSearch(int pno) throws Exception {
		try {
			List<ProductVO> productList = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			productList = pdMapper.scrollSearch(pno);
			return productList;
		} catch (Exception e) {
			throw new Exception("상품 데이터 추가 조회 실패.", e);
		}
	}
	@Override
	public List<ProductVO> filterScroll(int pno, HashMap<String, String> cateMap1, HashMap<String, String> cateMap2, HashMap<String, String> cateMap3, String special) throws Exception {
		try {
			System.out.println(cateMap1.size()+"\t"+cateMap2.size()+"\t"+cateMap3.size());
			List<ProductVO> list = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			list = pdMapper.filterScroll(pno, cateMap1, cateMap2, cateMap3, special);
			return list;
		} catch (Exception e) {
			throw new Exception("필터설정 후 스크롤 실패.", e);
		}
	}
	/********************** 상품리스트 페이지 종료 **********************/
	/*
	 * @Override public List<ProductVO> filterSearch(String category_l, String
	 * category_m, String category_s) throws Exception { try { List<ProductVO> list
	 * = null; PDMapper pdMapper = sqlSession.getMapper(PDMapper.class); list =
	 * pdMapper.filterSearch(category_l, category_m, category_s); return list; }
	 * catch (Exception e) { throw new Exception("필터 검색 실패.", e); }
	 * 
	 * }
	 */

	/*
	 * @Override public List<ProductVO> selectList(int pno, HashMap<String, String>
	 * cateMap1, HashMap<String, String> cateMap2, HashMap<String, String> cateMap3)
	 * throws Exception { try { List<ProductVO> list = null; PDMapper pdMapper =
	 * sqlSession.getMapper(PDMapper.class); list = pdMapper.selectList(pno,
	 * cateMap1, cateMap2, cateMap3); return list; } catch (Exception e) { throw new
	 * Exception("필터 검색 실패.", e); }
	 * 
	 * }
	 */
	
	
	
	/********************** 상품상세 페이지 시작 **********************/
	@Override
	public ProductVO getProductDetail(int product_num) throws Exception {
		try {
			ProductVO prVO = new ProductVO();
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			prVO = pdMapper.getProductDetail(product_num);
			return prVO;
		} catch (Exception e) {
			throw new Exception("상품상세 검색 실패.", e);
		}
	}
	@Override
	public void getProductReadCount(int readcount, int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.getProductReadCount(readcount, product_num);
		} catch (Exception e) {
			throw new Exception("상품상세 조회수 증가 실패.", e);
		}
	}
	
	@Override
	public String getMemberSubsState(String email) throws Exception {
		int res = 0;
		String subsCheck = "";
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			res = pdMapper.getMemberSubsState(email);
			if(res==1) {
				subsCheck = pdMapper.getMemberSubsGrade(email);
			}
			
		} catch (Exception e) {
			throw new Exception("getMemberSubsState 실패.", e);
		}
		return subsCheck;
	}
	
	
	/********************** 상품상세 페이지 종료 **********************/
	


	/********************** 알람 시작 **********************/
	@Override
	public int getAlarm(String email, int product_num, String phone) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			int res = pdMapper.getAlarm(email, product_num, phone);
			return res;
		} catch (Exception e) {
			throw new Exception("입고 알림 여부 체크 실패", e);
		}
	}
	
	@Override
	public int getAlarm2(String email, int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			int res = pdMapper.getAlarm2(email, product_num);
			return res;
		} catch (Exception e) {
			throw new Exception("입고 알림 여부 체크 실패", e);
		}
	}

	@Override
	public void addAlarm(String email, int product_num, String phone) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.addAlarm(email, product_num, phone);
			
		} catch (Exception e) {
			throw new Exception("입고 알림 신청 실패", e);
		}
	}
	@Override
	public void deleteAlarm(String email, int product_num, String phone) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.deleteAlarm(email, product_num, phone);
			
		} catch (Exception e) {
			throw new Exception("입고 알림 신청 철회 실패", e);
		}
	}
	
	
	
	/********************** 알람 종료 **********************/
	
	
	/********************** 북마크 시작 **********************/
	@Override
	public int getBookMark(int product_num, String email) throws Exception {
		try {
			int res = 0;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			res = pdMapper.getBookMark(product_num, email);
			return res;
		} catch (Exception e) {
			throw new Exception("찜 여부 확인 실패", e);
		}
	}
	@Override
	public void addBookMark(int product_num, String email) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.addBookMark(product_num, email);
		} catch (Exception e) {
			throw new Exception("찜 on 실패", e);
		}
	}
	@Override
	public void deleteBookMark(int product_num, String email) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.deleteBookMark(product_num, email);
		} catch (Exception e) {
			throw new Exception("찜 off 실패", e);
		}
	}
	/********************** 북마크 종료 **********************/
	
	/********************** 위시리스트 시작 **********************/
	@Override
	public int getWishList(int product_num, String email) throws Exception {
		try {
			int resCount = 0, res = 0;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			resCount = pdMapper.getWishListCount(email);
			if(resCount==10) {
				res = pdMapper.getWishList(product_num, email);
				if(res==1) {
					res = 11;
				}else {
					res = 12;
				}
			}else {
				res = pdMapper.getWishList(product_num, email);
				if(res==1) {
					res = 1;
				}else {
					res = 0;
				}
			}
			return res;
		} catch (Exception e) {
			throw new Exception("위시리스트 여부 확인 실패", e);
		}
	}
	@Override
	public void addWishList(int product_num, String email) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.addWishList(product_num, email);
		} catch (Exception e) {
			throw new Exception("위시리스트 등록 실패", e);
		}
	}
	@Override
	public void deleteWishList(int product_num, String email) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.deleteWishList(product_num, email);
		} catch (Exception e) {
			throw new Exception("위시리스트 삭제 실패", e);
		}
	}
	/********************** 위시리스트 종료 **********************/
	
	/********************** 예약 시작 **********************/
	@Override
	public int getReservation(int product_num, String email) throws Exception {
		try {
			int res = 0;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			//email로 예약한 게 있는지 확인
			res = pdMapper.getReservation1(email);
			//예약한 상품이 현재 상품인지 여부 확인
			if(res==1) {
				res = pdMapper.getReservation2(product_num, email);
				if(res==1) {
					res=1;
				}else {
					res=2;
				}
			}
			return res;
		} catch (Exception e) {
			throw new Exception("위시리스트 여부 확인 실패", e);
		}
	}
	
	@Override
	public void addReservation(int product_num, String email) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.addReservation(product_num, email);
		} catch (Exception e) {
			throw new Exception("위시리스트 등록 실패", e);
		}
	}
	@Override
	public void deleteReservation(int product_num, String email) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.deleteReservation(product_num, email);
		} catch (Exception e) {
			throw new Exception("위시리스트 삭제 실패", e);
		}
	}
	/********************** 예약 종료 **********************/
	
	/********************** 상품리뷰 시작 **********************/
	@Override
	public void reviewWrite(ReviewVO reviewVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.reviewWrite(reviewVO);

		} catch (Exception e) {
			throw new Exception("리뷰 등록 실패.", e);
		}
	}
	@Override
	public int reviewCount(int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			int res = pdMapper.reviewCount(product_num);
			return res;
		} catch (Exception e) {
			throw new Exception("review 카운트 실패.", e);
		}
	}

	@Override
	public List<reviewjoinmemberVO> reviewSearch(int startPage, int endPage, int product_num) throws Exception {
		try {
			List<reviewjoinmemberVO> list = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			list = pdMapper.reviewSearch(startPage, endPage, product_num);
			return list;
		} catch (Exception e) {
			throw new Exception("review 리스트 출력 실패.", e);
		}
	}

	@Override
	public void reviewDelete(int review_num, int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.reviewDelete(review_num, product_num);
		} catch (Exception e) {
			throw new Exception("review 삭제 실패.", e);
		}
	}

	@Override
	public void reviewModify(ReviewVO reviewVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.reviewModify(reviewVO);
		} catch (Exception e) {
			throw new Exception("리뷰 수정 실패.", e);
		}
	}

	@Override
	public void reviewModifyNoImg(ReviewVO reviewVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.reviewModifyNoImg(reviewVO);
		} catch (Exception e) {
			throw new Exception("리뷰 수정 실패.", e);
		}
	}
	@Override
	public int addPoint(String email) throws Exception {
		try {
			int res = 0;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			res = pdMapper.addPoint(email);
			return res;
		} catch (Exception e) {
			throw new Exception("리뷰 포인트 적립 실패.", e);
		}
	}
	
	@Override
	public void pointDetail(String email, int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.pointDetail(email, product_num);
		} catch (Exception e) {
			throw new Exception("리뷰 포인트 지급 여부 변경 실패.", e);
		}
	}

	@Override
	public void reviewGpa(int product_num) throws Exception {
		try {
			System.out.println("reviewGpa 호출");
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.reviewGpa(product_num);
		} catch (Exception e) {
			throw new Exception("리뷰 평점 반영 실패.", e);
		}
	}
	@Override
	public int reviewoverflow(String email, int product_num) throws Exception {
		try {
			int res = 0;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			res = pdMapper.reviewoverflow(email, product_num);
			return res;
		} catch (Exception e) {
			throw new Exception("리뷰 평점 반영 실패.", e);
		}
	}

	
	
	/********************** 상품리뷰 종료 **********************/
	


	
	/********************** 상품문의 시작 **********************/
	@Override
	public void qnaWrite(QnaVO qnaVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.qnaWrite(qnaVO);
		} catch (Exception e) {
			throw new Exception("문의 등록 실패.", e);
		}
	}
	@Override
	public List<QnaVO> qnaSearch(int startPage, int endPage, int product_num) throws Exception {
		try {
			List<QnaVO> list = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			list = pdMapper.qnaSearch(startPage, endPage, product_num);
			return list;
		} catch (Exception e) {
			throw new Exception("qna 리스트 출력 실패.", e);
		}
	}
	
	
	@Override
	public List<QnaAnsVO> qnaAnsSearch(int question_num) throws Exception {
		try {
			List<QnaAnsVO> list = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			list = pdMapper.qnaAnsSearch(question_num);
			return list;
		} catch (Exception e) {
			throw new Exception("qna ans 리스트 출력 실패.", e);
		}
	}

	@Override
	public int qnaCount(int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			int res = pdMapper.qnaCount(product_num);
			return res;
		} catch (Exception e) {
			throw new Exception("qna 카운트 실패.", e);
		}
	}
	@Override
	public void qnaDelete(int question_num, int product_num) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.qnaAnsDelete(question_num);
			pdMapper.qnaDelete(question_num, product_num);
		} catch (Exception e) {
			throw new Exception("qna 삭제실패.", e);
		}
	}
	@Override
	public void qnaModify(QnaVO qnaVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.qnaModify(qnaVO);
		} catch (Exception e) {
			throw new Exception("문의 수정 실패.", e);
		}
	}
	@Override
	public String qnaemailchk(String email) throws Exception {
		String userChk = null;
		String adminChk = null;
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			userChk = pdMapper.qnaemailchk(email);
			adminChk = pdMapper.qnaadminchk(email);
			System.out.println(userChk+"asdf"+adminChk);
			if(userChk==null) {
				return adminChk;
			}else {
				return userChk;
			}
		} catch (Exception e) {
			throw new Exception("비공개 문의 이메일 체크 실패.", e);
		}
	
	}
	/********************** 상품문의 종료 **********************/
	
	

	/********************** 상품검색 시작 **********************/
	@Override
	public int productListGetCount(String search_type, String search_word) throws Exception {
		try {
			int res = 0;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			res = pdMapper.productListGetCount(search_type, search_word);
			return res;
		} catch (Exception e) {
			throw new Exception("검색 카운트 실패", e);
		}
	}
	@Override
	public List<ProductVO> selectProductList(String search_type, String search_word, int pno) throws Exception {
		try {
			List<ProductVO> list = null;
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			list = pdMapper.selectProductList(search_type, search_word, pno);
			return list;
		} catch (Exception e) {
			throw new Exception("검색 리스트 출력 실패", e);
		}
	}
	/********************** 상품검색 종료 **********************/


	/********************** 개인쉐어 상품 등록 시작 **********************/
	@Override
	public int getPnum() throws Exception {
		int res = 0;
		PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
		res = pdMapper.getPnum();
		return res;
	}

	@Override
	public void shareState(int share_state, int waiting_num) throws Exception {
		PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
		pdMapper.shareState(share_state, waiting_num);
	}

	@Override
	public void shareAdd(ProductShareVO psVO) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.shareAdd(psVO);	
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
	}
	/********************** 개인쉐어 상품 등록 종료 **********************/
	
	
	/********************** 관리자 시작 **********************/
	
	@Override
	public void ansWrite(QnaAnsVO qvo) throws Exception {
		try {
			PDMapper pdMapper = sqlSession.getMapper(PDMapper.class);
			pdMapper.ansWrite(qvo);	
			pdMapper.ansState(qvo.getQuestion_num());
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
	}
	
	
	/********************** 관리자 종료 **********************/
}