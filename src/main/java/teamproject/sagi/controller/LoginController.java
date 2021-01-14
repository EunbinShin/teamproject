package teamproject.sagi.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/")
	public String content(
			HttpServletRequest request,
			Model model) {
		logger.info("실행");
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies) {
			if(c.getName().equals("ID") 
					&& c.getValue() != null) {
				model.addAttribute("uid", c.getValue());
				break;
			}
		}
		return "login/login";
	}
	
	@PostMapping("/login")
	public String login(HttpServletResponse response,
			HttpServletRequest request,
			String uid, String upassword,boolean ucheck) {
		logger.info("로그인 실행");
		logger.info(uid+" is ID");
		logger.info(upassword+" is pw");
		logger.info(ucheck+"");
		
		if(ucheck == true) {
			//아이디 기억하기가 true이면 쿠키를 생성
			logger.info("쿠키생성");
			Cookie idCookie = new Cookie("ID", uid);
			response.addCookie(idCookie);
		}else {
			//아이디 기억하기가 false이면 쿠키를 지움
			Cookie idCookie = new Cookie("ID", null);
			response.addCookie(idCookie);
		}
			
		if(uid.length() != 0 && upassword.length() != 0) {	//만약 폼이 맞으면
			return "redirect:/index";
		}else {
			return "redirect:/login/";
		}
		
	}
}
