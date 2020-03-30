package com.spring.login;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public LoginVO getDetail(String email) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			LoginVO detail = loginmapper.getDetail(email);
			return detail;
		} catch (Exception e) {
			throw new Exception("이메일 정보조회 실패", e);
		}
	}
	
	public LoginVO getAdmin(String email) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			LoginVO adminDetail = loginmapper.getAdmin(email);
			return adminDetail;
		} catch (Exception e) {
			throw new Exception("관리자 정보조회 실패", e);
		}
	}
	
	public int checkAdmin(String email) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			int checkadmin = loginmapper.checkAdmin(email);
			return checkadmin;
		} catch (Exception e) {
			throw new Exception("관리자 체크 실패", e);
		}
	}
	
	@Override
	public int checkMember(String email) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			int checkmember = loginmapper.checkMember(email);
			return checkmember;
		} catch (Exception e) {
			throw new Exception("이메일 체크 실패", e);
		}
	}
	
	@Override
	public int insertMember(LoginVO vo) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			int check = loginmapper.insertMember(vo);
			return check;
		} catch (Exception e) {
			throw new Exception("네이버/카카오 등록 실패", e);
		}
	}
	
	@Override
	public ArrayList<LoginVO> getNickname() throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			ArrayList<LoginVO> nicklist = loginmapper.getNickname();
			return nicklist;
		} catch (Exception e) {
			throw new Exception("닉네임 불러오기 실패", e);
		}
	}
	
	@Override
	public void updateConnection(LoginVO vo) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			loginmapper.updateConnection(vo);
		} catch (Exception e) {
			throw new Exception("최근접속일 수정 실패", e);
		}
	}
	
	
}
