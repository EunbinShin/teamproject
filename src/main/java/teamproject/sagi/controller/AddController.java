package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping("/add_confirm")
	public String review() {
		logger.info("실행");
		return "add/add_confirm";
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
		   
		   String saveDirPath = "D:/MyWorkspace/uploadfiles/add/";
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
	   return "redirect:/add/add_confirm";
   }
   
   @GetMapping("/add_photolist")
   public String add_photolist(Model model) {
      logger.info("실행");
      String saveDirPath = "D:/MyWorkspace/uploadfiles/add/";
      File dir = new File(saveDirPath);
      String[] fileNames = dir.list();
      model.addAttribute("fileNames", fileNames);
      return "add/add_photolist";
   }
   
   @GetMapping("/photodownload")
   public void photodownload(String photo, HttpServletResponse response) { 
		String saveDirPath = "D:/MyWorkspace/uploadfiles/add/";
		String filePath = saveDirPath + photo;

		response.setContentType("image/jpeg"); 
		try {
			photo = new String(photo.getBytes("UTF-8"), "ISO-8859-1");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""+photo+".jpg\"");
	   try {

		OutputStream os = response.getOutputStream();
		InputStream is = new FileInputStream(filePath);

		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
		
	   	} catch (IOException e) {
		e.printStackTrace();
	   	}

   }
}
