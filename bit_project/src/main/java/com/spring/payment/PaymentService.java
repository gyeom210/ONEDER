package com.spring.payment;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import org.apache.ibatis.annotations.Param;

import com.spring.member.MemberVO;

public interface PaymentService {
	public MemberVO getUserInfo(String email) throws Exception;
	public ArrayList<PMemberVO> allSubscribe(String state) throws Exception;
	public int insertSubscribe(SubscriptionVO vo) throws Exception;
	public SubscriptionVO getSubscribe(String email) throws Exception;
	public int insertPayment(PaymentVO vo) throws Exception;
	public int updateMemberColumn(String email) throws Exception;
	public int updatePayState(PaymentVO vo) throws Exception;
	public PaymentVO selectCancel(String email) throws Exception;
	public int rePayState(PaymentVO vo) throws Exception;
	public int paidState(int subscribe_num) throws Exception;

	public void updateSubs(@Param("subscribe_num") int subscribe_num) throws Exception;
	public PMemberVO allSubscribe2(String merchant_uid, String state) throws Exception;
	public ArrayList<Integer> getWishPnum(String email) throws Exception;
	public void insertProductState(int subscribe_num, int product_num, Date date) throws Exception;
	public int productAmountCheck(int product_num) throws Exception;
	public void updateProductAmount(int product_num) throws Exception;
	public int getReser(String email) throws Exception;
	public void deleteWish(int randomPnum, String email);
	public void updateCount(int count, String email) throws Exception;
	public void updateMPstate(String email) throws Exception;
	public int checkSubCancel(String email) throws Exception;
	public void updateRestate(String email) throws Exception;

	public ArrayList<PaymentVO> selectSP(@Param("email")String email, @Param("start") int start, @Param("end") int end) throws Exception;
	public int cancelSub(String email) throws Exception;

	public int cancelSub2(String email) throws Exception;
	public int insertChange(@Param("subscribe_num") int subscribe_num, @Param("grade") String grade, @Param("price") int price) throws Exception;
	public int checkCgrade(String email) throws Exception;
	public String getCgrade(String email) throws Exception;
	public void deleteCancel(String email) throws Exception;
	public int updateSgrade(@Param("email") String email, @Param("regrade") String regrade) throws Exception;
	public String selectSgrade(@Param("subscribe_num") int subscribe_num) throws Exception;

	public int personalSharingCheck(int product_num) throws Exception;
	public int personalSharingFund(int product_num) throws Exception;
	
	public int adminSelectWish(String grade) throws Exception;
	public void adminInsertWish(int product_num, String email) throws Exception;


	
}
