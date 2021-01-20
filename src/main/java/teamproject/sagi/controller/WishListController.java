package teamproject.sagi.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/wishlist")
public class WishListController {
	private static final Logger logger 
	= LoggerFactory.getLogger(WishListController.class);
	
	@RequestMapping("/wishlist")
	public String wishlist(HttpSession session,String item) {
		logger.info("loginStatus "+session.getAttribute("loginStatus"));
		logger.info(item+"를 장바구니에 담았습니다");
		return "redirect:/wishlist/temp";
	}

	@RequestMapping("/temp") 
	public String temp(HttpSession session) {	 
	 logger.info("loginStatus "+session.getAttribute("loginStatus"));
	 return "/wishlist/wishlist";
	}

}
