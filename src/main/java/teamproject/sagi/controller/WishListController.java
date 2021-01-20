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
<<<<<<< HEAD
	public String wishlist(HttpSession session,String item) {
=======
	public String wishlist(HttpSession session, String item, String quantity) {
>>>>>>> branch 'master' of https://github.com/EunbinShin/teamproject
		logger.info("loginStatus "+session.getAttribute("loginStatus"));
<<<<<<< HEAD
		logger.info(item+"를 장바구니에 담았습니다");
		return "redirect:/wishlist/temp";
=======
		logger.info(quantity);
		logger.info(item);
		return "forward:/wishlist/temp";
>>>>>>> branch 'master' of https://github.com/EunbinShin/teamproject
	}

	@RequestMapping("/temp") 
<<<<<<< HEAD
	public String temp(HttpSession session) {	 
=======
	public String wishlist(HttpSession session,  String quantity) {	 
>>>>>>> branch 'master' of https://github.com/EunbinShin/teamproject
	 logger.info("loginStatus "+session.getAttribute("loginStatus"));
	 logger.info(quantity);
	 
	 return "/wishlist/wishlist";
	}

}
