package teamproject.sagi.dto;

public class ItemDetailDto {
	private String product_name;
	private String product_detail;
	private double product_price;
	private double percentage_discount;
	private double available_quantity;
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	public double getAvailable_quantity() {
		return available_quantity;
	}
	public void setAvailable_quantity(double available_quantity) {
		this.available_quantity = available_quantity;
	}
	
	public double getPercentage_discount() {
		return percentage_discount;
	}
	public void setPercentage_discount(double percentage_discount) {
		this.percentage_discount = percentage_discount;
	}
	
	
	
}
