package teamproject.sagi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.ProductDto;

@Repository
public class ProductManageDao {
	private static final Logger logger = 
	         LoggerFactory.getLogger(ProductManageDao.class);
	
   @Resource
   private SqlSessionTemplate sst;

   public List<ProductDto> selectAll() {
		List<ProductDto> list = sst.selectList("mybatis.mapper.productmanages.selectAll");
	   	
		return list;
   }

	public int insert(ProductDto product) {
		int rows = sst.insert("mybatis.mapper.productmanages.insert", product);
		return rows;
	}

}
