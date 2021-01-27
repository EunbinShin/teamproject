package teamproject.sagi.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import teamproject.sagi.dto.SignupDto;
import teamproject.sagi.dto.UserDto;



@Controller
@RequestMapping("/signup")
public class SignupController {
	private static final Logger logger = 
			LoggerFactory.getLogger(SignupController.class);
	 
	@RequestMapping("/signup")
	public String content() {
		logger.info("signup 실행");
		return "signup/signup";
	}
	
	@PostMapping("/fileupload")
	public String fileupload(UserDto user) {
		
		String uname = user.getUname();
		String uid = user.getUid();
		String upassword = user.getUpassword();
		String uemail = user.getUemail();
		logger.info("NAME: " + uname);
		logger.info("ID: " + uid);
		logger.info("PASSWORD: " + upassword);
		logger.info("EMAIL: " + uemail);
		
		MultipartFile uphoto = user.getUphoto();
		
		String originalFileName = uphoto.getOriginalFilename();
		String saveFile = "D:/MyWorkspace/uploadfiles/users/"+uid+"/";		
		String fileName = new Date().getTime() + "-" + originalFileName;
		String filePath = saveFile + fileName;
		File file = new File(filePath);
		try {
			uphoto.transferTo(file);
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/login/";
	}
	
   @RequestMapping("/signup_form")
   public String signup_form(SignupDto dto ) {
	   logger.info("uname:" +  dto.getUname());
	   logger.info("uid:" +  dto.getUid());
	   logger.info("upassword:" +  dto.getUpassword());
	   logger.info("uemail:" +  dto.getUemail());   	   
	   return "signup/signup";
   }
}
