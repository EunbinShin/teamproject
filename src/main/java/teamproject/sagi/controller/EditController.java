package teamproject.sagi.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/edit")
public class EditController {
	private static final Logger logger = 
			LoggerFactory.getLogger(EditController.class);
	 
	@RequestMapping("/edit")
	public String content() {
		logger.info("edit 실행");
		return "edit/edit";
	}
   
 
}
