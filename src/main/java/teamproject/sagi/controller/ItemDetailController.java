package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item_detail")
public class ItemDetailController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ItemDetailController.class);
	
	@RequestMapping("/gotoHome") // 홈페이지로 가기
	public String gotoHome() {
		logger.info("실행");
		return "redirect:/index";
	}
	
	@RequestMapping("/product01") // 상품으로 가기
	public String product01() {
		logger.info("실행");
		return "item_detail/product01";
	}
	
	@RequestMapping("/product02") // 상품으로 가기
	public String product02() {
		logger.info("실행");
		return "item_detail/product02";
	}
	
	@RequestMapping("/product03") // 상품으로 가기
	public String product03() {
		logger.info("실행");
		return "item_detail/product03";
	}
	
	@RequestMapping("/product04") // 상품으로 가기
	public String product04() {
		logger.info("실행");
		return "item_detail/product04";
	}
			
	
}
