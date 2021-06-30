package in.vibin.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Data;
@Data
@Table(value = "discount")
public class Discounts {
@Id
private int sno;
private int discount;
}
