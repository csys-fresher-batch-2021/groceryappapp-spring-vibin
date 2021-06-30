package in.vibin.model;

import lombok.Data;

@Data
public class BuyProduct {
private int id;
private String name;
private double price;
private int availableQuantity;
private int orderQuantity;
}
