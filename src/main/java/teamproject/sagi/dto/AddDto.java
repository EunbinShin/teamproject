package teamproject.sagi.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class AddDto {
	private String product_id; 
	private String product_name;
	private String product_categorie; //d
	private double product_price; 
	private double percentage_discount;
	private double selling_price;
	
	private String product_description;
	private int available_quantity;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date online_date;
	private MultipartFile main_button;
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	public double getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(double selling_price) {
		this.selling_price = selling_price;
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
	public MultipartFile getMain_button() {
		return main_button;
	}
	public void setMain_button(MultipartFile main_button) {
		this.main_button = main_button;
	}
	
	

}
