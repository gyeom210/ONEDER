package com.spring.account;

import com.spring.member.MemberVO;

public interface AccountService {
	public int checkPW(MemberVO membervo);
	public int deleteMyAccount(String email);
}
