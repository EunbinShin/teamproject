package teamproject.sagi.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import teamproject.sagi.dto.SignupDto;
import teamproject.sagi.service.SignupService;

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
	
	@Resource 
	private SignupService signupService;
	
	@PostMapping("/signup")
	public String signup(SignupDto signup) throws Exception {
		// 파일 정보 얻기 
		MultipartFile photo = signup.getPhoto();
		if(!photo.isEmpty()) {
			String saveName = new Date().getTime() + "-" + photo.getOriginalFilename();
			signup.setProfile_image(saveName);
			// 파일 저장
			File saveFile = new File("D:/MyWorkSpace/uploadfiles/users/" + saveName);
			photo.transferTo(saveFile);
		}
		signupService.signup(signup);
		return "redirect:/signup/signup";
	}
	
	@PostMapping("/idCheck")
	public void idCheck(String id, 
			HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter pw = response.getWriter();
		String idCheck = signupService.idCheck(id);
		JSONObject root = new JSONObject();
		root.put("id", idCheck);
		
		String json = root.toString();
		pw.println(json);
		
		pw.flush();
		pw.close();
	}
}
