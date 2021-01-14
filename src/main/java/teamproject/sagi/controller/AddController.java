package teamproject.sagi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.AddDto;

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
	
   @RequestMapping("/add_item")
   public String add_item(AddDto dto ) {
	   logger.info("product_id:" +  dto.getProduct_id());
	   logger.info("product_categorie:" +  dto.getProduct_categorie());
	   logger.info("product_price:" +  dto.getProduct_price());
	   logger.info("percentage_discount:" +  dto.getPercentage_discount());
	   logger.info("product_description:" +  dto.getProduct_description());
	   logger.info("available_quantity:" +  dto.getAvailable_quantity());
	   logger.info("online_date:" +  dto.getOnline_date());
	   logger.info("filebutton:" +  dto.getFilebutton());		   	   
	   return "add/add";
   }
}
