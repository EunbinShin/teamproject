package teamproject.sagi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.QnaDto;

@Repository
public class QnaDao {
	@Resource
	private SqlSessionTemplate sst;	//mybatis를 사용하는 객체
	
	public int insertQna(QnaDto qna) {
		int rows = sst.insert("mybatis.mapper.qna_boards.insertqna", qna);
		return rows;
	}

	public int countAll() {
		int count = sst.selectOne("mybatis.mapper.qna_boards.countAll");
		return count;
	}

	public List<QnaDto> selectByPage(Pager pager) {
		List<QnaDto> list = sst.selectList(
				"mybatis.mapper.qna_boards.selectByPage", pager);
		return list;
	}
	
	public String selectCategoryName(int cno) {
		String cname 
			= sst.selectOne("mybatis.mapper.qna_boards.selectCategory"
					, cno);
		return cname;
	}

	public QnaDto selectByPk(int bno) {
		QnaDto qna = sst.selectOne(
				"mybatis.mapper.qna_boards.selectByPk",
				bno);
		return qna;
	}

}
