package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import teamproject.sagi.dto.BoardDTO;
import teamproject.sagi.dto.Pager;
import teamproject.sagi.dto.QnaDto;
import teamproject.sagi.dto.ReviewDto;
import teamproject.sagi.service.QnaService;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Resource
	private QnaService qnaService;
	
	private int reviewBoardNum = 1;
	
	//1. QnA화면 실행
	@RequestMapping("/qna")
	public String qna(Model model, @RequestParam(defaultValue="1") int page) {
		logger.info(page+"번 qna 페이지 실행");
		int totalRows = qnaService.getTotalRows();
		Pager pager = new Pager(15, 10, totalRows, page);
		List<QnaDto> list = qnaService.getBoardList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("page", page);
		return "board/qna";
	}
	//1. Review화면 실행
	@RequestMapping("/review")
	public String review(Model model, int page) {
		logger.info("실행");
		
		return "board/review";
	}
	
	//2. QnA 게시물 보기
	@RequestMapping("/showqna")
	public String showqna(
			int bno,
			@RequestParam(defaultValue="1") int page
			, Model model) {
		logger.info(+bno+" qna 실행");
		
		QnaDto qna = qnaService.showQna(bno);

		model.addAttribute("qna", qna);
		model.addAttribute("page", page);
		return "board/qna_article";
	}
	
	@RequestMapping("/showreview")
	public String showreview(
			int bno, String type, int page, int range
			, HttpServletResponse response
			, Model model) {
		logger.info(type+"게시물 "+bno+" 실행");
		model.addAttribute("bno", bno);
		model.addAttribute("type", type);
		model.addAttribute("range", range);
		model.addAttribute("page", page);
		return "board/article";
	}
	
	//3. 게시글 내부 ( 자신이 원하는 파일명/ 게시글의 타입/ 게시글 번호 를 보냄)
	@GetMapping("/photolist")
	public String photoList(Model model, int bno, String type) {
		logger.info(bno+"번 "+type+"실행");
		String saveDirPath = "D:/MyWorkspace/uploadfiles/"+type+"/"+bno+"/";
		File dir = new File(saveDirPath);
		String[] fileNames = dir.list();
		model.addAttribute("fileNames", fileNames);
		model.addAttribute("type", type);
		model.addAttribute("bno", bno);
		return "board/photolist";
	}
	
	//게시글에 들어갈 사진 download
	@GetMapping("/photodownload")
	public void photoDownload(int bno,String type, String photo, HttpServletResponse response) {
		logger.info("실행");
		response.setContentType("image/jpeg");
		try {
			photo = new String(photo.getBytes("UTF-8"), "ISO-8859-1");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""+photo+"\"");	//attachment가 들어가면 contents가 다운로드됨
		
		try {
			String saveDirPath = "D:/MyWorkspace/uploadfiles/"+type+"/"+bno+"/";
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
	
	
	//QnA 작성 화면 넘어감
	@RequestMapping("/writeQnA")
	public String writeQnA() {
		logger.info("실행");
		return "board/writeQnA";
	}

	
	//QnA 제출 (끝난 후 qna 게시판으로 redirect)
	@RequestMapping("/submitQnA")
	public String submitQnA(
			HttpSession session,
			QnaDto board) {
		logger.info("실행");
		
		MultipartFile[] files = new MultipartFile[4];
		files[0] = board.getQnafile1();
		files[1] = board.getQnafile2();
		files[2] = board.getQnafile3();
		files[3] = board.getQnafile4();
		String []snames = new String[4];
		
		for(int i = 0 ; i < 4; i++) {
			if(!files[i].isEmpty()) {
				String originalFileName = files[i].getOriginalFilename();
				//파일 이름
				String fileName = new Date().getTime()+"-"+originalFileName;
				if(i==0) {
					board.setImage1(fileName);
				}else if(i==1) {
					board.setImage2(fileName);
				}else if(i==2) {
					board.setImage3(fileName);
				}else {
					board.setImage4(fileName);
				}
				snames[i] = fileName;
			}
		}
		
		board.setUsers_id((String) session.getAttribute("loginStatus"));
		qnaService.writeQna(board);
		
		for(int i = 0 ; i < 4; i++) {
			if(!files[i].isEmpty()) {
				//파일 이름
				String fileName = snames[i];
				//파일경로
				String saveDirPath = "D:/MyWorkspace/uploadfiles/qna/"+board.getQna_bno()+"/";
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
		
		logger.info(board.getQna_category()+"번 문의 카테고리");
		
		return "redirect:/board/qna?page=1";
	}
	//Review 작성 화면 넘어감
	@RequestMapping("/writeReview")
	public String writeReview() {
		logger.info("실행");
		return "board/writeReview";
	}
	//Review 제출 (끝난 후 qna 게시판으로 redirect)
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
		
		return "redirect:/board/review?page=1&range=1";
	}
	
	@GetMapping("/photo")
	public void photo(String image,
			int bno,
			HttpServletResponse response) throws IOException {
		
		String filePath = "D:/MyWorkspace/uploadfiles/qna/"
				+bno+"/"+image;
			
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	//물품을 찾기위한 pop_up화면을 띄움
	@GetMapping("/findItem")
	public String findItem() {
		logger.info("실행");
		return "board/pop_up";
	}
	
	@GetMapping("/search_item")
	public String searchItem(
			String search_type,
			String keyword,
			Model model) {
		logger.info("타입: "+search_type);
		logger.info("키워드: "+keyword);
		model.addAttribute("search_type", search_type);
		model.addAttribute("keyword", keyword);
		return "board/pop_up";
	}
}
