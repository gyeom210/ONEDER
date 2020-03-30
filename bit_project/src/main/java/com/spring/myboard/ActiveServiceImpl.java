package com.spring.myboard;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.community.CommentVO;
import com.spring.mapper.ActiveMapper;

@Service
public class ActiveServiceImpl implements ActiveService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ActiveVO getLastconnection(String nickname) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			ActiveVO vo = activemapper.getLastconnection(nickname);
			return vo;
		} catch (Exception e) {
			throw new Exception("마지막 접속일 조회실패", e);
		}
	}
	
	@Override
	public int getReviewCount(String nickname) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			int count = activemapper.getReviewCount(nickname);
			return count;
		} catch (Exception e) {
			throw new Exception("후기 조회실패", e);
		}
	}
	
	@Override
	public int getRCommentCount(String nickname) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			int count = activemapper.getRCommentCount(nickname);
			return count;
		} catch (Exception e) {
			throw new Exception("댓글 조회실패", e);
		}
	}
	
	@Override
	public int getScrapCount(String nickname) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			int count = activemapper.getScrapCount(nickname);
			return count;
		} catch (Exception e) {
			throw new Exception("스크랩 조회실패", e);
		}
	}
	
	@Override
	public int getBoardCount(String nickname) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			int count = activemapper.getBoardCount(nickname);
			return count;
		} catch (Exception e) {
			throw new Exception("게시글 조회실패", e);
		}
	}
	
	
	@Override
	public ActiveVO getWriteDate(String nickname) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			ActiveVO vo = activemapper.getWriteDate(nickname);
			return vo;
		} catch (Exception e) {
			throw new Exception("최신 글 조회실패", e);
		}
	}
	
	@Override
	public ArrayList<BoardVO> getBoard1(BoardVO vo) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			ArrayList<BoardVO> data = activemapper.getBoard1(vo);
			return data;
		} catch (Exception e) {
			throw new Exception("나의 활동 - 글목록 조회 실패", e);
		}
	}

	@Override
	public ArrayList<CommentVO> getComment(CommentVO vo) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			ArrayList<CommentVO> data = activemapper.getComment(vo);
			return data;
		} catch (Exception e) {
			throw new Exception("나의 활동 - 댓글 목록 조회 실패", e);
		}
	}

	@Override
	public ArrayList<MyReviewVO> getReview(MyReviewVO vo) throws Exception {
		try {
			ActiveMapper activemapper = sqlSession.getMapper(ActiveMapper.class);
			ArrayList<MyReviewVO> data = activemapper.getReview(vo);
			return data;
		} catch (Exception e) {
			throw new Exception("나의 활동 - 후기 작성 목록 조회 실패", e);
		}
	}
}
