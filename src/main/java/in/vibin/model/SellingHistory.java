package in.vibin.model;

import java.sql.Date;
import java.sql.Time;

import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Data;
import lombok.ToString;
@Data
@Table(value = "selling_history")
@ToString
public class SellingHistory {
	@Column("mobilenumber")
	private long mobileNumber;
	@Column("product_name")
	private String productName;
	@Column("price_per_quantity")
	private double pricePerQuantity;
	@Column("ordered_quantity")
	private int orderedQuantity;
	private double amount;
	@Column("buy_date")
	private Date orderDate;
	@Column("buy_time")
	private Time orderTime;
}
