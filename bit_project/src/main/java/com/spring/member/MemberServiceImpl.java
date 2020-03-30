package com.spring.member;

import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int nicknameCheck(MemberVO membervo) {	//사용자한테 받은 nickname값이 들어있음
		MemberVO dbnickname = null;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			dbnickname = memberMapper.nicknameCheck(membervo);
			
			if (dbnickname != null) {
				res = 1; //닉네임 중복
				
			} else {	//닉네임 중복체크 했을 때 중복되지 않는 값
				res = 0;	//중복된 닉네임이 없는 것
				
			}
		} catch(Exception e) {
			System.out.println("닉네임 중복 확인 실패."+  e.getMessage());
		}
		return res;
	}
	
	@Override
	public int nnupdateCheck(MemberVO membervo) {	//사용자한테 받은 nickname값이 들어있음
		MemberVO dbnickname = null;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			dbnickname = memberMapper.nnupdateCheck(membervo);
			
			if (dbnickname != null) {
				res = 1; //닉네임 중복
				
			} else {	//닉네임 중복체크 했을 때 중복되지 않는 값
				res = 0;	//중복된 닉네임이 없는 것
				
			}
		} catch(Exception e) {
			System.out.println("닉네임 중복 확인 실패."+  e.getMessage());
		}
		return res;
	}

	@Override
	public int emailCheck(MemberVO membervo) {
		MemberVO dbemail = null;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			dbemail = memberMapper.emailCheck(membervo);
			
			if (dbemail != null) {
				res = 1; //이메일 중복
				
			} else {	//이메일 중복체크 했을 때 중복되지 않는 값
				res = 0;	//중복된 이메일이 없는 것
				
			}
		} catch(Exception e) {
			System.out.println("이메일 중복 확인 실패." +  e.getMessage());
		}
		return res;
	}

	@Override
	public int verifyEmail(MemberVO membervo) {
		//인증 안된 회원의 디폴트 값은 N
		//인증 된 회원의 값은 Y
		int res = 0;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			res = memberMapper.verifyEmail(membervo);
			
		}catch(Exception e) {
			System.out.println("이메일 인증 실패." +  e.getMessage());
		}
		
		return res;
	}

	@Override
	public int memberInsert(MemberVO membervo) {
		int res = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			res = memberMapper.memberInsert(membervo); // res == 1
			
		}catch (Exception e) {
			System.out.println("회원 등록 실패."+ e.getMessage());
		}
		return res;
	}

	@Override
	public MemberVO findEmail(MemberVO membervo) {
		MemberVO memVO = new MemberVO();
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			memVO = memberMapper.findEmail(membervo);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return memVO;
	}

	@Override
	public MemberVO findPassword(MemberVO membervo) {
		MemberVO memVO = new MemberVO();
		int result = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			memVO = memberMapper.findPassword(membervo);
			if(memberMapper.findPassword(membervo) != null) {
				String password_random = UUID.randomUUID().toString().substring(0, 8).trim();
				membervo.setPassword(password_random);
				
				result = memberMapper.updatepassword(membervo);
				membervo.setPassword(membervo.getPassword());
			} else {
				membervo.setPassword("WrongPw");
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return membervo;
	}

	@Override
	public int passwordCheck(MemberVO membervo) {
		MemberVO dbpassword = null;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			dbpassword = memberMapper.passwordCheck(membervo);
			
			
			if (dbpassword != null) {
				res = 1; //비밀번호 일치
				
			} else {	//
				res = 0;	//비밀번호 틀림
				
			}
		} catch(Exception e) {
			System.out.println("mypage 비밀번호 확인 실패." +  e.getMessage());
		}
		return res;
	}

	@Override
	public int nicknameupdateCheck(MemberVO membervo) {
		int dbnickname = 0;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			dbnickname = memberMapper.nicknameupdateCheck(membervo);
			if (dbnickname == 0) {	//update 실패
				res = 1;	
			} else {	//update 성공
				res = 0;	
			}
		} catch(Exception e) {
			System.out.println("mypage nickname 중복 확인 실패." +  e.getMessage());
		}
		return res;
	}

	@Override
	public int passwordUpdate(MemberVO membervo) {
		int dbpasswordupdate = 0;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			dbpasswordupdate = memberMapper.passwordUpdate(membervo);
			
			if (dbpasswordupdate != 0) {
				res = 1; //비밀번호 db에서 변경 완료.
				
			} else {	//
				res = 0;	//비밀번호 db에서 변경 실패.
				
			}
		} catch(Exception e) {
			System.out.println("mypage 비밀번호 변경 실패." +  e.getMessage());
		}
		return res;
	}

	@Override
	public List<MemberSubscribeVO> getMemberList() {
		List<MemberSubscribeVO> memberList = null;
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberList = memberMapper.getMemberList();
		
		return memberList;
	}

	@Override
	public List<MemberVO> getGroupList() {
		List<MemberVO> groupList = null;
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		groupList = memberMapper.getGroupList();
		
		return groupList;
	}

	@Override
	public int normal_to_bad(MemberVO membervo) {
		int group_change = 0;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			
			group_change = memberMapper.normal_to_bad(membervo);
			
			
			if (group_change != 0) {
				res = 1; //변경됨
				
			} else {	//
				res = 0;	//변경 안됨
				
			}
		} catch(Exception e) {
			System.out.println("서비스 impl에서 오류 => " +  e.getMessage());
		}
		return res;
	}
	
	@Override
	public int bad_to_normal(MemberVO membervo) {
		int group_change = 0;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			
			group_change = memberMapper.bad_to_normal(membervo);
			
			
			if (group_change != 0) {
				res = 1; //변경됨
				
			} else {	//
				res = 0;	//변경 안됨
				
			}
		} catch(Exception e) {
			System.out.println("서비스 impl에서 오류 => " +  e.getMessage());
		}
		return res;
	}

	@Override
	public List<MemberAdminVO> getMemberListjeon() {
		List<MemberAdminVO> List = null;
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		List = memberMapper.getMemberListjeon();
		return List;
	}
	

}
