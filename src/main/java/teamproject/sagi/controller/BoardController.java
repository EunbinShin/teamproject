package teamproject.sagi.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import teamproject.sagi.dto.BoardDTO;
import teamproject.sagi.dto.QnaDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/qna")
	public String qna() {
		logger.info("실행");
		return "board/qna";
	}
	
	@RequestMapping("/review")
	public String review() {
		logger.info("실행");
		return "board/review";
	}
	
	@RequestMapping("/show")
	public String showArticle(Model model) {
		logger.info("실행");
		BoardDTO board = new BoardDTO();
		board.setbNo(1);
		board.setbTitle("그릇이 너무 좋아요");
		board.setbContent("집안의 인테리어의 기준!");
		board.setbWriter("신은빈");
		board.setDate(new Date());
		
		model.addAttribute("board", board);
		return "board/article";
	}
	
	@RequestMapping("/writeQnA")
	public String writeQnA() {
		logger.info("실행");
		return "board/writeQnA";
	}
	
	@RequestMapping("/submitQnA")
	public String submitQnA(
			HttpSession session,
			QnaDto board) {
		logger.info("실행");
		board.setDate(new Date());
		board.setQna_writer((String) session.getAttribute("loginStatus"));
		logger.info(board.getQna_categorie());
		logger.info(board.getQna_title());
		logger.info(board.getQna_writer());
		logger.info(board.getQna_content());
		return "redirect:/board/qna";
	}
}
