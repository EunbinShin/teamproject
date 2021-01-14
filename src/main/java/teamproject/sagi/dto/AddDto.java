package teamproject.sagi.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AddDto {

	private String product_id; 
	private String product_categorie; //d
	private double product_price; 
	private double percentage_discount;
	private String product_description;
	private int available_quantity;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date online_date;
	private String filebutton;
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_categorie() {
		return product_categorie;
	}
	public void setProduct_categorie(String product_categorie) {
		this.product_categorie = product_categorie;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	public double getPercentage_discount() {
		return percentage_discount;
	}
	public void setPercentage_discount(double percentage_discount) {
		this.percentage_discount = percentage_discount;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public int getAvailable_quantity() {
		return available_quantity;
	}
	public void setAvailable_quantity(int available_quantity) {
		this.available_quantity = available_quantity;
	}
	public Date getOnline_date() {
		return online_date;
	}
	public void setOnline_date(Date online_date) {
		this.online_date = online_date;
	}
	public String getFilebutton() {
		return filebutton;
	}
	public void setFilebutton(String filebutton) {
		this.filebutton = filebutton;
	}	  
	
}
