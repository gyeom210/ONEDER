package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.partner.PartnerVO;


public interface PartnerMapper {
	List<PartnerVO> getPartnerList();
	void ptAdd(PartnerVO ptVO);	
	public int ptcheckLicenseExist(PartnerVO ptVO);
	List<PartnerVO> partnerimg();
	List<PartnerVO> getPartnerinfo();
	void ptdelete (@Param("name") String name);
	int partneradd(PartnerVO partnerVO); 
	int ptsave(PartnerVO partnerVO); 

}
