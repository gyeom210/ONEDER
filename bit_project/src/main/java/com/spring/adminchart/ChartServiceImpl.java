package com.spring.adminchart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ChartMapper;

@Service("chartService")
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	private SqlSession sqlSession;

	/*New Users*/
	@Override
	public int countNewUsers() throws Exception{
		int res = 0;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			/*현재*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		    Calendar c1 = Calendar.getInstance();
			String strToday = sdf.format(c1.getTime());

			/*내일*/
			String strTomorrow = strToday;  // 시작일
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
			Calendar c = Calendar.getInstance();
			c.setTime(sdf1.parse(strTomorrow));
			c.add(Calendar.DATE, 1); 
			strTomorrow = sdf1.format(c.getTime()); 
			System.out.println(strTomorrow+","+strToday);
			
			res = chartMapper.countNewUsers(strToday, strTomorrow);
		}catch(Exception e) {
			throw new Exception("새로운 회원수 카운팅 실패", e);
		}
		return res;
	}
	
	
	/* 영업이익 */
	@Override
	public List<EBITVO> getRevenue() throws Exception{
		List<EBITVO> ebitList = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			/*현재*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		    Calendar c1 = Calendar.getInstance();
			String strToday = sdf.format(c1.getTime());
			
			/*1년 전*/
			String strAYAgo = strToday;  // 시작일
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
			Calendar c = Calendar.getInstance();
			c.setTime(sdf1.parse(strAYAgo));
			c.add(Calendar.YEAR, -1); 
			strAYAgo = sdf1.format(c.getTime());
			
			ebitList = chartMapper.getRevenue(strAYAgo, strToday);
		}catch(Exception e) {
			throw new Exception("매출 계산 실패", e);
		}
		return ebitList;
	}
	
	@Override
	public List<EBITVO> getExpenses() throws Exception {
		List<EBITVO> ebitList = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			/*현재*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		    Calendar c1 = Calendar.getInstance();
			String strToday = sdf.format(c1.getTime());
			
			/*1년 전*/
			String strAYAgo = strToday;  // 시작일
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
			Calendar c = Calendar.getInstance();
			c.setTime(sdf1.parse(strAYAgo));
			c.add(Calendar.YEAR, -1); 
			strAYAgo = sdf1.format(c.getTime());
			
			ebitList = chartMapper.getExpenses(strAYAgo, strToday);
		} catch(Exception e) {
			throw new Exception("비용 계산 실패", e);
		}
		return ebitList;
	}
	
	/*wish list top5*/
	@Override
	public List<RankingVO> getWishListRanking() throws Exception{
		List<RankingVO> rankingList = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			rankingList = chartMapper.getWishListRanking();
		} catch(Exception e) {
			throw new Exception("위시리스트 top5 추출 실패", e);
		}
		return rankingList;
	}
	
	/* 구독 등급별 파이 */
	@Override
	public List<DNGraphVO> getDoughnutGraph() throws Exception {
		List<DNGraphVO> dngList = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			dngList = chartMapper.getDoughnutGraph();
		} catch(Exception e) {
			throw new Exception("구독 등급별 파이 추출 실패", e);
		}
		return dngList;
	}

	/*회원 변동 추이*/
	@Override
	public List<VariationVO> countTotalUsers() throws Exception {
		List<VariationVO> variationList = new ArrayList();
		int total = 0;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			/*현재*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		    Calendar c1 = Calendar.getInstance();
			String strToday = sdf.format(c1.getTime());
			
			for(int i = 0; i < 14; i++) {
				VariationVO variationvo = new VariationVO();
				
				/*2주 전*/
				String str14DAgo = strToday;  // 시작일
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
				Calendar c = Calendar.getInstance();
				c.setTime(sdf1.parse(str14DAgo));
				c.add(Calendar.DATE, -(13-i)); 
				str14DAgo = sdf1.format(c.getTime()); 
				total = chartMapper.countTotalUsers(str14DAgo);
				
				variationvo.setStrRegist(str14DAgo);
				variationvo.setTotal(total);
				
				variationList.add(variationvo);
			}
			
		} catch(Exception e) {
			throw new Exception("총 회원수 구하기 실패", e);
		}
		return variationList;
	}

	@Override
	public VariationVO decreaseUsers(String strDate) throws Exception {
		VariationVO variationvo = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			
			variationvo = chartMapper.decreaseUsers(strDate);
		}catch(Exception e) {
			throw new Exception("회원 감소치 구하기 실패", e);
		}
		return variationvo;
	}


	@Override
	public VariationVO increaseUsers(String strDate) throws Exception {
		VariationVO variationvo = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			
			variationvo = chartMapper.increaseUsers(strDate);
		}catch(Exception e) {
			throw new Exception("회원 증가치 구하기 실패", e);
		}
		return variationvo;
	}
	
	
	@Override
	public int countTotalSubscribers() throws Exception {
		int res = 0;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			res = chartMapper.countTotalSubscribers();
		}catch(Exception e) {
			throw new Exception("TOTAL SUBSCRIBERS 카운트 실패", e);
		}
		return res;
	}


	@Override
	public int countTotalB2B() throws Exception {
		int res = 0;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			res = chartMapper.countTotalCompany() + chartMapper.countTotalPartner();
		}catch(Exception e) {
			throw new Exception("TOTAL B2B 카운트 실패", e);
		}
		return res;
	}


	@Override
	public CountingPVO countPosts(String strDate) throws Exception {
		CountingPVO countingpvo = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			countingpvo = chartMapper.countPosts(strDate);
		}catch(Exception e) {
			throw new Exception("게시글 수 카운트 실패", e);
		}
		return countingpvo;
	}


}
