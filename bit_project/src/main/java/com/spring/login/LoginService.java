package com.spring.login;

import java.util.ArrayList;

public interface LoginService {
	public LoginVO getDetail(String email) throws Exception;
	public LoginVO getAdmin(String email) throws Exception;
	public int checkAdmin(String email) throws Exception;
	public int checkMember(String email) throws Exception;
	public int insertMember(LoginVO vo) throws Exception;
	public ArrayList<LoginVO> getNickname() throws Exception;
	public void updateConnection(LoginVO vo) throws Exception;
	
}
