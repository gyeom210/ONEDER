package com.spring.point;

import java.util.List;

import com.spring.member.MemberVO;

public interface PointService {
	public int countTotalData(String email); // 총 데이터 개수
	public List<PointVO> getPointList(String email, int start, int end); //리스트 출력
	public int getTotalPoints(String email); //총 포인트
	public int updateTotalPoints(MemberVO membervo); // 총 포인트 업데이트
	public int insertPoint(PointVO pointvo);//포인트 내역 추가
	public int updatePointPrice(String email, int point_price); // subscribe_payment 테이블의 pay_num 추출
}
