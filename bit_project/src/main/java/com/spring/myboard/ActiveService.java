package com.spring.myboard;

import java.util.ArrayList;

import com.spring.community.CommentVO;

public interface ActiveService {
	public ActiveVO getLastconnection(String nickname) throws Exception;
	public int getReviewCount(String nickname) throws Exception;
	public int getRCommentCount(String nickname) throws Exception;
	public int getScrapCount(String nickname) throws Exception;
	public int getBoardCount(String nickname) throws Exception;
	public ActiveVO getWriteDate(String nickname) throws Exception;
	public ArrayList<BoardVO> getBoard1(BoardVO vo) throws Exception; // 나의 활동 - 게시판
	public ArrayList<CommentVO> getComment(CommentVO vo) throws Exception; // 나의 활동 - 댓글
	public ArrayList<MyReviewVO> getReview(MyReviewVO vo) throws Exception; // 나의 활동 - 리뷰
}
