package teamproject.sagi.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.sagi.dto.UserDto;

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
	public String login(
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			UserDto user,boolean ucheck) {
		logger.info("로그인 실행");
		logger.info(user.getUid()+" is ID");
		logger.info(user.getUpassword()+" is pw");
		logger.info(ucheck+"");
		
		
		if(ucheck == true) {
			//아이디 기억하기가 true이면 쿠키를 생성
			logger.info("쿠키생성");
			Cookie idCookie = new Cookie("ID", user.getUid());
			response.addCookie(idCookie);
			session.setAttribute("remerberID", "checked");
		}else {
			//아이디 기억하기가 false이면 쿠키를 지움
			Cookie idCookie = new Cookie("ID", null);
			response.addCookie(idCookie);
			session.removeAttribute("remerberID");
		}
		
		if(user.getUid().equals("admin") && user.getUpassword().equals("12345")) {
			session.setAttribute("loginStatus", "admin");
		}else {
			session.setAttribute("loginStatus", user.getUid());
		}
			
		if(user.getUid().length() != 0 && user.getUpassword().length() != 0) {	//만약 폼이 맞으면
			return "redirect:/";
		}else {
			return "redirect:/login/";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login/";
	}
}
