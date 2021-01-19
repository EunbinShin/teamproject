package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import teamproject.sagi.dto.Paging;
import teamproject.sagi.dto.QnaDto;
import teamproject.sagi.dto.ReviewDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private int qnaBoardNum = 1;
	private int reviewBoardNum = 1;
	private int pageNum = 1;
	
	//1. QnA화면 실행
	@RequestMapping("/qna")
	public String qna(Model model, int page, int range) {
		logger.info(page+"번 qna 페이지 실행");
		List<QnaDto> list = new ArrayList<>();
		for(int i = 1 ; i <= 151 ; i++) {
			QnaDto qna = new QnaDto();
			qna.setbNo(i);
			qna.setQna_categorie("배송");
			qna.setQna_title("제목"+i);
			qna.setQna_writer("글쓴이"+i);
			qna.setQna_content("내용"+i);
			qna.setDate(new Date());
			
			list.add(qna);
		}
		
		Paging paging = new Paging();
		paging.pageInfo(page, range, 151);
		
		model.addAttribute("paging", paging);
		model.addAttribute("qnaList", list);
		model.addAttribute("page", page);
		return "board/qna";
	}
	//1. Review화면 실행
	@RequestMapping("/review")
	public String review(Model model, int page, int range) {
		logger.info("실행");
		List<ReviewDto> list = new ArrayList<>();
		
		for(int i = 1 ; i <= 153 ; i++) {
			ReviewDto review = new ReviewDto();
			review.setbNo(i);
			review.setReview_title("제목"+i);
			review.setReview_writer("제목"+i);
			review.setReview_content("내용"+i);
			review.setDate(new Date());
			list.add(review);
		}
		Paging paging = new Paging();
		paging.pageInfo(page, range, 153);
		
		model.addAttribute("paging", paging);
		model.addAttribute("reviewList", list);
		model.addAttribute("page", page);
		return "board/review";
	}
	
	//목록으로 돌아가기
	@RequestMapping("/main")
	public String main(String type, int page, int range) {
		logger.info(type+"실행");
		if(type.equals("review")) {
			return "redirect:/board/review?page="+page+"&range="+range;
		}else if(type.equals("qna")) {
			return "redirect:/board/qna?page="+page+"&range="+range;
		}else {
			return "redirect:/board/qna?page="+page+"&range="+range;
		}
	}
	
	//2. QnA 게시물 보기
	@RequestMapping("/show")
	public String showArticle(
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
		
		return "redirect:/board/review?page=1";
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
