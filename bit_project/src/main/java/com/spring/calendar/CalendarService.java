package com.spring.calendar;

public interface CalendarService {
	public int updatePS(CalendarVO vo) throws Exception;
	public int resetPS(CalendarVO vo) throws Exception;
	public CalendarVO getSC(String email) throws Exception;
	public CalendarVO getPS(int subscribe_num) throws Exception;
}
