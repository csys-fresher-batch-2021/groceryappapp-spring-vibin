package in.vibin.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Data;

@Data
@Table(value = "grocery_list")
public class Product {

	@Id

	private int id;
	@NotNull(message = "Product name should not be empty")
	private String name;
	@Min(value = 1, message = "Price should be greater than or equal to 1")
	@Max(value = 1000, message = "price should not exceed 1000rs")
	private double price;
	@Min(value = 1, message = "Quantity should be greater than or equal to 1")
	@Max(value = 1000, message = "quantity should not exceed 1000n")
	private int quantity;

	@Override
	public String toString() {
		return "Task [id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + "]";
	}

}
