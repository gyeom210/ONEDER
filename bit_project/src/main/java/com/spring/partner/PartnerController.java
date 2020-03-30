package com.spring.partner;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class PartnerController {
	
	@Autowired(required = false)
	private PartnerService service;

	
	@RequestMapping(value = "/partner.ms")
	public String partner(Model model) {

		return "partner";
	}
	
	@RequestMapping("/partnerAddProcess.se")
	public String partnerAddProcess(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		PartnerVO ptVO = new PartnerVO();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		
		try {
			//홈페이지에 있는데이터를 ptVO에 넣어 놨어요
			
			ptVO.setLicense_num(request.getParameter("license_num"));
			ptVO.setName(request.getParameter("name"));	
			ptVO.setContent(request.getParameter("content"));
			ptVO.setPhone(request.getParameter("phone"));
			ptVO.setEmail(request.getParameter("email"));
			ptVO.setHomepage(request.getParameter("homepage"));
			ptVO.setPostal_num(Integer.parseInt(request.getParameter("postal_num")));
			ptVO.setAddress(request.getParameter("address"));
			ptVO.setAddress_detail(request.getParameter("address_detail"));
			ptVO.setCategory(request.getParameter("category"));

			ptVO.setTerm(request.getParameter("term"));
			

			/* System.out.println(request.getParameter("postal_num")); */
			
			
			MultipartFile ptmf = request.getFile("img"); // 파일
		
			
			String uploadPath = "/Users/nagyeom/upload/";
			String originalFileExtension = ptmf.getOriginalFilename().substring(ptmf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			ptVO.setImg(storedFileName);
					if (ptmf.getSize() != 0) {
						ptmf.transferTo(new File(uploadPath + storedFileName));
					}
					
			//사업자 번호 중복 체크
			int result =service.ptcheckLicenseExist(ptVO);
			
			if(result == 1) {
				/* System.out.println("가입실패"); */
				writer.write("<script>alert('사업자 번호를 확인해주세요.'); location.href='partner.ms';</script>");
				
			}else{
				/* System.out.println("가입성공"); */
				writer.write("<script>alert('가입성공.'); location.href='partner.ms';</script>");
				service.ptAdd(ptVO);
			}

		}
	catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
		return null;

	}
	
}