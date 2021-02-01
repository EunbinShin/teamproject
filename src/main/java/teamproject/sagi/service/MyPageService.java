package teamproject.sagi.service;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import teamproject.sagi.dao.MypageDao;
import teamproject.sagi.dto.MypageDto;

@Service
public class MyPageService {
	 private static final Logger logger = 
	         LoggerFactory.getLogger(MyPageService.class);

	 @Resource
	 private MypageDao mpDao;
	 

	public MypageDto getAllUserInfo(String id) {
		MypageDto mpDto = mpDao.selectAllUserInfo(id);
		return mpDto;
	}


	public void edit(MypageDto mpDto) {
		mpDao.edit(mpDto);
		
	}
	
	
}
