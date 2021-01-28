package teamproject.sagi.service;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import teamproject.sagi.dao.ProductManageDao;
import teamproject.sagi.dto.ProductDto;

@Service
public class ProductManageService {
	 private static final Logger logger = 
	         LoggerFactory.getLogger(ProductManageService.class);

	 @Resource
	 private ProductManageDao pmDao;
	 
	 public List<ProductDto> getProductList() {
		 List<ProductDto> list = pmDao.selectAll();
		 return list;
	 }

	public void saveproduct(ProductDto product) {
		pmDao.insert(product);		
	}

	public ProductDto getProduct(String product_id) {
		ProductDto pDto = pmDao.selectByPk(product_id);
		return pDto;
	}

	public ProductDto getUpdateProduct(String product_id) {
		ProductDto pDto = pmDao.selectUpdateByPk(product_id);
		return pDto;
	}
	
}
