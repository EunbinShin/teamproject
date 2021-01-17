package teamproject.sagi.dto;

public class ItemDetailDto {
	private String product_id;
	private String product_name;
	private String product_categorie;
	private double product_price;
	private int percentage_discount;
	private int available_quantity;
	
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
	public void setPercentage_discount(int percentage_discount) {
		this.percentage_discount = percentage_discount;
	}

	public int getAvailable_quantity() {
		return available_quantity;
	}
	public void setAvailable_quantity(int available_quantity) {
		this.available_quantity = available_quantity;
	}
	

}
