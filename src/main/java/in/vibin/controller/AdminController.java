package in.vibin.controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.vibin.dao.AdminRepository;
import in.vibin.model.Admin;
import in.vibin.model.Message;
import in.vibin.validator.MobileNumberValidation;

@RestController
@RequestMapping("admin")
public class AdminController {

	@Autowired
	AdminRepository adminRepository;

	@GetMapping
	public Iterable<Admin> list() {
		return adminRepository.findAll();
	}

	@PostMapping("login")
	public ResponseEntity<Message> login(@Valid @RequestBody Admin admin,HttpSession session){
		Admin adminResult=null;
		Message message = new Message();
		HttpStatus httpStatus= HttpStatus.BAD_REQUEST;
		Long mobileNumberLong=admin.getMobileNumber();
		boolean isValidMobileNumber=MobileNumberValidation.checkMobileNumber(mobileNumberLong);
		if(isValidMobileNumber) {
		adminResult = adminRepository.findByMobileNumberAndPassword(admin.getMobileNumber(), admin.getPassword())
				.orElse(null);
		}
		else {
			return new ResponseEntity<>(message, httpStatus);
		}
		if (adminResult != null) {
			message.setInfoMessage("Login successfully");
			httpStatus = HttpStatus.OK;
			session.setAttribute("LOGGED_IN_ADMIN", "admin");
		}
		return new ResponseEntity<>(message, httpStatus);

	}
	@PostMapping("logout")
	public boolean logout(HttpSession session) {
		session.invalidate();
		return true;

	}
	

}
