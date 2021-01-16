package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import teamproject.sagi.dto.BoardDTO;
import teamproject.sagi.dto.QnaDto;
import teamproject.sagi.dto.ReviewDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private int qnaBoardNum = 1;
	private int reviewBoardNum = 1;
	
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
	public String showArticle(int bno
			, HttpServletResponse response
			, Model model) {
		logger.info("게시물 "+bno+" 실행");
		model.addAttribute("bno", bno);
		return "board/article";
	}
	
	@GetMapping("/photolist")
	public String photoList(Model model, int bno) {
		logger.info(bno+"번 실행");
		String saveDirPath = "D:/MyWorkspace/uploadfiles/qna/"+bno+"/";
		File dir = new File(saveDirPath);
		String[] fileNames = dir.list();
		model.addAttribute("fileNames", fileNames);
		model.addAttribute("bno", bno);
		return "board/photolist";
	}
	
	@GetMapping("/photodownload")
	public void photoDownload(int bno, String photo, HttpServletResponse response) {
		logger.info("실행");
		response.setContentType("image/jpeg");
		try {
			photo = new String(photo.getBytes("UTF-8"), "ISO-8859-1");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""+photo+"\"");	//attachment가 들어가면 contents가 다운로드됨
		
		try {
			String saveDirPath = "D:/MyWorkspace/uploadfiles/qna/"+bno+"/";
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
		board.setbNo(qnaBoardNum++);
		board.setDate(new Date());
		board.setQna_writer((String) session.getAttribute("loginStatus"));
		logger.info("게시판 번호: "+board.getbNo());
		logger.info(board.getQna_categorie());
		logger.info(board.getQna_title());
		logger.info(board.getQna_writer());
		logger.info(board.getQna_content());
		
		MultipartFile[] files = new MultipartFile[4];
		files[0] = board.getQnafile1();
		files[1] = board.getQnafile2();
		files[2] = board.getQnafile3();
		files[3] = board.getQnafile4();
		
		for(int i = 0 ; i < 4; i++) {
			if(!files[i].isEmpty()) {
				logger.info(files[i].getOriginalFilename());
				String originalFileName = files[i].getOriginalFilename();
				String contentType = files[i].getContentType();
				//파일경로
				String saveDirPath = "D:/MyWorkspace/uploadfiles/qna/"+board.getbNo()+"/";
				//파일 이름
				String fileName = new Date().getTime()+"_"+originalFileName;
				//파일 전체 경로
				String filePath = saveDirPath + fileName;
				File file = new File(filePath);
				try {
					files[i].transferTo(file);
				}catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return "redirect:/board/qna";
	}
	
	@RequestMapping("/writeReview")
	public String writeReview() {
		logger.info("실행");
		return "board/writeReview";
	}
	
	@GetMapping("/findItem")
	public String findItem() {
		logger.info("실행");
		return "board/pop_up";
	}
	
	@PostMapping("/submitReview")
	public String submitReview(
			HttpSession session,
			ReviewDto board) {
		logger.info("실행");
		board.setDate(new Date());
		board.setReview_writer((String) session.getAttribute("loginStatus"));
		board.setbNo(reviewBoardNum++);
		logger.info("게시판 번호: "+board.getbNo());
		logger.info(board.getReview_title());
		logger.info(board.getReview_writer());
		logger.info(board.getReview_content());
		
		MultipartFile[] files = new MultipartFile[4];
		files[0] = board.getFile1();
		files[1] = board.getFile2();
		files[2] = board.getFile3();
		files[3] = board.getFile4();
		
		for(int i = 0 ; i < 4; i++) {
			if(!files[i].isEmpty()) {
				logger.info(files[i].getOriginalFilename());
				String originalFileName = files[i].getOriginalFilename();
				String contentType = files[i].getContentType();
				//파일경로
				String saveDirPath = "D:/MyWorkspace/uploadfiles/review/"+board.getbNo()+"/";
				//파일 이름
				String fileName = new Date().getTime()+"_"+originalFileName;
				//파일 전체 경로
				String filePath = saveDirPath + fileName;
				File file = new File(filePath);
				try {
					files[i].transferTo(file);
				}catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return "redirect:/board/review";
	}
	
}
