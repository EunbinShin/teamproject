package teamproject.sagi.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import teamproject.sagi.dto.ListPager;
import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.service.ItemListService;

@Controller
@RequestMapping("/item_list")
public class ItemListController {
	private static final Logger logger = LoggerFactory.getLogger(ItemListController.class);
	
	@Resource
	private ItemListService itemListService;
	
	@RequestMapping("/default")
	public String content(
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="0") int ordertype,
			@RequestParam(defaultValue="0") int category,
			Model model) {
		logger.info("실행");
		int totalRows = 0;
		if(category == 0) {
			totalRows = itemListService.getTotalRows();
		}else {
			totalRows = itemListService.getTotalRows(category);
		}
		logger.info(totalRows+"행");
		
		ListPager pager = new ListPager(16, 10, totalRows, page, ordertype,category);
		List<ProductDto> products = itemListService.getItemList(pager);
		
		model.addAttribute("products", products);
		model.addAttribute("pager", pager);
		model.addAttribute("page", page);
		model.addAttribute("total_products", products.size());
		return "item_list/item_list";
	}
	
	@RequestMapping("/itemDetail")
	public String itemDetail() {
		logger.info("실행");
		return "redirect:/";
	}
	
	//thumbnail이미지 가져옴
	@GetMapping("/thumbnail")
	public void thumbnail(
			int id,
			HttpServletResponse response) throws IOException {
		
		String image = itemListService.getThumbnail(id);
		String filePath = "D:/MyWorkspace/uploadfiles/add/"
				+id+"/thumbnail/"+image;
			
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	//thumnail-hover이미지 가져옴
	@GetMapping("/thumbnail_hover")
	public void thumbnail_hover(
			int id,
			HttpServletResponse response) throws IOException {
		String image = itemListService.getThumbnailHover(id);
		String filePath = "D:/MyWorkspace/uploadfiles/add/"
				+id+"/thumbnailhover/"+image;
			
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
}
