package com.spring.mapper;

import com.spring.calendar.CalendarVO;

public interface CalendarMapper {
	int updatePS(CalendarVO vo);
	int resetPS(CalendarVO vo);
	CalendarVO getSC(String email);
	CalendarVO getPS(int subscribe_num);
}
