package teamproject.sagi.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import teamproject.sagi.dao.SearchDao;
import teamproject.sagi.dto.ProductDto;

@Service
public class SearchService {
	@Resource
	private SearchDao searchDao;

	public List<ProductDto> findItem(String keyword) {
		// TODO Auto-generated method stub
		List<ProductDto> items = searchDao.selectByName(keyword);
		return items;
	}

	public String getThumbnail(int product_id) {
		String thumbnail = searchDao.selectThumbnailByPk(product_id);
		return thumbnail;
	}

	public ProductDto getProduct(int products_product_id) {
		// TODO Auto-generated method stub
		ProductDto product = searchDao.selectByPk(products_product_id);
		return product;
	}

	public List<ProductDto> findSliderItem(String category) {
		// TODO Auto-generated method stub
		List<ProductDto> products = searchDao.selectByCategory(category);
		return products;
	}
	
}
