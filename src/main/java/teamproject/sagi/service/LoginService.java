package teamproject.sagi.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import teamproject.sagi.dao.LoginDao;
import teamproject.sagi.dto.SignupDto;

@Service
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);

	@Resource
	private LoginDao loginDao;
	
	public String login(SignupDto user) {
		// TODO Auto-generated method stub
		SignupDto dbUser = loginDao.selectByPk(user.getId());
		
		if(dbUser == null) {
			return "wrongId";
		}else if(dbUser.getPassword().equals(user.getPassword())){
			return "success";
		}else {
			return "wrongPassword";
		}
	}

	public SignupDto getUserInfo(String id) {
		SignupDto user = loginDao.selectByPk(id);
		return user;
	}
	
	
}
