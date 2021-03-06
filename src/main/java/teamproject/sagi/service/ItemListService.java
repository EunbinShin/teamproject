package teamproject.sagi.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import teamproject.sagi.controller.BoardController;
import teamproject.sagi.dao.ItemListDao;
import teamproject.sagi.dao.QnaDao;
import teamproject.sagi.dao.ReviewDao;
import teamproject.sagi.dto.ListPager;
import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.dto.QnaDto;
import teamproject.sagi.dto.ReviewDto;

@Service
public class ItemListService {
	private static final Logger logger = LoggerFactory.getLogger(ItemListService.class);

	@Resource
	private ItemListDao itemListDao;

	public int getTotalRows() {
		int rows = itemListDao.countAll();
		return rows;
	}

	public int getTotalRows(int category) {
		int rows = itemListDao.countAll(category);
		return rows;
	}
	
	public List<ProductDto> getItemList(ListPager pager) {
		// TODO Auto-generated method stub
		List<ProductDto> items = itemListDao.selectByPage(pager);
		return items;
	}

	public String getThumbnail(int id) {
		// TODO Auto-generated method stub
		String image = itemListDao.selectThumbnailByPk(id);
		return image;
	}

	public String getThumbnailHover(int id) {
		// TODO Auto-generated method stub
		String image = itemListDao.selectThumbnailHoverByPk(id);
		return image;
	}

	public int getTotalBestRows() {
		int rows = itemListDao.countBestAll();
		return rows;
	}

	public int getTotalBestRows(int category) {
		int rows = itemListDao.countBestAll(category);
		return rows;
	}

	public List<ProductDto> getBestItemList(ListPager pager) {
		// TODO Auto-generated method stub
		List<ProductDto> items = itemListDao.selectBestByPage(pager);
		return items;
	}
	
}
