package in.vibin.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import lombok.Data;

@Data
public class AddQuantity {

	private int id;	
	@Min(value = 1, message = "Quantity should be greater than or equal to 1")
	@Max(value = 1000, message = "quantity should not exceed 1000n")
	private int addingQuantity;
}
