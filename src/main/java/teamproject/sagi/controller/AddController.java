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
   
   @PostMapping("/add_upload")
   public String add_upload(AddDto add_item, Model model) {
	   String product_id = add_item.getProduct_id();
	   model.addAttribute("product_id", product_id);
	   String product_name = add_item.getProduct_name();
	   String product_categorie = add_item.getProduct_categorie();
	   double product_price = add_item.getProduct_price();
	   double percentage_discount = add_item.getPercentage_discount();
	   double selling_price = add_item.getProduct_price();
	   String product_description = add_item.getProduct_description();
	   int available_quantity = add_item.getAvailable_quantity();
	   Date online_date = add_item.getOnline_date();
	   
	   logger.info("product_id: " + product_id);
	   logger.info("product_name: " + product_name);
	   logger.info("product_categorie: " + product_categorie);
	   logger.info("product_price: " + product_price);
	   logger.info("percentage_discount: " + percentage_discount);
	   logger.info("selling_price: " + selling_price);  
	   logger.info("product_description: " + product_description);
	   logger.info("available_quantity: " + available_quantity);
	   logger.info("online_date: " + online_date);  
	   
	   MultipartFile thumbnail = add_item.getThumbnail();
	   if(!thumbnail.isEmpty()) {
		   String originalFileName = thumbnail.getOriginalFilename();
		   String contentType = thumbnail.getContentType();
		   long size = thumbnail.getSize();
		   logger.info("originalFileName: "+originalFileName);
		   logger.info("contentType: "+contentType);
		   logger.info("size: "+size);
		   
		   String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id+  "/thumbnail/";
		   String fileName = new Date().getTime()+"_" + product_id +"_thumbnail.jpg";
		   String filePath = saveDirPath + fileName;
		   File file = new File(filePath);
		   try {
			   thumbnail.transferTo(file);
		   }catch (IOException e) {
			   e.printStackTrace();
		   }
	   }

	   MultipartFile main_img = add_item.getMain_img();
	   if(!main_img.isEmpty()) {
		   String originalFileName = main_img.getOriginalFilename();
		   String contentType = main_img.getContentType();
		   long size = main_img.getSize();
		   logger.info("originalFileName: "+originalFileName);
		   logger.info("contentType: "+contentType);
		   logger.info("size: "+size);
		   
		   String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id+ "/main/";
		   String fileName = new Date().getTime()+"_" + product_id +"_main_img.jpg";
		   String filePath = saveDirPath + fileName;
		   File file = new File(filePath);
		   try {
			   main_img.transferTo(file);
		   }catch (IOException e) {
			   e.printStackTrace();
		   }
	   }
	   
	   MultipartFile[] files = new MultipartFile[3];

	   files[0] = add_item.getSub1_img();
	   files[1] = add_item.getSub2_img();
	   files[2] = add_item.getSub3_img();
	   
	   for(int i = 0 ; i < 3; i++) {
		   if(!files[i].isEmpty()) {
			   String originalFileName = files[i].getOriginalFilename();
			   String contentType = files[i].getContentType();
			   String name = "sub" + i + "_img.jpg";
			   long size = files[i].getSize();
			   logger.info("originalFileName: "+originalFileName);
			   logger.info("contentType: "+contentType);
			   logger.info("size: "+size);
			   
			   String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id+ "/sub/";
			   String fileName = new Date().getTime()+"_" + product_id + name;
			   String filePath = saveDirPath + fileName;
			   File file = new File(filePath);
			   try {
				   files[i].transferTo(file);
			   }catch (IOException e) {
				   e.printStackTrace();
			   }
		   }		   
	   }	   
	   
	   logger.info("상품 등록 완료");
	   return "redirect:/add/add_confirm";
   }
   
	@RequestMapping("/add_confirm")
	public String review(String product_id, Model model) {
		logger.info("add confirm 실행");
		logger.info(product_id+" 실행");
		model.addAttribute("product_id", product_id);
		return "add/add_confirm";
	}
	
   @RequestMapping("/add_photolist")
   public String add_photolist(Model model, String product_id) {
      logger.info("실행");
      logger.info(product_id);
      String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id +"/thumbnail/";
      logger.info(saveDirPath);
      File dir = new File(saveDirPath);
      String[] fileNames = dir.list();
      model.addAttribute("product_id", product_id);
      model.addAttribute("fileNames", fileNames);
      return "add/add_photolist";
   }
   
   @GetMapping("/photodownload")
   public void photodownload(String photo,String productid, HttpServletResponse response) { 
	   logger.info("실행");
	   logger.info("photo name: " + photo);
	   logger.info("product_id" +  productid);
	   String product_id = productid;
	   String thumbnail = "thumbnail";
	   String main = "main";
	   String saveDirPath;
	   
	   if(photo.indexOf(thumbnail) != -1) {
		   saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id +"/thumbnail/";
	   } else if (photo.indexOf(main) != -1) {
		   saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id + "/main/";
	   } else {
		   saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id +"/sub/";
	   }
	   
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
