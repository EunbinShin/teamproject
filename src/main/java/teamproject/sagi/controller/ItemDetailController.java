package teamproject.sagi.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.sagi.dto.ItemDetailDto;

@Controller
@RequestMapping("/item_list")
public class ItemDetailController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ItemDetailController.class);
	
	@RequestMapping("/item_detail/product01") // 상품으로 가기
	public String product01() {
		logger.info("실행");
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
		
	// HttpSession과 DTO를 이용하여 위시리스로 정보를 보내기
	@PostMapping("/wishlist")
	public String wishlist(ItemDetailDto item, HttpSession session, String customer) {
		customer = (String) session.getAttribute("logoutStatus");
		logger.info("실행");
		logger.info("상품번호" + item.getProduct_id());
		logger.info("상품이름" + item.getProduct_name());
		logger.info("상품카테고리" + item.getProduct_categorie());
		logger.info("상품가격" + item.getProduct_price());
		logger.info("상품할인율" + item.getPercentage_discount());
		logger.info("상품갯수" + item.getAvailable_quantity());
		return "redirect:/wishlist/wishlist";
	}

	
	
}
