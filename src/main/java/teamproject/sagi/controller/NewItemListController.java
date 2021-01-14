package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item_list")
public class NewItemListController {
	private static final Logger logger = LoggerFactory.getLogger(NewItemListController.class);
	
	@RequestMapping("/newitem_list")
	public String content() {
		logger.info("실행");
		return "item_list/newitem_list";
	}
}
