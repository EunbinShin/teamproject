package teamproject.sagi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.ListPager;
import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.dto.QnaDto;

@Repository
public class ItemListDao {
	@Resource
	private SqlSessionTemplate sst;	//mybatis를 사용하는 객체
	
	public int countAll() {
		int count = sst.selectOne("mybatis.mapper.itemlist.countAll");
		return count;
	}
	
	public int countAll(int category) {
		int count = sst.selectOne(
				"mybatis.mapper.itemlist.countAllCategory",
				category);
		return count;
	}

	public List<ProductDto> selectByPage(ListPager pager) {
		List<ProductDto> list = sst.selectList(
				"mybatis.mapper.itemlist.selectByPage", pager);
		return list;
	}

	public String selectThumbnailByPk(int id) {
		// TODO Auto-generated method stub
		String image = sst.selectOne("mybatis.mapper.itemlist.selectThumbnailByPk",id);
		return image;
	}

	public String selectThumbnailHoverByPk(int id) {
		// TODO Auto-generated method stub
		String image = sst.selectOne("mybatis.mapper.itemlist.selectThumbnailHoverByPk" ,id);
		return image;
	}

	public int countBestAll() {
		int count = sst.selectOne("mybatis.mapper.itemlist.countBestAll");
		return count;
	}

	public int countBestAll(int category) {
		int count = sst.selectOne(
				"mybatis.mapper.itemlist.countBestAllCategory",
				category);
		return count;
	}

	public List<ProductDto> selectBestByPage(ListPager pager) {
		// TODO Auto-generated method stub
		List<ProductDto> list = sst.selectList(
				"mybatis.mapper.itemlist.selectBestByPage", pager);
		return list;
	}
	

}
