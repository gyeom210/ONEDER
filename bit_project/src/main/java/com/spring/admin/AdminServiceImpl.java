package com.spring.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CPMapper;
import com.spring.mapper.PartnerMapper;
import com.spring.menu.CompanyVO;
import com.spring.partner.PartnerVO;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired 
	SqlSession sqlSession;

	@Override
	public List<CompanyVO> getMemberList() {
		List<CompanyVO> memberList = null;
		CPMapper cpMapper = sqlSession.getMapper(CPMapper.class);
		memberList = cpMapper.getMemberList();

		System.out.println("memberList = " + memberList);

		return memberList;
	}

	@Override
	public List<PartnerVO> getPartnerinfo() {
		List<PartnerVO> partnerinfo = null;
		PartnerMapper partnerMapper = sqlSession.getMapper(PartnerMapper.class);
		partnerinfo = partnerMapper.getPartnerinfo();

		System.out.println("partnerinfo = " + partnerinfo);

		return partnerinfo;
	}


	@Override
	public void ptdelete(String name) throws Exception {
		try {
			PartnerMapper partnerMapper = sqlSession.getMapper(PartnerMapper.class);
			partnerMapper.ptdelete(name);
		}catch (Exception e) {
			throw new Exception("회원 삭제 실패.", e);
		}
	}
	@Override
	public int partneradd(PartnerVO partnerVO) {

		int res = -1;
		int partner = 0;
		try {
			PartnerMapper partnerMapper = sqlSession.getMapper(PartnerMapper.class);
			partner = partnerMapper.partneradd(partnerVO);
			if (partner != 0) {
				res = 1; // 변경됨

			} else { //
				res = 0; // 변경 안됨

			}
			System.out.println("서비스 impl res = " + res);
		} catch (Exception e) {
			System.out.println("서비스 impl에서 오류 => " + e.getMessage());
		}
		return res;
	}
	
	@Override
	public void cpdelete(String name) throws Exception {
		try {
			CPMapper cpMapper = sqlSession.getMapper(CPMapper.class);
			cpMapper.cpdelete(name);
		}catch (Exception e) {
			throw new Exception("회원 삭제 실패.", e);
		}
	}
	@Override
	public int companyadd(CompanyVO cpVO) {

		int res = -1;
		int company = 0;
		try {
			CPMapper cpMapper = sqlSession.getMapper(CPMapper.class);
			company = cpMapper.companyadd(cpVO);
			if (company != 0) {
				res = 1; // 변경됨

			} else { //
				res = 0; // 변경 안됨

			}
			System.out.println("서비스 impl res = " + res);
		} catch (Exception e) {
			System.out.println("서비스 impl에서 오류 => " + e.getMessage());
		}
		return res;
	}
	
	@Override
	public int ptsave(PartnerVO partnerVO)  {
		
		int res = -1;
		int partner = 0;
		try {
			PartnerMapper partnerMapper = sqlSession.getMapper(PartnerMapper.class);
			partner = partnerMapper.ptsave(partnerVO); 
			if (partner != 0) {
				res = 1; // 변경됨

			} else { //
				res = 0; // 변경 안됨

			}
			System.out.println("서비스 impl res = " + res);
		} catch (Exception e) {
			System.out.println("서비스 impl에서 오류 => " + e.getMessage());
		}
		return res;
	}
	@Override
	public int cpsave(CompanyVO cpVO) {
		
		int res = -1;
		int company = 0;
		try {
			CPMapper cpMapper = sqlSession.getMapper(CPMapper.class);
			company = cpMapper.cpsave(cpVO); 
			if (company != 0) {
				res = 1; // 변경됨

			} else { 
				res = 0; // 변경 안됨

			}
			System.out.println("서비스 impl res = " + res);
		} catch (Exception e) {
			System.out.println("서비스 impl에서 오류 => " + e.getMessage());
		}
		return res;
	}

}
