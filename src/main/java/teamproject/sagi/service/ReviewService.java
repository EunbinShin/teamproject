package teamproject.sagi.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import teamproject.sagi.dao.QnaDao;
import teamproject.sagi.dao.ReviewDao;
import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.QnaDto;
import teamproject.sagi.dto.ReviewDto;

@Service
public class ReviewService {
	@Resource
	private ReviewDao reviewDao;
	public void writeReivew(ReviewDto review) {
		reviewDao.insertReview(review);
	}
	public int getTotalRows() {
		int totalRows = reviewDao.countAll();
		return totalRows;
	}
	public List<ReviewDto> getBoardList(Pager pager) {
		List<ReviewDto> list = reviewDao.selectByPage(pager);
		return list;
	}
	public ReviewDto showReview(int bno) {
		ReviewDto review = reviewDao.selectByPk(bno);
		String temp = review.getReview_content();
		temp = temp.replace("\n", "<br/>");
		review.setReview_content(temp);
		return review;
	}
}
