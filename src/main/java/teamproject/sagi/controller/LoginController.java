package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/")
	public String content() {
		logger.info("실행");
		return "login/login";
	}
	
	@PostMapping("/login")
	public String login() {
		logger.info("로그인 실행");
		return "redirect:/index";
	}
}
