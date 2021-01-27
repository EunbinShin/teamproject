package teamproject.sagi.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import teamproject.sagi.dto.SignupDto;

@Repository
public class SignupDao {
	public static final Logger logger 
	= LoggerFactory.getLogger(SignupDao.class);
	 
	@Resource
	private SqlSessionTemplate sst;
	
	public int insert(SignupDto signup) {
		int rows = sst.insert("mybatis.mapper.signup.insert", signup);
		return rows;
	}

}
