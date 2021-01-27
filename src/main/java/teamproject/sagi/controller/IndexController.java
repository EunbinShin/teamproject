package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Generated;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.sagi.dto.ItemDetailDto;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/")
	public String content() {
		logger.info("실행");
		return "index";
	}
	
	@GetMapping("/slider")
	public String slider(Model model, String item) {
		logger.info(item+"실행");
		//item이름이 포함된 상품 4개 select문으로 가져옴
		String saveDirPath = "D:/MyWorkspace/uploadfiles/"+item+"/";
		File dir = new File(saveDirPath);
		String[] fileNames = dir.list();
		model.addAttribute("fileNames", fileNames);
		model.addAttribute("item", item);
		return "include/test_slider";
	}
	
	@GetMapping("/adphoto")
	public void photoDownload(String photo,String item,  HttpServletResponse response) {
		logger.info(photo+"실행");
		response.setContentType("image/jpeg");
		try {
			photo = new String(photo.getBytes("UTF-8"), "ISO-8859-1");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""+photo+"\"");	//attachment가 들어가면 contents가 다운로드됨
		
		try {
			String saveDirPath = "D:/MyWorkspace/uploadfiles/"+item+"/";
			String filePath = saveDirPath+photo;	//실제 경로
			
			InputStream is = new FileInputStream(filePath);
			OutputStream os = response.getOutputStream();
			
			FileCopyUtils.copy(is, os);
			
			os.flush();
			os.close();
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
