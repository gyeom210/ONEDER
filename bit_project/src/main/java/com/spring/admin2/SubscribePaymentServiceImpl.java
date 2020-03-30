package com.spring.admin2;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.SubscribePaymentMapper;
import com.spring.mypage.PStateVO;
import com.spring.payment.SubscriptionVO;
import com.spring.product.SettlementVO;
import com.spring.tazo.ShareWatingListVO;

@Service("subscribePaymentService")
public class SubscribePaymentServiceImpl implements SubscribePaymentService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ShareWatingListVO> getShareList() {
		List<ShareWatingListVO> ShareList = null;
		SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
		ShareList = subscribePaymentMapper.getShareList();
		return ShareList;
	}

	@Override
	public void shareWaitingListAcceptOrDeny(int waiting_num, int chk_num) {
		SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
		subscribePaymentMapper.shareWaitingListAcceptOrDeny(waiting_num, chk_num);
	}

	@Override
	public List<ShareWatingListVO> getShareAcceptList() {
		List<ShareWatingListVO> ShareAcceptList = null;
		SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
		ShareAcceptList = subscribePaymentMapper.getShareAcceptList();
		return ShareAcceptList;
	}

	@Override
	public List<SettlementVO> getSettleList() {
		List<SettlementVO> settleList = null;
		SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
		settleList = subscribePaymentMapper.getSettleList();
		return settleList;
	}

	@Override
	public List<PStateVO> getReturnList() {
		List<PStateVO> returnList = null;
		SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
		returnList = subscribePaymentMapper.getReturnList();
		return returnList;
	}

	@Override
	public List<SubscriptionVO> getEmail() {
		List<SubscriptionVO> emailList = null;
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			emailList = subscribePaymentMapper.getEmail();
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return emailList;
	}

	@Override
	public List<Integer> getWish(String email) {
		List<Integer> wishList = null;
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			wishList = subscribePaymentMapper.getWish(email);
			
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return wishList;
	
	}

	@Override
	public void insertWish(int randomPnum, int subscribe_num, Date date) {
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			subscribePaymentMapper.insertWish(randomPnum, subscribe_num, date);
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		
	}
	@Override
	public List<PStateVO> pickupList() {
		List<PStateVO> pickupList = null;
		SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
		pickupList = subscribePaymentMapper.pickupList();
		return pickupList;
	}
	@Override
	public void pickAccept(int state_num) {
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			subscribePaymentMapper.pickAccept(state_num);
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
	}

	@Override
	public void deleteWish(int randomPnum, String email) {
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			subscribePaymentMapper.deleteWish(randomPnum, email);
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		
	}
	@Override
	public void updateProductAmount(int randomPnum) throws Exception {
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			subscribePaymentMapper.updateProductAmount(randomPnum);
		} catch (Exception e) {
			throw new Exception("수량 변경 실패", e);
		}
	}

	@Override
	public void settleAccept(int settlement_num) throws Exception {
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			subscribePaymentMapper.settleAccept(settlement_num);
		} catch (Exception e) {
			throw new Exception("정산 실패", e);
		}
	}

	@Override
	public int personalSharingCheck(int product_num) throws Exception {
		int res = 0;
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			res = subscribePaymentMapper.personalSharingCheck(product_num);
		} catch (Exception e) {
			throw new Exception("위시리스트 담기 전 개인쉐어 여부 확인 실패", e);
		}
		return res;
	}

	@Override
	public int personalSharingFund(int product_num) throws Exception {
		int res = 0;
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			res = subscribePaymentMapper.personalSharingFund(product_num);
		} catch (Exception e) {
			throw new Exception("위시리스트 담기 전 개인쉐어 수량 및 포인트 적립 실패", e);
		}
		return res;
	}

	@Override
	public int adminSelectWish(String grade) throws Exception {
		int res = 0;
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			res = subscribePaymentMapper.adminSelectWish(grade);
		} catch (Exception e) {
			throw new Exception("SubscribePaymentMapper adminSelectWish 실패", e);
		}
		return res;
	}

	@Override
	public void adminInsertWish(int product_num, String email) throws Exception {
		try {
			SubscribePaymentMapper subscribePaymentMapper = sqlSession.getMapper(SubscribePaymentMapper.class);
			subscribePaymentMapper.adminInsertWish(product_num, email);
		} catch (Exception e) {
			throw new Exception("위시리스트가 없는 경우 랜덤으로 wish 등록 실패", e);
		}
	}
	
	
	
	
	

	
	
}
