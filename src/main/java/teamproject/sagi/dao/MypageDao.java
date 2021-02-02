package teamproject.sagi.dao;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.MypageDto;

@Repository
public class MypageDao {
	private static final Logger logger = 
	         LoggerFactory.getLogger(MypageDao.class);
	
   @Resource
   private SqlSessionTemplate sst;

	public MypageDto selectAllUserInfo(String id) {
		MypageDto mpDto = sst.selectOne("mybatis.mapper.mypage.selectAllUserInfo", id);
		return mpDto;
	}
	
	public int edit(MypageDto mpDto) {
		int rows = sst.update("mybatis.mapper.mypage.edit", mpDto);
		return rows;
		
	}
	
	public MypageDto selectByPk(String id) {
		MypageDto mpDto = sst.selectOne("mybatis.mapper.mypage.selectByPk", id);
		return mpDto;
	}

   
}
