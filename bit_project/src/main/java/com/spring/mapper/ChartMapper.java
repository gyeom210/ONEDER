package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.adminchart.CountingPVO;
import com.spring.adminchart.DNGraphVO;
import com.spring.adminchart.EBITVO;
import com.spring.adminchart.RankingVO;
import com.spring.adminchart.VariationVO;

public interface ChartMapper {
	int countNewUsers(@Param("strToday") String strToday, @Param("strTomorrow") String strTomorrow); //유저 수 카운트
	int countTotalSubscribers();
	int countTotalCompany();
	int countTotalPartner();
	
	/* 영업이익 */
	List<EBITVO> getRevenue(@Param("strAYAgo") String strAYAgo, @Param("strToday") String strToday); //매출액
	List<EBITVO> getExpenses(@Param("strAYAgo") String strAYAgo, @Param("strToday") String strToday); //비용
	
	/* 회원 변동 추이 */
	VariationVO increaseUsers(@Param("strDate") String strDate); //유저 수 카운트 
	VariationVO decreaseUsers(@Param("strDate") String strDate); //탈퇴한 유저 수 카운트 
	int countTotalUsers(@Param("strToday") String strToday);
	
	
	List<RankingVO> getWishListRanking(); //위시리스트 Top5
	List<DNGraphVO> getDoughnutGraph(); // 구독 등급별 파이 
	CountingPVO countPosts(@Param("strDate") String strDate);
}