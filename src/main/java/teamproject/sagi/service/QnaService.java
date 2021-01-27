package teamproject.sagi.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import teamproject.sagi.dao.QnaDao;
import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.QnaDto;

@Service
public class QnaService {
	@Resource
	private QnaDao qnaDao;
	public void writeQna(QnaDto qna) {
		qnaDao.insertQna(qna);
	}
	public int getTotalRows() {
		int totalRows = qnaDao.countAll();
		return totalRows;
	}
	public List<QnaDto> getBoardList(Pager pager) {
		List<QnaDto> list = qnaDao.selectByPage(pager);
		return list;
	}
	public QnaDto showQna(int bno) {
		QnaDto qna = qnaDao.selectByPk(bno);
		String temp = qna.getQna_content();
		temp = temp.replace("\n", "<br/>");
		qna.setQna_content(temp);
		return qna;
	}
}
