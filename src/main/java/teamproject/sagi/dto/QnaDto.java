package teamproject.sagi.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaDto {
	private int bNo;
	private String qna_categorie;
	private String qna_title;
	private String qna_writer;
	private String qna_content;
	private MultipartFile qnafile1;
	private MultipartFile qnafile2;
	private MultipartFile qnafile3;
	private MultipartFile qnafile4;
	private Date date;
	
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getQna_categorie() {
		return qna_categorie;
	}
	public void setQna_categorie(String qna_categorie) {
		this.qna_categorie = qna_categorie;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public MultipartFile getQnafile1() {
		return qnafile1;
	}
	public void setQnafile1(MultipartFile qnafile1) {
		this.qnafile1 = qnafile1;
	}
	public MultipartFile getQnafile2() {
		return qnafile2;
	}
	public void setQnafile2(MultipartFile qnafile2) {
		this.qnafile2 = qnafile2;
	}
	public MultipartFile getQnafile3() {
		return qnafile3;
	}
	public void setQnafile3(MultipartFile qnafile3) {
		this.qnafile3 = qnafile3;
	}
	public MultipartFile getQnafile4() {
		return qnafile4;
	}
	public void setQnafile4(MultipartFile qnafile4) {
		this.qnafile4 = qnafile4;
	}
	
	
	
	
}
