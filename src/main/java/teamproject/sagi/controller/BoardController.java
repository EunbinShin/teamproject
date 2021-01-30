package teamproject.sagi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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
import teamproject.sagi.dto.ProductDto;
import teamproject.sagi.dto.QnaDto;
import teamproject.sagi.dto.ReviewDto;
import teamproject.sagi.dto.SearchDto;
import teamproject.sagi.dto.SignupDto;
import teamproject.sagi.service.QnaService;
import teamproject.sagi.service.ReviewService;
import teamproject.sagi.service.SearchService;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Resource
	private QnaService qnaService;
	@Resource
	private ReviewService reviewService;
	@Resource
	private SearchService searchService;
	
	//1. QnA화면 실행
	@RequestMapping("/qna")
	public String qna(Model model, @RequestParam(defaultValue="1") int page) {
		logger.info(page+"번 qna 페이지 실행");
		int totalRows = qnaService.getTotalRows();
		if(totalRows>0) {
			Pager pager = new Pager(15, 10, totalRows, page);
			List<QnaDto> list = qnaService.getBoardList(pager);
			model.addAttribute("list", list);
			model.addAttribute("pager", pager);
			model.addAttribute("page", page);
		}
		return "board/qna";
	}
	//1. Review화면 실행
	@RequestMapping("/review")
	public String review(Model model, 
			@RequestParam(defaultValue="1") int page) {
		logger.info(page+"번 review 페이지 실행");
		int totalRows = reviewService.getTotalRows();
		if(totalRows>0) {
			Pager pager = new Pager(15, 10, totalRows, page);
			List<ReviewDto> list = reviewService.getBoardList(pager);
			model.addAttribute("list", list);
			model.addAttribute("pager", pager);
			model.addAttribute("page", page);
		}
		return "board/review";
	}
	
	//2. QnA 게시물 보기
	@RequestMapping("/showqna")
	public String showqna(
			int bno,
			@RequestParam(defaultValue="1") int page, 
			Model model) {
		logger.info(bno+" qna 실행");
		
		QnaDto qna = qnaService.showQna(bno);
		ProductDto product = searchService.getProduct(qna.getProducts_product_id());
		model.addAttribute("qna", qna);
		model.addAttribute("product", product);
		model.addAttribute("page", page);
		return "board/qna_article";
	}
	
	@RequestMapping("/showreview")
	public String showreview(
			int bno,
			@RequestParam(defaultValue="1") int page,
			Model model) {
		logger.info(bno+" review 실행");
		
		ReviewDto review = reviewService.showReview(bno);
		ProductDto product = searchService.getProduct(review.getProducts_product_id());
		model.addAttribute("review", review);
		model.addAttribute("product", product);
		model.addAttribute("page", page);
		return "board/review_article";
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
		
		SignupDto user = (SignupDto) session.getAttribute("loginStatus");
		board.setUsers_id(user.getId());
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
		
		MultipartFile[] files = new MultipartFile[4];
		files[0] = board.getFile1();
		files[1] = board.getFile2();
		files[2] = board.getFile3();
		files[3] = board.getFile4();
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
		
		SignupDto user = (SignupDto) session.getAttribute("loginStatus");
		board.setUsers_id(user.getId());
		
		reviewService.writeReivew(board);
		
		for(int i = 0 ; i < 4; i++) {
			if(!files[i].isEmpty()) {
				//파일 이름
				String fileName = snames[i];
				//파일경로
				String saveDirPath = "D:/MyWorkspace/uploadfiles/review/"+board.getReview_no()+"/";
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
	
	@GetMapping("/qna_photo")
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
	
	@GetMapping("/reviewphoto")
	public void reviewphoto(String image,
			int bno,
			HttpServletResponse response) throws IOException {
		
		String filePath = "D:/MyWorkspace/uploadfiles/review/"
				+bno+"/"+image;
			
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	//review 삭제
	@GetMapping("/delete_review")
	public String delete_review(int bno) {
		reviewService.deleteReview(bno);
		return "redirect:/board/review";
	}
	
	//qna 삭제
	@GetMapping("/delete_qna")
	public String delete_qna(int bno) {
		qnaService.deleteQna(bno);
		return "redirect:/board/qna";
	}
	
	//review 수정 페이지
	@GetMapping("/edit_review")
	public String edit_reviewForm(int bno, Model model) {
		ReviewDto review = reviewService.getReview(bno);
		model.addAttribute("review", review);
		return "board/editReview";
	}
	
	//review 수정 제출
	@PostMapping("/edit_review")
	public String edit_review(ReviewDto review) {
		reviewService.editReview(review);
		return "redirect:/board/showreview?bno="+review.getReview_no();
	}
	
	//qna 수정 페이지
	@GetMapping("/edit_qna")
	public String edit_qnaForm(int bno, Model model) {
		QnaDto qna = qnaService.getQna(bno);
		model.addAttribute("qna", qna);
		return "board/editQnA";
	}
	
	//qna 수정 제출
	@PostMapping("/edit_qna")
	public String edit_qna(QnaDto qna) {
		qnaService.editQna(qna);
		return "redirect:/board/showqna?bno="+qna.getQna_bno();
	}
	
	//물품을 찾기위한 pop_up화면을 띄움
	@GetMapping("/findItem")
	public String findItem() {
		logger.info("실행");
		return "board/pop_up";
	}
	
	//pop up화면에 아이템 리스트
	@PostMapping("/search_items")
	public String searchItem(
			SearchDto search,
			Model model) {
		
		List<ProductDto>items = searchService.findItem(search.getKeyword());
		model.addAttribute("items", items);
		return "board/itemlist";
	}
	
	//아이템 리스트들의 사진
	@GetMapping("/searchphoto")
	public void searchphoto(
			String id,
			String image,
			HttpServletResponse response) throws IOException {
		
		String filePath = "D:/MyWorkspace/uploadfiles/add/"
				+id+"/thumbnail/"+image;
			
		InputStream is = new FileInputStream(filePath);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		os.flush();
		os.close();
		is.close();
	}
	
	//popup화면 결과
	@PostMapping("/update_item")
	public void update_item(
			int product_id,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=UTF-8");
		
		String thumbnail = searchService.getThumbnail(product_id);
		
		PrintWriter pw = response.getWriter();
		JSONObject root = new JSONObject();
		root.put("product_id", product_id);
		root.put("thumbnail", thumbnail);
		
		logger.info(thumbnail);
		
		String json = root.toString();
		pw.println(json);
		pw.flush();
		pw.close();
	}
	
}
