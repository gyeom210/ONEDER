package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.mypage.BookmarkVO;
import com.spring.mypage.PStateVO;
import com.spring.mypage.ReservationVO;
import com.spring.mypage.WishlistVO;
import com.spring.product.ProductShareVO;
import com.spring.product.PsharePlusWatingVO;
import com.spring.product.SettlementVO;
import com.spring.tazo.ShareWatingListVO;

public interface MyMapper {
	List<BookmarkVO> getMyPageBookMark(@Param("email") String email);
	List<WishlistVO> getMyPageWishList(@Param("email") String email);
	List<ReservationVO> getMyPageReservation(@Param("email") String email);
	
	PStateVO getProductState(PStateVO vo);
	
	void getMyPageShareSettle(@Param("email") String email, @Param("settle") int settle, @Param("share_num") int share_num) throws Exception;
	SettlementVO getShareJoin(@Param("share_num") int share_num,@Param("product_name") String product_name);
	void addMyPageShareSettle(SettlementVO sVO);
	void updateShareJoin(@Param("share_num") int share_num, @Param("settle") int settle);
	int checkPS(PStateVO vo);
	int checkReserve(String email);
	int getReserve(String email);
	ArrayList<PStateVO> selectPS(@Param("email")String email, @Param("start") int start, @Param("end") int end);
	int scount(@Param("email") String email);
	int hcount(@Param("email") String email);
	List<ShareWatingListVO> getMyPageShare(@Param("startrow") int startrow, @Param("endrow") int endrow, @Param("email") String email);
	List<ProductShareVO> getMyPageShare2(@Param("startrow") int startrow, @Param("endrow") int endrow, @Param("email") String email);
	List<PsharePlusWatingVO> getMyPageShareDetail(@Param("share_num") int share_num, @Param("waiting_num") int waiting_num);

}
