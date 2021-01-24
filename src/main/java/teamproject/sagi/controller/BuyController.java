package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/buy")
public class BuyController {
	private static final Logger logger 
	= LoggerFactory.getLogger(BuyController.class);
	
	@RequestMapping("/buy_product")
	public String wishlist() {
		logger.info("실행");
		return "buy/buy_product";
	}
	
	@RequestMapping("/buy_action")
	public String buy_action(
			String receiver , String address, String rcellphone, 
			String name, String email, String cellphone){
		logger.info("receiver : " + receiver);
		logger.info("address: " + address);
		logger.info("rcellphone: " + rcellphone);
		logger.info("name: " + name);
		logger.info("email: " + email);
		logger.info("cellphone: " + cellphone);
		return "redirect:/";
	}

	
}
