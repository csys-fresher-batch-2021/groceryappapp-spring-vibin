package in.vibin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.vibin.dao.DiscountRepository;
import in.vibin.jdbctemplate.Discount;
@RestController
@RequestMapping("discount")
public class DiscountController {
@Autowired
Discount discount;
@Autowired
DiscountRepository discountRepository;
@GetMapping
public int discount() {
	return discount.getDiscount();
	
}
@PatchMapping("updateDiscount/{discount}")
public void updateDiscount(@PathVariable("discount") Integer discount) {
	discountRepository.updateDiscount(discount);
}
}
