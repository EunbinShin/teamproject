package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item_list")
public class BestItemListController {
	private static final Logger logger = LoggerFactory.getLogger(BestItemListController.class);
	
	@RequestMapping("/bestitems")
	public String content(int page, Model model) {
		logger.info(page+" 실행");
		model.addAttribute("page", page);
		return "item_list/bestitem_list";
	}
}
