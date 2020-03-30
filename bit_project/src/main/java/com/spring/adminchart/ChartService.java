package com.spring.adminchart;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ChartService {
	public int countNewUsers() throws Exception; //유저 수 카운트
	public int countTotalSubscribers() throws Exception;
	public int countTotalB2B() throws Exception;
	public List<RankingVO> getWishListRanking() throws Exception; //위시리스트 Top5
	/* 영업이익 */
	public List<EBITVO> getRevenue() throws Exception; //수익(매출)
	public List<EBITVO> getExpenses() throws Exception; //비용
	
	/* 회원 변동 추이 */
	public VariationVO increaseUsers(String strDate) throws Exception; //유저 수 카운트
	public List<VariationVO> countTotalUsers() throws Exception;
	public VariationVO decreaseUsers(String strDate) throws Exception;
	
	public List<DNGraphVO> getDoughnutGraph() throws Exception; // 구독 등급별 파이
	public CountingPVO countPosts(String strDate) throws Exception;
}
