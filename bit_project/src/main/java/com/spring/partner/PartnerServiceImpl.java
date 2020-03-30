package com.spring.partner;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PartnerMapper;

@Service
public class PartnerServiceImpl implements PartnerService {
	
	@Autowired
	SqlSession sqlsession;

	@Override
	public List<PartnerVO> getChartjson() {
		List<PartnerVO> partnerList = null;
		PartnerMapper partnerMapper = sqlsession.getMapper(PartnerMapper.class);
		partnerList = partnerMapper.getPartnerList();
		
		System.out.println("partnerList = " + partnerList.size());
		return partnerList;
	}
	
	
	@Override
	public void ptAdd(PartnerVO ptVO) throws Exception {
		try {
			PartnerMapper partnerMapper = sqlsession.getMapper(PartnerMapper.class);
			partnerMapper.ptAdd(ptVO);
		} catch (Exception e) {
			throw new Exception("파트너 가입 실패.", e);
	}

}
	//사업자 번호 중복 체크
	@Override
	public int ptcheckLicenseExist(PartnerVO ptVO) throws Exception{
		PartnerMapper partnerMapper = sqlsession.getMapper(PartnerMapper.class);
		//int result = sqlsession.selectOne("PartnerMapper.ptcheckLicenseExist",ptVO);
		int result = partnerMapper.ptcheckLicenseExist(ptVO);
				System.out.println("select결과="+result);
		return result;		
	}
}


