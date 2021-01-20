package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item_list")
public class NewItemListController {
	private static final Logger logger = LoggerFactory.getLogger(NewItemListController.class);
	
	@RequestMapping("/newitems")
	public String content(int page, Model model) {
		logger.info(page+"페이지 실행");
		model.addAttribute("page", page);
		return "item_list/newitem_list";
	}
}
