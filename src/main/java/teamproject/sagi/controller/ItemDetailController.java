package teamproject.sagi.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

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
import teamproject.sagi.service.ItemDetailService;

@Controller
@RequestMapping("/item_list")
public class ItemDetailController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ItemDetailController.class);
	// item_detail/product01?item=${product.product_id}
	@Resource
	private ItemDetailService itemdetailService;
	
	@GetMapping("/item_detail")
	public String product(@RequestParam("item")String product_id, Model model) {
		logger.info(product_id);
		
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		 
		model.addAttribute("iDetail", iDetail);
		return "item_list/item_detail/product";
	}
	
	@GetMapping("/detail_thumbnail") 
	public void thumbphoto(String product_id, HttpServletResponse response) throws Exception {
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
	
	@GetMapping("/item_detail/mainphoto")
	public void mainphoto(String product_id, HttpServletResponse response) throws Exception {
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
	
	@GetMapping("/item_detail/sub1photo")
	public void sub1photo(String product_id, HttpServletResponse response) throws Exception {
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
	
	@GetMapping("/item_detail/sub2photo")
	public void sub2photo(String product_id, HttpServletResponse response) throws Exception {
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
	
	@GetMapping("/item_detail/sub3photo")
	public void edit_sub3photo(String product_id, HttpServletResponse response) throws Exception {
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
	
	
	@GetMapping("/item_detail/asyncform")
	public String asyncform(String product_id, Model model) {
		logger.info(product_id);
		ProductDto iDetail = itemdetailService.iDetail(product_id);
		model.addAttribute("itemdetail", iDetail);
		logger.info("상세페이지 보냄");
		return "item_list/item_detail/asyncform";
	}
	
	@GetMapping("/item_detail/reviewform01")
	public String reviewform01() {
		logger.info("상세페이지 보냄");
		return "item_list/item_detail/reviewform01";
	}
	
	@GetMapping("/item_detail/deliveryform01")
	public String deliveryform01() {
		logger.info("상세페이지 보냄");
		return "item_list/item_detail/deliveryform01";
	}
	
}
