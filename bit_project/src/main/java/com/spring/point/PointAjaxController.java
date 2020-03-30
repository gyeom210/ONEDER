package com.spring.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.MemberVO;

@RestController
public class PointAjaxController {
	
	@Autowired(required = false)
	private PointService pointService;
	
	
	@PostMapping(value="/countTotalData.pt", produces = "application/json;charset=UTF-8")
	public int countTotalData(@RequestParam("email") String email) {
		
		int res = pointService.countTotalData(email);

		return res;
	}
	
	@PostMapping(value="/getPointList.pt", produces = "application/json;charset=UTF-8")
	public List<PointVO> getPointList(@RequestParam("email") String email, @RequestParam("page") int page) {
		List<PointVO> list = null;
		
		
		int limit = 5;
		int start= (page - 1) * 5 + 1;
		int end = start + limit - 1;
		list = pointService.getPointList(email, start, end);
	
		return list;
	}
	
	@PostMapping(value="/getTotalPoints.pt", produces = "application/json;charset=UTF-8")
	public int getTotalPoints(@RequestParam("email") String email) {
		int totalPoints = pointService.getTotalPoints(email);
		
		System.out.println("Total_points = "+totalPoints);
		return totalPoints;
	}
	
	@PostMapping(value="/updateTotalPoints.pt", produces = "application/json;charset=UTF-8")
	public int updateTotalPoints(@RequestParam("result") int point, MemberVO membervo, HttpSession session) {
		membervo.setPoint(point);
		membervo.setEmail((String)session.getAttribute("email"));
		int totalPoints = pointService.updateTotalPoints(membervo);

		return totalPoints;
	}
	
	@PostMapping(value="/insertPoint.pt", produces = "application/json;charset=UTF-8")
	public int insertPoint(@RequestParam("point") int point, @RequestParam("reason") String reason, PointVO pointvo, HttpSession session) {
		pointvo.setEmail((String)session.getAttribute("email"));
		pointvo.setVariation(point); 
		
		if(reason.equals("subscription")) {
			pointvo.setReason("차감");
			pointvo.setState("차감예정");
            pointService.updatePointPrice((String)session.getAttribute("email"), point);
		}else if(reason.equals("gift-wrap")) {
			pointvo.setReason("포장");
			pointvo.setState("포장예정");
		}
		
		int res = pointService.insertPoint(pointvo);
		
		return res;
		
	}
}
