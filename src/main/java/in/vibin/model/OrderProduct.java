package in.vibin.model;

import org.springframework.data.annotation.Id;

import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(value = "order_list")
public class OrderProduct {
	@Id
	@Column("ordered_id")
	private int id;
	private String name;
	@Column("price_per_quantity")
	private double price;
	@Column("ordered_quantity")
	private int orderedQuantity;
	private double amount;
	
}
