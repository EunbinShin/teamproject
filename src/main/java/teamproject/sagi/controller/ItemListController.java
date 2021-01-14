package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item_list")
public class ItemListController {
	private static final Logger logger = LoggerFactory.getLogger(ItemListController.class);
	
	@RequestMapping("/default")
	public String content() {
		logger.info("실행");
		return "item_list/item_list";
	}
	
	@RequestMapping("/itemDetail")
	public String itemDetail() {
		logger.info("실행");
		return "redirect:/";
	}
	
	@RequestMapping("/gotoHome")
	public String gotoHome() {
		logger.info("실행");
		return "redirect:/index";
	}
}
