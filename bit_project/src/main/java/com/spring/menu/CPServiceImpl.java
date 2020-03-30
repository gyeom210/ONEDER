package com.spring.menu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CPMapper;

@Service 
public class CPServiceImpl implements CPService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void cpAdd(CompanyVO cpVO) throws Exception {
		try {
			CPMapper cpMapper = sqlSession.getMapper(CPMapper.class);
			cpMapper.cpAdd(cpVO);
		} catch (Exception e) {
			throw new Exception("어린이집 가입 실패.", e);
		}
	
	}

	//사업자 번호 중복 체크
		@Override
		public int checkLicenseExist(CompanyVO cpVO) throws Exception{
			CPMapper cpMapper = sqlSession.getMapper(CPMapper.class);
			int result = cpMapper.checkLicenseExist(cpVO);
					System.out.println("select결과="+result);
			return result;		
		} 
	
	@Override
	public List<CompanyVO> companyimg() throws Exception {
		List<CompanyVO> list = null;
		try {
			CPMapper cpMapper = sqlSession.getMapper(CPMapper.class);
			list = cpMapper.companyimg();
			System.out.println(list.size());
		} catch (Exception e) {
			throw new Exception("필터설정 후 스크롤 실패.", e);
		}
		return list;
	}

}