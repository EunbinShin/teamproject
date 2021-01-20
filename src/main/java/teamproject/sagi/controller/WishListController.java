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
	= LoggerFactory.getLogger(ItemDetailController.class);
	
	@RequestMapping("/wishlist")
	public String wishlist(HttpSession session, String item, String quantity) {
		logger.info("loginStatus "+session.getAttribute("loginStatus"));
		logger.info(quantity);
		logger.info(item);
		return "forward:/wishlist/temp";
	}

	@RequestMapping("/temp") 
	public String wishlist(HttpSession session,  String quantity) {	 
	 logger.info("loginStatus "+session.getAttribute("loginStatus"));
	 logger.info(quantity);
	 
	 return "/wishlist/wishlist";
	}

}
