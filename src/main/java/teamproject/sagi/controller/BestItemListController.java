package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item_list")
public class BestItemListController {
	private static final Logger logger = LoggerFactory.getLogger(BestItemListController.class);
	
	@RequestMapping("/bestitem_list")
	public String content() {
		logger.info("실행");
		return "item_list/bestitem_list";
	}
}
