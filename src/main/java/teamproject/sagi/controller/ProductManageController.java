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

	@RequestMapping("/add/add_upload")
	public String add_upload(ProductDto product, HttpSession session) {
		product.setBest(false);
		
		String thumbnail_sname = 
				new Date().getTime() + "-" + product.getThumbnail_file().getOriginalFilename();
		product.setThumbnail(thumbnail_sname);
		
		String thumbnail_hover_sname = 
				new Date().getTime() + "-" + product.getThumbnailhover_file().getOriginalFilename();
		product.setThumbnailhover(thumbnail_hover_sname);
		
		String main_sname = 
				new Date().getTime() + "-" + product.getMain_img_file().getOriginalFilename();
		product.setMain_img(main_sname);
		
		if(!product.getSub1_img_file().isEmpty()) {
			String sub1_sname = 
					new Date().getTime() + "-" + product.getSub1_img_file().getOriginalFilename();
			product.setSub1_img(sub1_sname);
		}
		
		if(!product.getSub2_img_file().isEmpty()) {
			String sub2_sname = 
					new Date().getTime() + "-" + product.getSub2_img_file().getOriginalFilename();
			product.setSub2_img(sub2_sname);
		}
		
		logger.info(product.getSub3_img_file().isEmpty() +"sub3 file name");
		
		if(!product.getSub3_img_file().isEmpty()) {
			String sub3_sname = 
					new Date().getTime() + "-" + product.getSub3_img_file().getOriginalFilename();
			product.setSub3_img(sub3_sname);
		}
		
		pmService.upload(product);
		
		int id = product.getProduct_id();
		logger.info("id: "+id);
		
		// thumbnail img
		
		String saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/thumbnail/";
		String filePath = saveDirPath + product.getThumbnail();
		File file = new File(filePath);
		try {
			product.getThumbnail_file().transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		// thumbnailhover img
		saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/thumbnailhover/";
		filePath = saveDirPath + product.getThumbnailhover();
		file = new File(filePath);
		try {
			product.getThumbnailhover_file().transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		// main_img
		saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/main/";
		filePath = saveDirPath + product.getMain_img();
		file = new File(filePath);
		try {
			product.getMain_img_file().transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		 MultipartFile[] files = new MultipartFile[3];
		 files[0] = product.getSub1_img_file(); 
		 files[1] = product.getSub2_img_file(); 
		 files[2] = product.getSub3_img_file();
		 for(int i = 0 ; i < 3; i++) { 
			 if(!files[i].isEmpty()) { 
				 saveDirPath = "D:/MyWorkspace/uploadfiles/add/" + id + "/sub/";
				 
				 if(i == 0) {
					 filePath = saveDirPath + product.getSub1_img(); 
				 } else if (i == 1) {
					 filePath = saveDirPath + product.getSub2_img(); 
				 } else {
					 filePath = saveDirPath + product.getSub3_img(); 
				 }
				 
				file = new File(filePath);
				
				try {
					files[i].transferTo(file); 
				} catch (IOException e) {
					e.printStackTrace(); } 
			}
		 }
		 
		logger.info("상품 등록 완료");
		
		return "redirect:/product_manage/add/add_confirm2?product_id="+id;
	}
	
	@RequestMapping("/add/add_confirm2")
	public String add_confirm2(int product_id, Model model) {
		logger.info(product_id+"");
		ProductDto pDto = pmService.getProduct(product_id);
		model.addAttribute("pDto", pDto);
		return "product_manage/add/add_confirm2";
	}
	
	
	@GetMapping("/edit/edit_product")
	public String edit_productForm(int product_id, ProductDto product, Model model) {
		logger.info("edit_product 실행 중");
		ProductDto pmDto = pmService.getAllProduct(product_id);
		logger.info("edit_product  읽기 성공 ");
		model.addAttribute("pmDto", pmDto);
		
		
		return "product_manage/edit/edit_product";
	}

	@PostMapping("/edit/edit_product")
	public String edit_product(ProductDto pmDto) {
		logger.info("상품 수정 중");
		
		int product_id = pmDto.getProduct_id();
		int sellingp = pmDto.getSelling_price();
		logger.info("제품 코드: " + product_id);
		logger.info("판매가 :   " + sellingp);
		
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
		return "redirect:/";
	}
	
	
	@GetMapping("/edit/edit_thumbphoto")
	public void edit_thumbphoto(int product_id, HttpServletResponse response) throws Exception {
		
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
	public void edit_thumbhoverphoto(int product_id, HttpServletResponse response) throws Exception {
		
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
	public void edit_mainphoto(int product_id, HttpServletResponse response) throws Exception {
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
	public void edit_sub1photo(int product_id, HttpServletResponse response) throws Exception {
		
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
	public void edit_sub2photo(int product_id, HttpServletResponse response) throws Exception {
		
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
	public void edit_sub3photo(int product_id, HttpServletResponse response) throws Exception {
		
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
	public String boarddelete(int product_id) {
		logger.info("삭제 실행 중 ");
		logger.info("product id: " + product_id);
		pmService.deleteProduct(product_id);
		logger.info("삭제 완료 ");
		return "redirect:/";
	}
	
	

}
