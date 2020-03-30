package com.spring.writing;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.mapper.WritingMapper;

@Service("writingService")
public class WritingServiceImpl implements WritingService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int write(WritingVO writingvo) {
		WritingMapper writingMapper = sqlSession.getMapper(WritingMapper.class);
		int res = writingMapper.write(writingvo);
		return res;
	}

	@Override
	public WritingVO updateForm(int board_num) {
		WritingVO vo = null;
		WritingMapper writingMapper = sqlSession.getMapper(WritingMapper.class);
		vo = writingMapper.updateForm(board_num);
		
		return vo;
	}

	@Override
	public int delete(int board_num) {
		WritingMapper writingMapper = sqlSession.getMapper(WritingMapper.class);
		int res = writingMapper.delete(board_num);
		return res;
	}

	@Override
	public int update(WritingVO writingvo) {
		WritingMapper writingMapper = sqlSession.getMapper(WritingMapper.class);
		int res = writingMapper.update(writingvo);
		return res;
	}



//	@Override
//	 public void storeFilePath(String file_path) {
//		 try {
//			 WritingMapper writingMapper = sqlSession.getMapper(WritingMapper.class);
//			 writingMapper.storeFilePath(file_path);
//		 } catch (Exception e) {
//			 System.out.println("file_path 저장 실패." + e.getMessage());
//		 }
//	 }

	
	
}
