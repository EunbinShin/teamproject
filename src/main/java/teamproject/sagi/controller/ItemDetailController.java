package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
=======
>>>>>>> branch 'master' of https://github.com/EunbinShin/teamproject
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.sagi.dto.ItemDetailDto;

@Controller
@RequestMapping("/item_list")
public class ItemDetailController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ItemDetailController.class);
	
	@RequestMapping("/item_detail/product01") // 상품으로 가기
<<<<<<< HEAD
	public String product01(String item, Model model) {
		logger.info(item+" 실행");
=======
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
>>>>>>> branch 'master' of https://github.com/EunbinShin/teamproject
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
<<<<<<< HEAD
	}*/
	
	/*	
	// HttpSession과 DTO를 이용하여 위시리스로 정보를 보내기
	@PostMapping("/wishlist")
	public String wishlist( HttpSession session, String customer, String item) {
		customer = (String) session.getAttribute("logoutStatus");
		logger.info(item+": 실행");
		
		logger.info("상품번호" + item.getProduct_id());
		logger.info("상품이름" + item.getProduct_name());
		logger.info("상품카테고리" + item.getProduct_categorie());
		logger.info("상품가격" + item.getProduct_price());
		logger.info("상품할인율" + item.getPercentage_discount());
		logger.info("상품갯수" + item.getAvailable_quantity());
		return "redirect:/wishlist/wishlist";
	}*/

	
=======
	}*/	
>>>>>>> branch 'master' of https://github.com/EunbinShin/teamproject
	
}
