package in.vibin;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import in.vibin.controller.DiscountController;
import in.vibin.controller.UserController;

@SpringBootTest
class ApplicationTests {
@Autowired
UserController d;
	@Test
	
	void contextLoads() {
		try {
			long mobileNumber=9659644868L;
		boolean discount=d.newUser(mobileNumber);	
		System.out.println(discount);
		}catch(Exception e) {
			System.out.println("ERROR OCCURED");
			e.printStackTrace();
		}
}
}
