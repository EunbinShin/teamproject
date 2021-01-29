package teamproject.sagi.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.ProductDto;

@Repository
public class ItemDetailDao {
	public static final Logger logger 
	= LoggerFactory.getLogger(ItemDetailDao.class);
	 
	@Resource
	private SqlSessionTemplate sst;
 
	public ProductDto selectByPk(String product_id) {
		ProductDto iDetail = sst.selectOne("mybatis.mapper.itemDetail.selectByPk", product_id);
		return iDetail;
	}

}
