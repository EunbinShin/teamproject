package teamproject.sagi.dto;

import java.util.Date;

public class QnaDto {
	private int bNo;
	private String qna_categorie;
	private String qna_title;
	private String qna_content;
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
	
	
}
