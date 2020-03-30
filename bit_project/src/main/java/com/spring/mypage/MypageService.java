package com.spring.mypage;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.product.ProductShareVO;
import com.spring.product.PsharePlusWatingVO;
import com.spring.product.SettlementVO;
import com.spring.tazo.ShareWatingListVO;

public interface MypageService {
	public List<BookmarkVO> getMyPageBookMark(@Param("email") String email) throws Exception;
	public List<WishlistVO> getMyPageWishList(@Param("email") String email) throws Exception;
	public List<ReservationVO> getMyPageReservation(@Param("email") String email) throws Exception;
	public PStateVO getProductState(PStateVO vo) throws Exception;
	public void getMyPageShareSettle(@Param("email") String email, @Param("settle") int settle, @Param("share_num") int share_num) throws Exception;
	public SettlementVO getShareJoin(@Param("share_num") int share_num, @Param("product_name") String product_name) throws Exception;
	public void addMyPageShareSettle(SettlementVO sVO) throws Exception;
	public void updateShareJoin(@Param("share_num") int share_num, @Param("settle") int settle) throws Exception;
	public int checkPS(PStateVO vo) throws Exception;
	public int checkReserve(String email) throws Exception;
	public int getReserve(String email) throws Exception;
	public List<PsharePlusWatingVO> getMyPageShareDetail(int share_num, int waiting_num) throws Exception;
	public ArrayList<PStateVO> selectPS(@Param("email")String email, @Param("start") int start, @Param("end") int end) throws Exception;

	public int scount(String email) throws Exception;
	public int hcount(String email) throws Exception;

	
	public List<ShareWatingListVO> getMyPageShare(@Param("startrow") int startrow, @Param("endrow") int endrow, @Param("email") String email) throws Exception;
	public List<ProductShareVO> getMyPageShare2(@Param("startrow") int startrow, @Param("endrow") int endrow, @Param("email") String email) throws Exception;
	

	
}
