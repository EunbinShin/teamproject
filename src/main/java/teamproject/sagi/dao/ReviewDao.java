package teamproject.sagi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.ReviewDto;

@Repository
public class ReviewDao {
	@Resource
	private SqlSessionTemplate sst;	//mybatis를 사용하는 객체
	
	public int insertReview(ReviewDto review) {
		int rows = sst.insert("mybatis.mapper.review_boards.insertreview", review);
		return rows;
	}

	public int countAll() {
		int count = sst.selectOne("mybatis.mapper.review_boards.countAll");
		return count;
	}

	public List<ReviewDto> selectByPage(Pager pager) {
		List<ReviewDto> list = sst.selectList(
				"mybatis.mapper.review_boards.selectByPage", pager);
		return list;
	}
	
	public String selectCategoryName(int cno) {
		String cname 
			= sst.selectOne("mybatis.mapper.review_boards.selectCategory"
					, cno);
		return cname;
	}

	public ReviewDto selectByPk(int bno) {
		ReviewDto review = sst.selectOne(
				"mybatis.mapper.review_boards.selectByPk",
				bno);
		return review;
	}

}
