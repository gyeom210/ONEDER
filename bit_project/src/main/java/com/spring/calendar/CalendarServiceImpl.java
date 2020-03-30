package com.spring.calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CalendarMapper;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int updatePS(CalendarVO vo) throws Exception {
		try {
			CalendarMapper calendarmapper = sqlSession.getMapper(CalendarMapper.class);
			int res = calendarmapper.updatePS(vo);
			return res;
		} catch (Exception e) {
			throw new Exception("반납신청일 업데이트 실패", e);
		}
	}
	
	@Override
	public int resetPS(CalendarVO vo) throws Exception {
		try {
			CalendarMapper calendarmapper = sqlSession.getMapper(CalendarMapper.class);
			int res = calendarmapper.resetPS(vo);
			return res;
		} catch (Exception e) {
			throw new Exception("반납신청일 초기화 실패", e);
		}
	}
	
	@Override
	public CalendarVO getSC(String email) throws Exception {
		try {
			CalendarMapper calendarmapper = sqlSession.getMapper(CalendarMapper.class);
			CalendarVO vo = calendarmapper.getSC(email);
			return vo;
		} catch (Exception e) {
			throw new Exception("구독조회 실패", e);
		}
	}
	
	@Override
	public CalendarVO getPS(int subscribe_num) throws Exception {
		try {
			CalendarMapper calendarmapper = sqlSession.getMapper(CalendarMapper.class);
			CalendarVO vo = calendarmapper.getPS(subscribe_num);
			return vo;
		} catch (Exception e) {
			throw new Exception("상품상태(구독) 조회 실패", e);
		}
	}
}
