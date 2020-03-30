package com.spring.tazo;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MailSendController {
	@Autowired(required = false)
	private ShareService service;

	@RequestMapping(value = "/contactus_mailsend.ms")
	public String mailsend_contactus(Model model) {

		/* System.out.println("contactus_mailsend.jsp 로 보냄"); */

		return "contactus_mailsend";
	}

	@RequestMapping(value = "/contactus.ms")
	public String contactus(Model model) {

		/* System.out.println("contactus.jsp 로 보냄"); */

		return "contactus";
	}

	@RequestMapping(value = "/sellanddonation_mailsend.ms")
	public String mailsend_sellanddonation(Model model) {

		/* System.out.println("sellanddonation_mailsend.jsp 로 보냄"); */

		return "sellanddonation_mailsend";
	}

	@RequestMapping(value = "/sellanddonation.ms")
	public String sellanddonation(Model model) {

		/* System.out.println("sellanddonation.jsp 로 보냄"); */

		return "sellanddonation";
	}

	@RequestMapping(value = "/share_mailsend.ms")
	public String mailsend_share(Model model) {

		/* System.out.println("share_mailsend.jsp 로 보냄"); */

		return "share_mailsend";
	}

	@RequestMapping(value = "/share.ms")
	public String share(Model model) {

		/* System.out.println("share.jsp 로 보냄"); */

		return "share";
	}

	@RequestMapping(value = "/share_App.ms")
	public String share_application(Model model, MultipartHttpServletRequest req) {
		ShareWatingListVO shareVO = new ShareWatingListVO();
		String uploadPath = "/Users/nagyeom/upload/";
		String originalFileExtension = "";
		String storedFileName = "";
		try {
			String from = req.getParameter("consignment_end_date");
			SimpleDateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
			Date to = fm.parse(from);
			
			shareVO.setEmail(req.getParameter("email"));
			shareVO.setName(req.getParameter("name"));
			shareVO.setProduct_name(req.getParameter("product_name"));
			shareVO.setShare_content(req.getParameter("share_content"));
			shareVO.setAmount(Integer.parseInt(req.getParameter("amount")));
			shareVO.setConsignment_end_date(to);
			shareVO.setBank(req.getParameter("bank"));
			shareVO.setAccount(req.getParameter("account"));
			
			
				if (req.getFile("share_img1").getSize() != 0) {
					MultipartFile mf1 = req.getFile("share_img1"); // 파일
					originalFileExtension = mf1.getOriginalFilename().substring(mf1.getOriginalFilename().lastIndexOf("."));
					storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
					shareVO.setShare_img1(storedFileName);
					if (mf1.getSize() != 0) {
						// mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
						mf1.transferTo(new File(uploadPath + storedFileName));
					}
				/* System.out.println("mf1 :"+storedFileName); */
				}
				if (req.getFile("share_img2").getSize() != 0) {
					MultipartFile mf2 = req.getFile("share_img2"); // 파일
					originalFileExtension = mf2.getOriginalFilename().substring(mf2.getOriginalFilename().lastIndexOf("."));
					storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
					shareVO.setShare_img2(storedFileName);
					if (mf2.getSize() != 0) {
						// mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
						mf2.transferTo(new File(uploadPath + storedFileName));
					}
				/* System.out.println("mf2 :"+storedFileName); */
				}
				if (req.getFile("share_img3").getSize() != 0) {
					MultipartFile mf3 = req.getFile("share_img3"); // 파일
					originalFileExtension = mf3.getOriginalFilename().substring(mf3.getOriginalFilename().lastIndexOf("."));
					storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
					shareVO.setShare_img3(storedFileName);
					if (mf3.getSize() != 0) {
						// mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
						mf3.transferTo(new File(uploadPath + storedFileName));
					}
				/* System.out.println("mf3 :"+storedFileName); */
				}
			

			service.shareWaitingList(shareVO);
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}

		return "redirect:/share.ms";
	}

}
