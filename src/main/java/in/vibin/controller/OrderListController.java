package in.vibin.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.vibin.dao.GroceryRepository;
import in.vibin.dao.OrderRepository;
import in.vibin.jdbctemplate.OrderProducts;
import in.vibin.model.OrderProduct;

@RestController
@RequestMapping("order")
public class OrderListController {
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	OrderProducts orderProducts;
	@Autowired
	GroceryRepository groceryRepository;

	@GetMapping
	public Iterable<OrderProduct> list() {
		return orderRepository.findAll();
	}

	@PostMapping("addOrderProduct")
	public void addOrderProduct(@Valid @RequestBody OrderProduct orderProduct) {
		orderRepository.save(orderProduct);
	}

	@DeleteMapping("delete/{id}")
	public boolean remove(@PathVariable("id") Integer id) {
		orderRepository.deleteById(id);
		return true;
	}

	@DeleteMapping("deleteTable")
	public void deleteTable() {
		orderRepository.deleteAll();
	}

	@PatchMapping("removeCart")
	public void removeCart() {
		boolean isExist = true;
		try {
			isExist = orderProducts.getAllOrder().isEmpty();
		} catch (Exception e) {
			isExist = true;
			e.printStackTrace();
		}
		if (!isExist) {
			List<OrderProduct> orderList = orderProducts.getAllOrder();
			for (OrderProduct orderProduct : orderList) {
				groceryRepository.updateQuantityByName(orderProduct.getName(), orderProduct.getOrderedQuantity());
				orderRepository.deleteById(orderProduct.getId());
			}
		}
	}
}
