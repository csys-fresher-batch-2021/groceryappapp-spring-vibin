package in.vibin.controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.vibin.dao.SellingRepository;
import in.vibin.dao.UserRepository;
import in.vibin.model.Message;
import in.vibin.model.RegisterUser;
import in.vibin.model.User;
import in.vibin.validator.MobileNumberValidation;

@RestController
@RequestMapping("users")
public class UserController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	SellingRepository sellingRepository;

	@GetMapping
	public Iterable<User> list() {
		return userRepository.findAll();
	}
	
	
@GetMapping("newUser/{mobileNumber}")
public boolean newUser(@PathVariable("mobileNumber") Long mobileNumber) {
	return sellingRepository.isExistUser(mobileNumber);
}


	@PostMapping("login")
	public ResponseEntity<Message> login(@Valid @RequestBody User user, HttpSession session) {
		User userResult = null;
		Message message = new Message();
		HttpStatus httpStatus = HttpStatus.BAD_REQUEST;
		Long mobileNumber = user.getMobileNumber();
		boolean isValidMobileNumber = MobileNumberValidation.checkMobileNumber(mobileNumber);
		if (isValidMobileNumber) {
			userResult = userRepository.findByMobileNumberAndPassword(mobileNumber, user.getPassword()).orElse(null);
		} else {
			return new ResponseEntity<>(message, httpStatus);
		}
		if (userResult != null) {
			message.setInfoMessage("Login successfully");
			httpStatus = HttpStatus.OK;
			boolean isExist=sellingRepository.isExistUser(mobileNumber);
			if(isExist) {
			session.setAttribute("LOGGED_IN_USER", "user");
			}else {
				session.setAttribute("LOGGED_IN_USER", "newUser");
			}
			session.setAttribute("userMobileNumber", mobileNumber);
		}
		return new ResponseEntity<>(message, httpStatus);

	}

	@PostMapping("logout")
	public boolean logout(HttpSession session) {
		session.invalidate();
		return true;

	}

	@PostMapping("registerUser")
	public ResponseEntity<Message> registerUser(@Valid @RequestBody RegisterUser registerUser) {
		Long mobileNumber = registerUser.getMobileNumber();
		boolean isValidMobileNumber = MobileNumberValidation.checkMobileNumber(mobileNumber);
		Integer id = null;
		User user = new User();
		Message message = new Message();
		user.setMobileNumber(mobileNumber);
		user.setPassword(registerUser.getPassword());
		HttpStatus httpStatus = HttpStatus.BAD_REQUEST;
		boolean isExist = false;
		if (isValidMobileNumber) {

			id = getID(mobileNumber);
			if (id != null) {
				isExist = true;
			}

			if (isExist) {
				httpStatus = HttpStatus.BAD_REQUEST;
				message.setErrorMessage("User already exist please check the mobile number");
				return new ResponseEntity<>(message, httpStatus);
			} else if (registerUser.getPassword().equals(registerUser.getRePassword())) {
				userRepository.save(user);
				httpStatus = HttpStatus.OK;
				message.setInfoMessage("User registered successfully,You can login");
				return new ResponseEntity<>(message, httpStatus);
			} else {
				httpStatus = HttpStatus.BAD_REQUEST;
				message.setErrorMessage("Confirmation password not matched");
				return new ResponseEntity<>(message, httpStatus);
			}
		} else {
			httpStatus = HttpStatus.BAD_REQUEST;
			message.setErrorMessage("Invalid mobile number");
			return new ResponseEntity<>(message, httpStatus);
		}
	}

	@GetMapping("GetID/{mobileNumber}")
	public Integer getID(@PathVariable("mobileNumber") Long mobileNumber) {
		return userRepository.getID(mobileNumber);

	}
}