package teamproject.sagi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.ProductDto;

@Repository
public class SearchDao {
	@Resource
	private SqlSessionTemplate sst;

	public List<ProductDto> selectByName(String keyword) {
		List<ProductDto> items = sst.selectList(
								"mybatis.mapper.search.selectByName",
								keyword);
		return items;
	}

	public String selectThumbnailByPk(String product_id) {
		String thumbnail = sst.selectOne(
								"mybatis.mapper.search.selectThumbnailByPk",
								product_id);
		return thumbnail;
	}

	public ProductDto selectByPk(String products_product_id) {
		ProductDto product = sst.selectOne("mybatis.mapper.search.selectByPk", products_product_id);
		return product;
	}
}
