package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.service.ProductManageService;

@Controller
@RequestMapping("/product_manage")
public class ProductManageController {
	private static final Logger logger = 
			LoggerFactory.getLogger(ProductManageController.class);

	@Resource
	private ProductManageService pmService;
	
	@RequestMapping("/product_content")
	public String content() {
		logger.info("product content 실행");
		return "product_manage/product_content";
	}
	
	@GetMapping("/add/add_upload")
	public String addForm() {
		return "product_manage/add/add_upload";
	}
	
	@PostMapping("/add/add_upload")
	public String add_upload(ProductDto product, HttpSession session) {
		
		//thubnail img
		MultipartFile thumbnail = product.getThumbnail_file();
		
		String id = product.getProduct_id();
		
		if(!thumbnail.isEmpty()) {	
		   String fileName = new Date().getTime() + "-" + thumbnail.getOriginalFilename();
		   String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/thumbnail/";
		   product.setThumbnail(fileName);
		   String filePath = saveDirPath + fileName;
		   File file = new File(filePath);
		   try {
			   thumbnail.transferTo(file);
		   }catch (IOException e) {
			   e.printStackTrace();
		   }
	    }
	    
	    //thumbnailhover img
	    MultipartFile thumbnailhover = product.getThumbnailhover_file();
	    if(!thumbnailhover.isEmpty()) {	   
		   String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id +  "/thumbnailhover/";
		   String fileName = new Date().getTime()+"-"+thumbnailhover.getOriginalFilename();
		   
		   product.setThumbnailhover(fileName);
		   
		   String filePath = saveDirPath + fileName;
		   File file = new File(filePath);
		   try {
			   thumbnailhover.transferTo(file);
		   }catch (IOException e) {
			   e.printStackTrace();
		   }
	    }
	    
	    //main_img
	    MultipartFile main_img = product.getMain_img_file();
	   if(!main_img.isEmpty()) {
		   String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id+ "/main/";
		   String fileName = new Date().getTime()+ "-" + main_img.getOriginalFilename();
		   product.setMain_img(fileName);
		   String filePath = saveDirPath + fileName;
		   File file = new File(filePath);
		   try {
			   main_img.transferTo(file);
		   }catch (IOException e) {
			   e.printStackTrace();
		   }
	   }
	   
		/*
		 * MultipartFile[] files = new MultipartFile[3];
		 * 
		 * files[0] = product.getSub1_img(); files[1] = product.getSub2_img(); files[2]
		 * = product.getSub3_img();
		 * 
		 * for(int i = 0 ; i < 3; i++) { if(!files[i].isEmpty()) { String name = "sub" +
		 * i + "_img.jpg";
		 * 
		 * String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id+ "/sub/"; String
		 * fileName = new Date().getTime()+"_" + id + name; String filePath =
		 * saveDirPath + fileName; File file = new File(filePath); try {
		 * files[i].transferTo(file); }catch (IOException e) { e.printStackTrace(); } }
		 * }
		 */
	   logger.info("상품 등록 완료");
	   
	   pmService.saveproduct(product);
	   return "redirect:/";
	   
	}
	
	
	
	
	
}
