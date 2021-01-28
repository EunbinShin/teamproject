package teamproject.sagi.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.sagi.dto.SignupDto;
import teamproject.sagi.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource
	private LoginService loginService;
	
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
	public void login(
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			Model model,
			SignupDto user,boolean ucheck) throws IOException {
		logger.info("로그인 실행");
		logger.info(user.getId()+" is ID");
		logger.info(user.getPassword()+" is pw");
		logger.info(ucheck+"");
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		if(ucheck == true) {
			//아이디 기억하기가 true이면 쿠키를 생성
			logger.info("쿠키생성");
			Cookie idCookie = new Cookie("ID", user.getId());
			response.addCookie(idCookie);
			session.setAttribute("remerberID", "checked");
		}else {
			//아이디 기억하기가 false이면 쿠키를 지움
			Cookie idCookie = new Cookie("ID", null);
			response.addCookie(idCookie);
			session.removeAttribute("remerberID");
		}
		
		String result = loginService.login(user);
		
		
		
		logger.info("로그인 결과: "+result);
		
		if(result.equals("success")) {
			user = loginService.getUserInfo(user.getId());
			session.setAttribute("loginStatus", user);
			logger.info("결과: "+user.getName());
		}
		
		JSONObject root = new JSONObject();
		root.put("result", result);
		String json = root.toString();
		pw.println(json);
	
		pw.flush();
		pw.close();
	}
	
	@GetMapping("/profile_image")
	public void photo(String id,
			String image,
			HttpServletResponse response) throws IOException {
		
		String filePath = "D:/MyWorkspace/uploadfiles/users/"
				+image;
			
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginStatus");
		return "redirect:/login/";
	}
}
