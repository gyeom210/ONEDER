package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.tazo.ShareWatingListVO;


public interface SWLMapper {
	void shareWaitingList(ShareWatingListVO shareVO);
}
