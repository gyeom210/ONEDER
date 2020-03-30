package com.spring.writing;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@RestController
public class WritingAjaxController {
	@Autowired(required = false)
	private WritingService writingService;

	/* file_path 테이블 사용하여 summernote img src 경로 간단히 바꿈 . file_path delete 추가 필요 */
	@PostMapping(value = "/image.im", produces = "application/json;charset=UTF-8")
	public Map<String, Object> handleFileUpload2(@RequestParam("file") MultipartFile file, String uploadFile) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		String storedFilePath=""; 
		
		try {
				if (file.isEmpty()) {
					throw new Exception("Failed to store empty file " + file.getOriginalFilename());
				} else {
	
					String uploadPath = "/Users/nagyeom/upload/";
					String originalFileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	
					if (file.getSize() != 0) {
						// mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
						file.transferTo(new File(uploadPath + storedFileName));
						uploadFile = uploadPath + storedFileName;
						storedFilePath = "/bit_project/image/"+storedFileName;
					}
				}
//				writingService.storeFilePath(uploadFile);
				retVal.put("url", storedFilePath);
		} catch (Exception e) {
			e.printStackTrace();
			retVal.put("res", "FAIL");
	        retVal.put("message", "Failure");
		}
		return retVal;

	}

}
