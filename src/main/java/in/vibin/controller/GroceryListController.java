package in.vibin.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import in.vibin.model.AddQuantity;
import in.vibin.model.BuyProduct;
import in.vibin.model.Message;
import in.vibin.model.OrderProduct;
import in.vibin.model.Product;

@RestController
@RequestMapping("grocery")
public class GroceryListController {

	@Autowired
	GroceryRepository groceryRepository;
	@Autowired
	OrderRepository orderRepository;
	@GetMapping
	public Iterable<Product> list() {
		return groceryRepository.findAll();
	}
	@PostMapping("addProduct")
	public ResponseEntity<Message> addProduct(@Valid @RequestBody Product product) {
		String name = product.getName().toLowerCase();
		Message message = new Message();
		HttpStatus httpStatus = HttpStatus.BAD_REQUEST;
		boolean isExitID=groceryRepository.getID(name) ==null;
		if(isExitID) {
			groceryRepository.save(product);
			httpStatus = HttpStatus.OK;
			message.setInfoMessage(name+" added successfully");
			return new ResponseEntity<>(message, httpStatus);
		}else {
			httpStatus = HttpStatus.BAD_REQUEST;
			message.setErrorMessage(name+" already exist");
			return new ResponseEntity<>(message, httpStatus);
		}
	}
	@DeleteMapping("delete/{id}")
	public boolean remove(@PathVariable("id") Integer id) {
		
		groceryRepository.deleteById(id);
		return true;
	}
	@PatchMapping("addQuantity")
	public void addQuantity(@RequestBody AddQuantity addQuantity) {
		groceryRepository.addQuantity(addQuantity.getId(),addQuantity.getAddingQuantity());
	}
	@PostMapping("orderProduct")
	public void orderProduct(@RequestBody BuyProduct buyProduct) {
		int id=buyProduct.getId();
		String name=buyProduct.getName();
		double price=buyProduct.getPrice();
		int availableQuantity=buyProduct.getAvailableQuantity();
		int orderQuantity=buyProduct.getOrderQuantity();
		int remainingQuantity=availableQuantity-orderQuantity;
		double amount=orderQuantity*price;//worked
		Product product=new Product();
		product.setId(id);
		product.setQuantity(remainingQuantity);
		updateQuantity(product);
		OrderProduct orderProduct=new OrderProduct();
		orderProduct.setName(name);
		orderProduct.setOrderedQuantity(orderQuantity);
		orderProduct.setPrice(price);
		orderProduct.setAmount(amount);
		orderRepository.save(orderProduct);
	}
	@PatchMapping("updateQuantity")
		public void updateQuantity(@RequestBody Product product) {
		groceryRepository.updateQuantity(product.getId(),product.getQuantity());
		}
	@PatchMapping("cancelOrder")
	public void cancelOrder(@RequestBody BuyProduct buyProduct) {
		groceryRepository.updateQuantityByName(buyProduct.getName(), buyProduct.getOrderQuantity());
		orderRepository.deleteById(buyProduct.getId());
	}
}
