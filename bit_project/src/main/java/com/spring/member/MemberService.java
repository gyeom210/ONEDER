package com.spring.member;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	public int nicknameCheck(MemberVO membervo); //닉네임 중복체크
	public int emailCheck(MemberVO membervo); //이메일 중복체크
	public int verifyEmail(MemberVO membervo); //이메일 인증
	public int memberInsert(MemberVO membervo); // 회원 등록
	public MemberVO findEmail(MemberVO membervo);	//아이디 찾기
	public MemberVO findPassword(MemberVO membervo);	//비밀번호 찾기
	public int passwordCheck(MemberVO membervo);	//mypage 비밀번호 확인
	public int nicknameupdateCheck(MemberVO membervo);	//업데이트 폼 서브밋
	public int passwordUpdate(MemberVO membervo);	//password 업데이트
	public int nnupdateCheck(MemberVO membervo); //닉네임 중복체크
	public List<MemberSubscribeVO> getMemberList();	//admin에서 memberList 뽑음.
	public List<MemberVO> getGroupList();	//admin에서 memberList 뽑음.
	public int normal_to_bad(MemberVO membervo);	//admin페이지 usergroup변경.
	public int bad_to_normal(MemberVO membervo);
	public List<MemberAdminVO> getMemberListjeon();
}
