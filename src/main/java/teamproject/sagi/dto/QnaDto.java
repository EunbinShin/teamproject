package teamproject.sagi.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaDto {
	private int qna_bno;
	private int qna_category;
	private String category_name;
	private String qna_title;
	private String users_id;
	private String qna_content;
	private MultipartFile qnafile1;
	private MultipartFile qnafile2;
	private MultipartFile qnafile3;
	private MultipartFile qnafile4;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private Date qna_date;
	
	public int getQna_bno() {
		return qna_bno;
	}
	public void setQna_bno(int qna_bno) {
		this.qna_bno = qna_bno;
	}
	public int getQna_category() {
		return qna_category;
	}
	public void setQna_category(int qna_category) {
		this.qna_category = qna_category;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getUsers_id() {
		return users_id;
	}
	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
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
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	
	
	
}
