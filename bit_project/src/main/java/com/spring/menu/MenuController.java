package com.spring.menu;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MenuController {

	@Autowired(required = false)
	private CPService service;

	@RequestMapping(value = "/qna.se")
	public String home(Model model) {
		
		return "qna";
	}

	@RequestMapping("/companyAddProcess.se")
	public String companyAddProcess(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		CompanyVO cpVO = new CompanyVO(); 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		try {
			//홈페이지에 있는데이터를 cpvo에 넣어 놨어요
			cpVO.setLicense_num(request.getParameter("license_num"));
			cpVO.setName(request.getParameter("name"));		
			cpVO.setPhone(request.getParameter("phone"));		
			cpVO.setEmail(request.getParameter("email"));
			cpVO.setHomepage(request.getParameter("homepage"));
			cpVO.setPostal_num(Integer.parseInt(request.getParameter("postal_num")));
			cpVO.setAddress(request.getParameter("address"));
			cpVO.setAddress_detail(request.getParameter("address_detail"));
			
			cpVO.setTerm(request.getParameter("term"));
			

			System.out.println(request.getParameter("postal_num"));		
			
			
			MultipartFile mf = request.getFile("img"); // 파일					
		
			
			String uploadPath = "/Users/nagyeom/upload/";
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			cpVO.setImg(storedFileName);
					if (mf.getSize() != 0) {
						// mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
						mf.transferTo(new File(uploadPath + storedFileName));
					}
			//사업자 번호 중복 체크
			int result =service.checkLicenseExist(cpVO);
			
			if(result == 1) {
				/*System.out.println("가입실패");*/
				writer.write("<script>alert('사업자 번호를 확인해주세요.'); location.href='kindergarten.ms';</script>");
				
			}else{
				/*System.out.println("가입성공");*/
				writer.write("<script>alert('가입성공.'); location.href='kindergarten.ms';</script>");
				service.cpAdd(cpVO);
			}
			
		} 
	catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
		return null;
				
	}
	
	@RequestMapping("/kindergarten.ms")
	public String kindergarten(Model model, HttpServletResponse response) throws Exception {
		List<CompanyVO> list = null; 
		try {
			list = service.companyimg();			
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
					
		}
		return "kindergarten";
	}
	
}
