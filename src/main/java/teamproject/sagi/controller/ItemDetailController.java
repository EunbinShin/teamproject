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

import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.dto.ReviewDto;
import teamproject.sagi.service.ItemDetailService;
import teamproject.sagi.service.ReviewService;

@Controller
@RequestMapping("/item_list")
public class ItemDetailController {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(ItemDetailController.class);
	
	@Resource
	private ItemDetailService itemdetailService;
	@Resource
	private ReviewService reviewService;
	
	@GetMapping("/item_detail")
	public String product(
			int product_id,
			Model model) {
		logger.info(product_id+"번 아이템");
		
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		 
		model.addAttribute("iDetail", iDetail);
		return "item_list/item_detail/product";
	}
	
	@GetMapping("/detail_thumbnail") 
	public void thumbphoto(int product_id, HttpServletResponse response) throws Exception {
		logger.info("사진 로딩");
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		
		String photo_name = iDetail.getThumbnail();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/thumbnail/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/mainphoto")
	public void mainphoto(int product_id, HttpServletResponse response) throws Exception {
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		
		String photo_name = iDetail.getMain_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/main/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/sub1photo")
	public void sub1photo(int product_id, HttpServletResponse response) throws Exception {
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		
		String photo_name = iDetail.getSub1_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/sub/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/sub2photo")
	public void sub2photo(int product_id, HttpServletResponse response) throws Exception {
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		
		String photo_name = iDetail.getSub2_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/sub/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/sub3photo")
	public void edit_sub3photo(int product_id, HttpServletResponse response) throws Exception {
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		
		String photo_name = iDetail.getSub3_img();
		String filePath =  "D:/MyWorkspace/uploadfiles/add/" + product_id + "/sub/" + photo_name;
		
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	
	@GetMapping("/defaultform")
	public String defaultform(int product_id, Model model) {
		logger.info(product_id+"번 아이템");
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		model.addAttribute("itemdetail", iDetail);
		logger.info("상세페이지 보냄");
		return "item_list/item_detail/asyncform";
	}
	
	@GetMapping("/reviewform")
	public String reviewform01(int product_id, Model model) {
		logger.info(product_id+"번 아이템");
		List<ReviewDto> reviews = reviewService.getProductReview(product_id);
		model.addAttribute("size", reviews.size());
		model.addAttribute("list", reviews);
		logger.info(reviews.size()+"개의 리뷰페이지 보냄");
		return "item_list/item_detail/reviewform01";
	}
	
	@GetMapping("/deliveryform")
	public String deliveryform01() {
		logger.info("상세페이지 보냄");
		return "item_list/item_detail/deliveryform";
	}
	
}
