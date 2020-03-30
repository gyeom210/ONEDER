package com.spring.writing;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.community.CommunityService;

@Controller
public class WritingController {
	
	@Autowired
	private WritingService writingService;
	@Autowired(required = false)
	private CommunityService communityService;
	
	@RequestMapping(value = "/co_writeForm.co", method = RequestMethod.GET)
	public String co_writeForm(Model model) {

		return "co_writeForm";
	}
	
	/* 글쓰기 */
	@PostMapping("/write.cw")
	public String write(WritingVO writingvo, Model model, MultipartHttpServletRequest request) {

	String text = writingvo.getContent();
	System.out.println("게시글 내용 : " + text);
	
	Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	Matcher matcher = pattern.matcher(text);     
	
	if(matcher.find()){
		  writingvo.setImg(matcher.group(1));
	}else {
		  writingvo.setImg("null");
	}
	  
	writingvo.setCategory((request).getParameter("category"));
	writingvo.setCount(0);
	writingvo.setScrap_count(0);
	
	int res = writingService.write(writingvo);
	System.out.println(res);
	
	model.addAttribute("writingvo", writingvo);

//		return "detailtest";/*테스트  페이지*/
//		return "redirect:/getDetail.cw";
	return "redirect:community_detail.co?board_num=" + writingvo.getBoard_num();
	}
	
	/* 글 수정 폼*/
	@RequestMapping("/updateForm.cw")
	public String updateForm(Model model, HttpServletRequest request) {
		WritingVO writingvo = writingService.updateForm(Integer.parseInt(request.getParameter("board_num")));
		request.setAttribute("writingvo", writingvo);
		return "co_updateForm";
	}
	
	/* 글 수정*/
	@RequestMapping("/update.cw")
	public String update(WritingVO writingvo, Model model, HttpServletRequest request) {
		int res = 0;
		
		String text = writingvo.getContent();
		System.out.println("수정할 게시글 내용 : " + text);
		
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
		Matcher matcher = pattern.matcher(text);     
		
		  if(matcher.find()){
			  writingvo.setImg(matcher.group(1));
		  }else {
			  writingvo.setImg("null");
		  }
      
		res = writingService.update(writingvo);
		
		return "redirect:community_detail.co?board_num=" + writingvo.getBoard_num();
	}
	
	/*글 삭제 */
	@GetMapping("/delete.cw")
	public String delete(WritingVO writingvo, Model model, HttpServletResponse response, @RequestParam(value="board_num",required=false) int board_num) throws Exception {
		System.out.println(board_num + " board_num 게시글 삭제");
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter writer;
		try {
			writer = response.getWriter();
			communityService.deleteboarda(board_num);
			communityService.deleteboardc(board_num);
			writingService.delete(board_num);
			
			System.out.println("삭제완료");
			
			writer.write("<script>alert('게시글 삭제 완료'); location.href='community.co';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
