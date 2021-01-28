package teamproject.sagi.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import teamproject.sagi.controller.LoginController;
import teamproject.sagi.dto.SignupDto;

@Repository
public class LoginDao {
	private static final Logger logger = LoggerFactory.getLogger(LoginDao.class);
	@Resource
	private SqlSessionTemplate sst;

	public SignupDto selectByPk(String id) {
		SignupDto user = sst.selectOne(
							"mybatis.mapper.login.selectByPk",
							id);
		return user;
	}
}
