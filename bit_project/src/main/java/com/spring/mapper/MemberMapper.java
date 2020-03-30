package com.spring.mapper;


import java.util.List;

import com.spring.member.MemberAdminVO;
import com.spring.member.MemberSubscribeVO;
import com.spring.member.MemberVO;



public interface MemberMapper {
	MemberVO nicknameCheck(MemberVO membervo); //닉네임 중복체크
	MemberVO emailCheck(MemberVO membervo); //이메일 중복체크
	int verifyEmail(MemberVO membervo); //이메일 인증
	int memberInsert(MemberVO membervo); //회원 등록
	MemberVO findEmail(MemberVO membervo);	//이메일 찾기
	MemberVO findPassword(MemberVO membervo);	//패스워드 찾기
	int updatepassword(MemberVO membervo);	//패스워드 변경
	MemberVO passwordCheck(MemberVO membervo);	//mypage 비밀번호 확인
	int nicknameupdateCheck(MemberVO membervo);	//mypage nickname update 중복확인
	int passwordUpdate(MemberVO membervo);	//비밀번호 변경
	MemberVO nnupdateCheck(MemberVO membervo);
	List<MemberSubscribeVO> getMemberList();
	List<MemberVO> getGroupList();
	int normal_to_bad(MemberVO membervo);	//admin usergroup 변경.
	int bad_to_normal(MemberVO membervo);
	List<MemberAdminVO> getMemberListjeon();
}
