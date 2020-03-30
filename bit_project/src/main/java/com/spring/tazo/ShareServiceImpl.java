package com.spring.tazo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.SWLMapper;

@Service
public class ShareServiceImpl implements ShareService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void shareWaitingList(ShareWatingListVO shareVO) throws Exception {
		try {
			System.out.println("서비스");
			SWLMapper mapper = sqlSession.getMapper(SWLMapper.class);
			mapper.shareWaitingList(shareVO);
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
	}

}
