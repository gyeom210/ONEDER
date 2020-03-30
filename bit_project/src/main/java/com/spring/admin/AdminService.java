package com.spring.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.menu.CompanyVO;
import com.spring.partner.PartnerVO;
import com.spring.product.ProductVO;

public interface AdminService {
	public List<CompanyVO> getMemberList();   //admin에서 memberList 뽑음.
	public int cpsave(CompanyVO cpVO);
	public List<PartnerVO> getPartnerinfo();   //admin에서 memberList 뽑음.
	public int ptsave(PartnerVO partnerVO);   
	public void ptdelete(@Param("name") String name) throws Exception;
	public void cpdelete(@Param("name") String name) throws Exception;
	public int partneradd(PartnerVO partnerVO); 
	public int companyadd(CompanyVO cpVO); 
}
