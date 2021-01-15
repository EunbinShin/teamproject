package teamproject.sagi.controller;

import java.io.File;
import java.io.IOException;

import java.util.Date;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import teamproject.sagi.dto.AddDto;



@Controller
@RequestMapping("/add")
public class AddController {
	private static final Logger logger = 
			LoggerFactory.getLogger(AddController.class);
	 
	@RequestMapping("/add")
	public String content() {
		logger.info("add 실행");
		return "add/add";
	}
   
   @PostMapping("/add_upload")
   public String add_upload(AddDto add_item) {
	   String product_id = add_item.getProduct_id();
	   String product_name = add_item.getProduct_name();
	   String product_categorie = add_item.getProduct_categorie();
	   double product_price = add_item.getProduct_price();
	   double percentage_discount = add_item.getPercentage_discount();
	   String product_description = add_item.getProduct_description();
	   int available_quantity = add_item.getAvailable_quantity();
	   Date online_date = add_item.getOnline_date();
	   
	   logger.info("product_id: " + product_id);
	   logger.info("product_name: " + product_name);
	   logger.info("product_categorie: " + product_categorie);
	   logger.info("product_price: " + product_price);
	   logger.info("percentage_discount: " + percentage_discount);
	   logger.info("product_description: " + product_description);
	   logger.info("available_quantity: " + available_quantity);
	   logger.info("online_date: " + online_date);  
	   
	   MultipartFile main_button = add_item.getMain_button();
	   if(!main_button.isEmpty()) {
		   String originalFileName = main_button.getOriginalFilename();
		   String contentType = main_button.getContentType();
		   long size = main_button.getSize();
		   logger.info("originalFileName: "+originalFileName);
		   logger.info("contentType: "+contentType);
		   logger.info("size: "+size);
		   
		   String saveDirPath = "D:/MyWorkspace/uploadfiles/";
		   String fileName = new Date().getTime()+"_"+originalFileName;
		   String filePath = saveDirPath + fileName;
		   File file = new File(filePath);
		   try {
			   main_button.transferTo(file);
		   }catch (IOException e) {
			   e.printStackTrace();
		   }
	   }
	   
	   logger.info("상품 등록 완료");
	   return "redirect:/add/add";
   }
   

}
