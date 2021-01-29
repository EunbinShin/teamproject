package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Generated;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.sagi.dto.ItemDetailDto;
import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.service.SearchService;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Resource
	private SearchService searchService;
	
	@RequestMapping("/")
	public String content() {
		logger.info("실행");
		return "index";
	}
	
	@GetMapping("/slider")
	public String slider(Model model, String category) {
		if(category.equals("pottery")) {
			category = "도자기";
		}else if(category.equals("tablewear")) {
			category = "식기";
		}else {
			category = "유리 그릇";
		}
		logger.info(category +"실행");
		
		List<ProductDto> products = searchService.findSliderItem(category);
		logger.info(products.size()+"");
		model.addAttribute("products", products);
		return "include/test_slider";
	}
	
	@GetMapping("/thumbnail")
	public void thumbnail(
			String id,
			String image,
			HttpServletResponse response) throws IOException {
		
		String filePath = "D:/MyWorkspace/uploadfiles/add/"
				+id+"/thumbnail/"+image;
			
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
}
