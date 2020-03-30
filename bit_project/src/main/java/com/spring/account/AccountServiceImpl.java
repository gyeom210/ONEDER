package com.spring.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AccountMapper;
import com.spring.mapper.MemberMapper;
import com.spring.member.MemberVO;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int checkPW(MemberVO membervo) {
		MemberVO vo = null;
		int res = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			vo = memberMapper.emailCheck(membervo);
			if(membervo.getPassword().equals(vo.getPassword())) {
				res = 1;
			} else {
				res = -1;
			}
		} catch(Exception e) {
			System.out.println("pwCheck 실패" + e.getMessage());
		}
		return res;
	}

	@Override
	public int deleteMyAccount(String email) {
		int res = 0;
		int subscribe_num = 0;
		try {
			AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
			subscribe_num = accountMapper.getSubscribe_num(email);
			System.out.println("subscribe_num="+ subscribe_num);
			accountMapper.deleteProduct_state(subscribe_num);
			accountMapper.deleteSubscribe_payment(subscribe_num);
			accountMapper.deleteAlarm(email);
			accountMapper.deleteReservation(email);
			accountMapper.deleteBookmark(email);
			accountMapper.deleteWishlist(email);
			accountMapper.deleteDelivery_loc(email);
			accountMapper.deleteMember_account(email);
			accountMapper.deleteSubscribe(email);
			accountMapper.deleteMember_point(email);
			res = accountMapper.deleteMember(email);
		
		} catch(Exception e) {
			System.out.println("deleteMyAccount 실패" + e.getMessage());
		}
		
		return res;
	}

}
