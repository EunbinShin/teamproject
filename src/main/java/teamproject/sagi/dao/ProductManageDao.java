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

	public ProductDto selectByPk(String product_id) {
		ProductDto pDto = sst.selectOne("mybatis.mapper.productmanages.selectByPk", product_id);
		return pDto;
	}

	public ProductDto selectAllInfo(String product_id) {
		ProductDto pDto = sst.selectOne("mybatis.mapper.productmanages.selectAllInfo", product_id);
		return pDto;
	}

	public int edit(ProductDto pmDto) {
		int rows = sst.update("mybatis.mapper.productmanages.edit", pmDto);
		return rows;
	}

	public int delete(String product_id) {
		int rows = sst.delete("mybatis.mapper.productmanages.delete",product_id);
		return rows;		
	}


}
