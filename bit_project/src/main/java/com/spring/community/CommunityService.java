package com.spring.community;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CommunityService {
	/*게시글*/
//	public ArrayList<CommunityVO> getCommunity(CommunityVO cmvo);
//	public List<CommunityVO> getCM(@Param("category") String category, @Param("start") int start, @Param("end") int end);	
//	public int getCommunityCount(String category)  throws Exception;
	
	/*필터*/
//	public List<CommunityVO> filter1(@Param("category") String category, @Param("start") int start, @Param("end") int end);
//	public List<CommunityVO> filter2(@Param("category") String category, @Param("start") int start, @Param("end") int end);
//	public List<CommunityVO> filter3(@Param("category") String category, @Param("start") int start, @Param("end") int end);
	public List<CommunityVO> filter1(@Param("category") String category);
	public List<CommunityVO> filter2(@Param("category") String category);
	public List<CommunityVO> filter3(@Param("category") String category);
	
	/*검색*/
//	public List<CommunityVO> getCMsearch(@Param("search_Data") String search_Data, @Param("category") String category, @Param("start") int start, @Param("end") int end);
//	public List<CommunityVO> getuserSearch(@Param("nickname") String nickname, @Param("start") int start, @Param("end") int end);
	public List<CommunityVO> getCMsearch(@Param("search_Data") String search_Data, @Param("category") String category);
	public List<CommunityVO> getuserSearch(@Param("nickname") String nickname);
	
	/*게시글*/
	public CommunityVO detailCommunity(int board_num);
	public int updateCount(int board_num);
	public int updateScrap(@Param("board_num") int board_num);
	public String getuserImg(@Param("email") String email);
	
	/*댓글*/
//	public List<CommentVO> getCO(@Param("board_num") int board_num, @Param("start") int start, @Param("end") int end);
	public List<CommentVO> getCO(@Param("board_num") int board_num);
	public int getCommentCount(int board_num);
	public int writeCO(CommentVO covo);
	public int updateCO(@Param("comment_num") int comment_num, @Param("content") String content);
	public int deleteCO(@Param("comment_num") int comment_num);
	public int deleteboardc(@Param("board_num") int board_num);
	
	/*대댓*/
	public int writeAnswer(AnswerVO answervo);
	public List<AnswerVO> getAnswer(@Param("comment_num") int comment_num);
	public int getAnswerCount(int board_num);
	public int updateAnswer(@Param("answer_num") int answer_num, @Param("content") String content);
	public int deleteAnswer(@Param("answer_num") int answer_num);
	public int deleteboarda(@Param("board_num") int board_num);
}
