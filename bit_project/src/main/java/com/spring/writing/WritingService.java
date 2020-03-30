package com.spring.writing;

import org.apache.ibatis.annotations.Param;

public interface WritingService {
	public int write(WritingVO writingvo); //글쓰기
//	public void storeFilePath(String file_path); //파일 경로 저장
//	public WritingVO getDetail(int board_num); //글 정보 가져오기
	public WritingVO updateForm(int board_num); // 글 수정 폼
	public int update(WritingVO writingvo); //글 수정
	public int delete(@Param("board_num") int board_num); //글삭제
}
