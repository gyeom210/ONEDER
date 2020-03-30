package com.spring.menu;

import java.util.List;

public interface CPService {
	public void cpAdd(CompanyVO cpVO) throws Exception ;	
	public int checkLicenseExist(CompanyVO cpVO) throws Exception;
	public List<CompanyVO> companyimg() throws Exception;
	}
