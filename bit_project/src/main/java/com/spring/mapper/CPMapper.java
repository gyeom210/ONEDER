package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.menu.CompanyVO;


public interface CPMapper {
	void cpAdd(CompanyVO cpVO);	
	public int checkLicenseExist(CompanyVO cpVO);
	List<CompanyVO> companyimg();
	List<CompanyVO> getMemberList();
	void cpdelete (@Param("name") String name);
	int companyadd(CompanyVO cpVO);
	int cpsave(CompanyVO cpVO); 
}
