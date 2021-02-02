package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import teamproject.sagi.dto.MypageDto;
import teamproject.sagi.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Resource
	private MyPageService mpService;
	

		
	@GetMapping("/mypage")
	public String edit_userForm(String id, MypageDto mypage, Model model) {
		logger.info("마이페이지실행 중 / 정보 읽기");		

		logger.info("id :      " + id);
		
		MypageDto mpDto = mpService.getAllUserInfo(id);
		
		String photo = mpDto.getProfile_image();
		
		logger.info("사진 이름 : " + photo );
		
		logger.info("마이페이지 실행 성공 ");
		model.addAttribute("mpDto", mpDto);
		
		return "mypage/mypage";
	}
	
	@GetMapping("/edit_photo_file")
	public void edit_userForm(String id, HttpServletResponse response) throws Exception {
		logger.info("프로필 사진 가져오기");
		MypageDto mpDto = mpService.getAllUserInfo(id);
		
		String photo_name = mpDto.getProfile_image();
		logger.info("photo name123123: " + photo_name );
		String filePath =  "D:/MyWorkspace/uploadfiles/users/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
		
		logger.info("프로필 사진 가져오기 성공 :)");
	}	
	
	@PostMapping("/mypage")
	public String mypage(MypageDto mpDto) {
		logger.info("마이페이지 수정");
		
		String id = mpDto.getId();
		String img = mpDto.getProfile_image();
		logger.info("아이디 : " + id);
		logger.info("profile_image :" + img);
		
		MultipartFile profile_image = mpDto.getPhoto_file();
		 if (!profile_image.isEmpty()) { 
			 String fileName = new Date().getTime() + "-" + profile_image.getOriginalFilename();
			 String saveDirPath = "D:/MyWorkSpace/uploadfiles/users/";
			 mpDto.setProfile_image(fileName); 
			 
			 logger.info("   :" + mpDto.getProfile_image());
			 String filePath = saveDirPath + fileName;
			 File file = new File(filePath); 
			 
			 try {  
				 profile_image.transferTo(file); 
			 } catch (IOException e) {
				 e.printStackTrace(); 
			 } 
		 } 
		
		
		 mpService.edit(mpDto); 
		
		logger.info("마이페이지 수정 성공 ");
		return "redirect:/";
	}

}
