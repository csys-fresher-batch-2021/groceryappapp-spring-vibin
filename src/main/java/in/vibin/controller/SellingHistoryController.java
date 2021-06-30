package in.vibin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.vibin.dao.SellingRepository;
import in.vibin.jdbctemplate.OrderProducts;
import in.vibin.model.Message;
import in.vibin.model.OrderProduct;
import in.vibin.model.SellingHistory;

@RestController
@RequestMapping("sellingHistory")
public class SellingHistoryController {
	@Autowired
	OrderListController orderListController;
	@Autowired
	SellingRepository sellingRepository;
	@Autowired
	OrderProducts orderProducts;

	@GetMapping
	public Iterable<SellingHistory> list() {
		return sellingRepository.findAll();
	}

	@PatchMapping("addSellingHistory")
	public ResponseEntity<Message> addSellingHistory(HttpServletRequest request) {
		Message message=new Message();
		HttpStatus httpStatus = HttpStatus.OK;
		List<OrderProduct> orderList = orderProducts.getAllOrder();
		int size = orderList.size();
		if(size<=0) {
			message.setErrorMessage("Please purchase a product");
			httpStatus = HttpStatus.BAD_REQUEST;
			return new ResponseEntity<>(message, httpStatus);
		}
        HttpSession session=request.getSession(); 
		long mobileNumber = (long) session.getAttribute("userMobileNumber");
		for (OrderProduct orderProductList : orderList) {
			sellingRepository.addSellingHistory(mobileNumber, orderProductList.getName(), orderProductList.getPrice(),
					orderProductList.getOrderedQuantity(), orderProductList.getAmount());
		}
		message.setErrorMessage("Selling history added successfully");
		return new ResponseEntity<>(message, httpStatus);
	}

}
