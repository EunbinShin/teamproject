package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.sagi.dto.ItemDetailDto;

@Controller
@RequestMapping("/item_list")
public class ItemDetailController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ItemDetailController.class);
	
	@RequestMapping("/item_detail/product01") // 상품으로 가기
	public String product01(String item, Model model, ItemDetailDto itemdetail) {
		itemdetail.setProduct_name("이름1");
		itemdetail.setProduct_detail("상세설명임");
		itemdetail.setProduct_price(21000);
		itemdetail.setPercentage_discount(15);
		itemdetail.setAvailable_quantity(4);
		model.addAttribute("quantity", itemdetail.getAvailable_quantity());
		model.addAttribute("discount", itemdetail.getPercentage_discount());
		model.addAttribute("detail", itemdetail.getProduct_detail());
		model.addAttribute("name", itemdetail.getProduct_name());
		model.addAttribute("price", itemdetail.getProduct_price());
		logger.info(item+"실행");
		model.addAttribute("item", item);
		return "item_list/item_detail/product01";
	}
	
	/*
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
	}*/	
	
}
