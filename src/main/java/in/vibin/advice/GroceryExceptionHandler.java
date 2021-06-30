package in.vibin.advice;

import java.util.List;

import javax.validation.UnexpectedTypeException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import in.vibin.exceptions.SuccessfullException;
import in.vibin.exceptions.ValidationException;
import in.vibin.model.GroceryError;

@ControllerAdvice
public class GroceryExceptionHandler {
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ExceptionHandler(ValidationException.class)
	public ResponseEntity<GroceryError> mapValidationException(ValidationException e) {
		GroceryError groceryError = new GroceryError(e.getMessage(), HttpStatus.BAD_REQUEST);
		return new ResponseEntity<>(groceryError, HttpStatus.BAD_REQUEST);

	}

	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ExceptionHandler(SuccessfullException.class)
	public ResponseEntity<GroceryError> mapSuccessfullException(SuccessfullException e) {
		GroceryError groceryError = new GroceryError(e.getMessage(), HttpStatus.BAD_REQUEST);
		return new ResponseEntity<>(groceryError, HttpStatus.BAD_REQUEST);
	}

	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<GroceryError> methodArgumentNotValidException(MethodArgumentNotValidException ex) {
		BindingResult result = ex.getBindingResult();
		List<org.springframework.validation.FieldError> fieldErrors = result.getFieldErrors();
		GroceryError error = new GroceryError("validation error", null);
		for (org.springframework.validation.FieldError fieldError : fieldErrors) {
			error.addFieldError(fieldError.getField(), fieldError.getDefaultMessage());
		}
		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}

	@ExceptionHandler(Exception.class)
	public ResponseEntity<GroceryError> mapException(Exception e) {
		GroceryError employeeError = new GroceryError(e.getMessage(), HttpStatus.BAD_REQUEST);
		e.printStackTrace();
		return new ResponseEntity<>(employeeError, HttpStatus.BAD_REQUEST);
	}

	@ExceptionHandler(UnexpectedTypeException.class)
	public ResponseEntity<GroceryError> mapUnexpectedTypeException(UnexpectedTypeException e) {
		GroceryError employeeError = new GroceryError(e.getMessage(), HttpStatus.BAD_REQUEST);
		return new ResponseEntity<>(employeeError, HttpStatus.BAD_REQUEST);
	}
}
