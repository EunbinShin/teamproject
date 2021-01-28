package teamproject.sagi.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class ProductDto {
	private String product_id; 
	private String product_name;
	private int product_category; //d
	private double product_price; 
	private double percentage_discount;
	private double selling_price;
	private String product_desc;
	private int available_quantity;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date post_date;

	private MultipartFile thumbnail_file;
	private MultipartFile thumbnailhover_file;
	private MultipartFile main_img_file;
	private MultipartFile sub1_img_file;
	private MultipartFile sub2_img_file;
	private MultipartFile sub3_img_file;
	
	private String thumbnail;
	private String thumbnailhover;
	private String main_img;
	private String sub1_img;
	private String sub2_img;
	private String sub3_img;
	
	
	public MultipartFile getThumbnail_file() {
		return thumbnail_file;
	}
	public void setThumbnail_file(MultipartFile thumbnail_file) {
		this.thumbnail_file = thumbnail_file;
	}
	
	public MultipartFile getThumbnailhover_file() {
		return thumbnailhover_file;
	}
	public void setThumbnailhover_file(MultipartFile thumbnailhover_file) {
		this.thumbnailhover_file = thumbnailhover_file;
	}

	
	public MultipartFile getMain_img_file() {
		return main_img_file;
	}
	public void setMain_img_file(MultipartFile main_img_file) {
		this.main_img_file = main_img_file;
	}
	public MultipartFile getSub1_img_file() {
		return sub1_img_file;
	}
	public void setSub1_img_file(MultipartFile sub1_img_file) {
		this.sub1_img_file = sub1_img_file;
	}
	public MultipartFile getSub2_img_file() {
		return sub2_img_file;
	}
	public void setSub2_img_file(MultipartFile sub2_img_file) {
		this.sub2_img_file = sub2_img_file;
	}
	public MultipartFile getSub3_img_file() {
		return sub3_img_file;
	}
	public void setSub3_img_file(MultipartFile sub3_img_file) {
		this.sub3_img_file = sub3_img_file;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getThumbnailhover() {
		return thumbnailhover;
	}
	public void setThumbnailhover(String thumbnailhover) {
		this.thumbnailhover = thumbnailhover;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getSub1_img() {
		return sub1_img;
	}
	public void setSub1_img(String sub1_img) {
		this.sub1_img = sub1_img;
	}
	public String getSub2_img() {
		return sub2_img;
	}
	public void setSub2_img(String sub2_img) {
		this.sub2_img = sub2_img;
	}
	public String getSub3_img() {
		return sub3_img;
	}
	public void setSub3_img(String sub3_img) {
		this.sub3_img = sub3_img;
	}
	
		
	public int getProduct_category() {
		return product_category;
	}
	public void setProduct_category(int product_category) {
		this.product_category = product_category;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
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

	public int getAvailable_quantity() {
		return available_quantity;
	}
	public void setAvailable_quantity(int available_quantity) {
		this.available_quantity = available_quantity;
	}

	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	

	

	
}
