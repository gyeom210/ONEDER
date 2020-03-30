package com.spring.point;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PointMapper;
import com.spring.member.MemberVO;

@Service("pointService")
public class PointServiceImpl implements PointService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int countTotalData(String email) {
		int res = 0;
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			res = pointMapper.countTotalData(email);
		}catch(Exception e) {
			System.out.println("포인트 데이터 개수 확인 실패."+  e.getMessage());
		}
		return res;
	}
	
	@Override
	public List<PointVO> getPointList(String email, int start, int end) {
		List<PointVO> pointList = null;
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			pointList = pointMapper.getPointList(email, start, end);
		} catch(Exception e) {
			System.out.println("포인트 리스트 확인 실패."+  e.getMessage());
		}
		return pointList;
	}

	@Override
	public int getTotalPoints(String email) {
		int totalPoints = 0;
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			totalPoints = pointMapper.getTotalPoints(email);
		} catch(Exception e) {
			System.out.println("보유 포인트 확인 실패."+  e.getMessage());
		}
		return totalPoints;
	}

	@Override
	public int updateTotalPoints(MemberVO membervo) {
		int res = 0;
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			res = pointMapper.updateTotalPoints(membervo);
		} catch(Exception e) {
			System.out.println("업데이트 포인트 확인 실패."+  e.getMessage());
		}
		
		return res;
	}

	@Override
	public int insertPoint(PointVO pointvo) {
		int res = 0;
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			res = pointMapper.insertPoint(pointvo);
		} catch(Exception e) {
			System.out.println("인설트 포인트 확인 실패."+  e.getMessage());
		}
		return res;
	}

	@Override
    public int updatePointPrice(String email, int point) {
        int point_price = 0 ;
		int pay_num = 0;
		int currentPP = 0;
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			pay_num = pointMapper.getPayNum(email);
			currentPP = pointMapper.getPointPrice(pay_num);
            point_price = currentPP + point;
            pointMapper.updatePointPrice(point_price, pay_num);
		} catch(Exception e) {
			System.out.println("subscribe_payment point_price 업데이트 실패."+  e.getMessage());
		}
        return point_price;
	}


	
	
}
