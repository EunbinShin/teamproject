package teamproject.sagi.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import teamproject.sagi.dto.ListPager;
import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.service.ItemListService;

@Controller
@RequestMapping("/item_list")
public class BestItemListController {
	private static final Logger logger = LoggerFactory.getLogger(BestItemListController.class);
	
	@Resource
	private ItemListService itemListService;
	
	@RequestMapping("/bestitems")
	public String content(
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="0") int ordertype,
			@RequestParam(defaultValue="0") int category,
			Model model) {
		logger.info(page+"페이지 실행");
		
		int totalRows = 0;
		
		if(category == 0) {
			totalRows = itemListService.getTotalBestRows();
		}else {
			totalRows = itemListService.getTotalBestRows(category);
		}
		logger.info(totalRows+"행");
		
		ListPager pager = new ListPager(16, 10, totalRows, page, ordertype, category);
		List<ProductDto> products = itemListService.getBestItemList(pager);
		
		model.addAttribute("products", products);
		model.addAttribute("pager", pager);
		model.addAttribute("page", page);
		model.addAttribute("total_products", products.size());
		return "item_list/bestitem_list";
	}
}
