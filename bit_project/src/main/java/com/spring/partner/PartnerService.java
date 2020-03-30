package com.spring.partner;

import java.util.List;

public interface PartnerService {

	List<PartnerVO> getChartjson();
	public void ptAdd(PartnerVO ptVO) throws Exception ;	
	public int ptcheckLicenseExist(PartnerVO ptVO)throws Exception;
	}





