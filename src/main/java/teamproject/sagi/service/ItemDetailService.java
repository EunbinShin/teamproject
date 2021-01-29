package teamproject.sagi.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import teamproject.sagi.dao.ItemDetailDao;
import teamproject.sagi.dto.ProductDto;

@Service 
public class ItemDetailService {
	private static Logger logger 
	= LoggerFactory.getLogger(ItemDetailService.class);

	@Resource
	private ItemDetailDao iDetailDao;
	
	public ProductDto iDetail(String product_id) {
		ProductDto iDetail = iDetailDao.selectByPk(product_id);
		return iDetail;
	}
}
