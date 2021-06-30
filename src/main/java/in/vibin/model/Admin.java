package in.vibin.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.Data;

@Data
@Table(value = "admin_details")
public class Admin {

	@Id
	private int id;
	
	@Min(value = 1, message = "should contain 10 digit")
	@Max(value = 9999999999L, message = "should contain 10 digit")
	@Column("mobilenumber")
	private Long mobileNumber;

	@NotNull(message = "password should not empty")
	@JsonProperty(access = Access.WRITE_ONLY)
	@Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=()])(?=\\S+$).{8,12}$", message = "Invalid password Format")
	@Column("password")
	private String password;
	

	
	
}
