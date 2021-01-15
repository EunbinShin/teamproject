package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.SignupDto;

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
	
   @RequestMapping("/signup_form")
   public String signup_form(SignupDto dto ) {
	   logger.info("uname:" +  dto.getUname());
	   logger.info("uid:" +  dto.getUid());
	   logger.info("upassword:" +  dto.getUpassword());
	   logger.info("uemail:" +  dto.getUemail());   	   
	   return "signup/signup";
   }
}
