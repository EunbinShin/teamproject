package teamproject.sagi.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import teamproject.sagi.dao.SignupDao;
import teamproject.sagi.dto.SignupDto;

@Service
public class SignupService {	
	private static Logger logger 
	= LoggerFactory.getLogger(SignupService.class);
	
	@Resource
	private SignupDao signupDao;
	
	public void signup(SignupDto signup) {
		signupDao.insert(signup);
	}
}
