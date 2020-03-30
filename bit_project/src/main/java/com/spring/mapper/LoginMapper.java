package com.spring.mapper;

import java.util.ArrayList;

import com.spring.login.LoginVO;

public interface LoginMapper {
	LoginVO getDetail(String email);
	LoginVO getAdmin(String email);
	int checkAdmin(String email);
	int checkMember(String email);
	int insertMember(LoginVO vo);
	ArrayList<LoginVO> getNickname();
	void updateConnection(LoginVO vo);
}
