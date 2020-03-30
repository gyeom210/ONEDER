package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.member.MemberVO;
import com.spring.point.PointVO;

public interface PointMapper {
	int countTotalData(String email); // 총 데이터 개수
	List<PointVO> getPointList(@Param("email") String email, @Param("start") int start, @Param("end") int end); //리스트 출력
	int getTotalPoints(String email); //총 포인트
	int updateTotalPoints(MemberVO membervo); // 총 포인트 업데이트
	int insertPoint(PointVO pointvo); //포인트 내역 추가
	int getPayNum(String email); // subscribe_payment 테이블의 pay_num 추출
	int getPointPrice(@Param("pay_num") int pay_num);//현재 point_price 추출
	int updatePointPrice(@Param("point_price") int point_price, @Param("pay_num") int pay_num); // update point_price
}
