package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
	private static final Logger logger = LoggerFactory.getLogger(ProductManageController.class);

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

		product.setBest(false);
		
		int id = pmService.getID() + 1;
		
		logger.info("product id :" + id ) ;
		
		// thubnail img
		MultipartFile thumbnail = product.getThumbnail_file();
		if (!thumbnail.isEmpty()) {
			String fileName = new Date().getTime() + "-" + thumbnail.getOriginalFilename();
			String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/thumbnail/";
			product.setThumbnail(fileName);
			String filePath = saveDirPath + fileName;
			File file = new File(filePath);
			try {
				thumbnail.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// thumbnailhover img
		MultipartFile thumbnailhover = product.getThumbnailhover_file();
		if (!thumbnailhover.isEmpty()) {
			String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/thumbnailhover/";
			String fileName = new Date().getTime() + "-" + thumbnailhover.getOriginalFilename();

			product.setThumbnailhover(fileName);

			String filePath = saveDirPath + fileName;
			File file = new File(filePath);
			try {
				thumbnailhover.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// main_img
		MultipartFile main_img = product.getMain_img_file();
		if (!main_img.isEmpty()) {
			String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/main/";
			String fileName = new Date().getTime() + "-" + main_img.getOriginalFilename();
			product.setMain_img(fileName);
			String filePath = saveDirPath + fileName;
			File file = new File(filePath);
			try {
				main_img.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		

		 MultipartFile[] files = new MultipartFile[3];
		 files[0] = product.getSub1_img_file(); 
		 files[1] = product.getSub2_img_file(); 
		 files[2] = product.getSub3_img_file();
		 
		 String []fileNames = new String[3];
		 
		 for(int i = 0 ; i < 3; i++) { 
			 if(!files[i].isEmpty()) { 
				 String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/sub/";
				 fileNames[i] = new Date().getTime() + "-" + files[i].getOriginalFilename();
				 logger.info(fileNames[i]);

				 if(i == 0) {
					 product.setSub1_img(fileNames[i]);
				 } else if (i == 1) {
					 product.setSub2_img(fileNames[i]);
				 } else {
					 product.setSub3_img(fileNames[i]);
				 }
				 
				String filePath = saveDirPath + fileNames[i]; 
				File file = new File(filePath);
				
				try {
					files[i].transferTo(file); 
				} catch (IOException e) {
					e.printStackTrace(); } 
			}
		 }
		 
		logger.info("상품 등록 완료");

		pmService.saveproduct(product);
		
		return "redirect:/product_manage/add/add_confirm2?product_id="+product.getProduct_id();
	}
	
	@RequestMapping("/add/add_confirm2")
	public String add_confirm2(String product_id, Model model) {
		logger.info(product_id);
		ProductDto pDto = pmService.getProduct(product_id);
		model.addAttribute("pDto", pDto);
		return "product_manage/add/add_confirm2";
	}
	
		//////////////////////
	
	/*
	@GetMapping("/edit/edit_product")
	public String edit_productForm(String product_id, ProductDto product, Model model) {
		logger.info("edit_product 실행 중");
		ProductDto pmDto = pmService.getAllProduct(product_id);
		logger.info(pmDto.getMain_img());
		model.addAttribute("pmDto", pmDto);
		
		
		return "product_manage/edit/edit_product";
	}
	
	
	///////////////////////////////
	
	@PostMapping("/edit/edit_product")
	public String edit_product(ProductDto pmDto) {
		
		String product_id = pmDto.getProduct_id();

		MultipartFile thumbnail = pmDto.getThumbnail_file();
		 if (!thumbnail.isEmpty()) { 
			 String fileName = new Date().getTime() + "-" + thumbnail.getOriginalFilename(); 
		 
			 String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id + "/thumbnail/";
			 pmDto.setThumbnail(fileName); 
			 String filePath = saveDirPath + fileName;
			 File file = new File(filePath); 
			 
			 try {  
				 thumbnail.transferTo(file); 
			 } catch (IOException e) {
				 e.printStackTrace(); 
			 } 
		 }
		 
		// thumbnailhover img
			MultipartFile thumbnailhover = pmDto.getThumbnailhover_file();
			if (!thumbnailhover.isEmpty()) {
				String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id + "/thumbnailhover/";
				String fileName = new Date().getTime() + "-" + thumbnailhover.getOriginalFilename();

				pmDto.setThumbnailhover(fileName);

				String filePath = saveDirPath + fileName;
				File file = new File(filePath);
				try {
					thumbnailhover.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			// main_img
			MultipartFile main_img = pmDto.getMain_img_file();
			if (!main_img.isEmpty()) {
				String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id + "/main/";
				String fileName = new Date().getTime() + "-" + main_img.getOriginalFilename();
				pmDto.setMain_img(fileName);
				String filePath = saveDirPath + fileName;
				File file = new File(filePath);
				try {
					main_img.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			

			 MultipartFile[] files = new MultipartFile[3];
			 files[0] = pmDto.getSub1_img_file(); 
			 files[1] = pmDto.getSub2_img_file(); 
			 files[2] = pmDto.getSub3_img_file();
			 
			 String []fileNames = new String[3];
			 
			 for(int i = 0 ; i < 3; i++) { 
				 if(!files[i].isEmpty()) { 
					 String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id + "/sub/";
					 fileNames[i] = new Date().getTime() + "-" + files[i].getOriginalFilename();
					 logger.info(fileNames[i]);

					 if(i == 0) {
						 pmDto.setSub1_img(fileNames[i]);
					 } else if (i == 1) {
						 pmDto.setSub2_img(fileNames[i]);
					 } else {
						 pmDto.setSub3_img(fileNames[i]);
					 }
					 
					String filePath = saveDirPath + fileNames[i]; 
					File file = new File(filePath);
					
					try {
						files[i].transferTo(file); 
					} catch (IOException e) {
						e.printStackTrace(); } 
				}
			 }
		 
		
		
		pmService.edit(pmDto); 
		logger.info("수정수정 실행 중");
		return "product_manage/edit/edit_product";
	}
	
	
	@GetMapping("/edit/edit_thumbphoto")
	public void edit_thumbphoto(String product_id, HttpServletResponse response) throws Exception {
		
		ProductDto pmDto = pmService.getAllProduct(product_id);
		
		String photo_name = pmDto.getThumbnail();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/thumbnail/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/edit/edit_thumbhoverphoto")
	public void edit_thumbhoverphoto(String product_id, HttpServletResponse response) throws Exception {
		
		ProductDto pmDto = pmService.getAllProduct(product_id);
		
		String photo_name = pmDto.getThumbnailhover();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/thumbnailhover/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/edit/edit_mainphoto")
	public void edit_mainphoto(String product_id, HttpServletResponse response) throws Exception {
		ProductDto pmDto = pmService.getAllProduct(product_id);
		
		String photo_name = pmDto.getMain_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/main/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/edit/edit_sub1photo")
	public void edit_sub1photo(String product_id, HttpServletResponse response) throws Exception {
		
		ProductDto pmDto = pmService.getAllProduct(product_id);
		
		String photo_name = pmDto.getSub1_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/sub/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
		
	}
	
	@GetMapping("/edit/edit_sub2photo")
	public void edit_sub2photo(String product_id, HttpServletResponse response) throws Exception {
		
		ProductDto pmDto = pmService.getAllProduct(product_id);
		
		String photo_name = pmDto.getSub2_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/sub/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/edit/edit_sub3photo")
	public void edit_sub3photo(String product_id, HttpServletResponse response) throws Exception {
		
		ProductDto pmDto = pmService.getAllProduct(product_id);
		
		String photo_name = pmDto.getSub3_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/sub/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/edit/delete_product")
	public String boarddelete(String product_id) {
		logger.info("product_id");
		pmService.deleteProduct(product_id);
		return "redirect:/";
	}
	
	
	
	/*
	

	

	/*
	
	@RequestMapping("/add/add_confirm")
	public String review(String product_id, Model model) {
		logger.info("add confirm 실행");
		logger.info(product_id+" 실행");
		model.addAttribute("product_id", product_id);
		return "product_manage/add/add_confirm";
	}
	
   @RequestMapping("add/add_photolist")
   public String add_photolist(Model model, String product_id) {
      logger.info("실행");
      logger.info(product_id);
      String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + product_id +"/thumbnail/";
      logger.info(saveDirPath);
      File dir = new File(saveDirPath);
      String[] fileNames = dir.list();
      model.addAttribute("product_id", product_id);
      model.addAttribute("fileNames", fileNames);
      return "product_manage/add/add_photolist";
   }
	
	*/
	
	

}
