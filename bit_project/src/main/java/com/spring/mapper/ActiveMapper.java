package com.spring.mapper;

import java.util.ArrayList;

import com.spring.community.CommentVO;
import com.spring.myboard.ActiveVO;
import com.spring.myboard.BoardVO;
import com.spring.myboard.MyReviewVO;

public interface ActiveMapper {
	ActiveVO getLastconnection(String nickname);
	int getReviewCount(String nickname);
	int getRCommentCount(String nickname);
	int getScrapCount(String nickname);
	int getBoardCount(String nickname);
	ActiveVO getWriteDate(String nickname);
	ArrayList<BoardVO> getBoard1(BoardVO vo); //나의 활동 - 게시판
	ArrayList<CommentVO> getComment(CommentVO vo); // 나의 활동 - 댓글
	ArrayList<MyReviewVO> getReview(MyReviewVO vo); // 나의 활동 - 리뷰
}
