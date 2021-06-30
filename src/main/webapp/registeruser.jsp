<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<form onsubmit="regiterUser()" method="post">
			<h3>Register User</h3>
			<h6 style="color:Tomato;">The mobile number must start with(6-9)and contains 10 digit</h6>
			<h6 style="color:Tomato;">The pasword must contain one(a-z)(A-Z)(0-9)(!@#$%^*_=+-)and(8-12 digit)</h6>
			<label>Enter the Mobilenumber</label> <input type="tel"
				name="mobileNumber" id="mno" placeholder="Enter the mobile number"
				pattern="[6-9][0-9]{9}" autofocus required> <br> <label>Enter
				the Password</label> <input type="password" name="password" id="password"
				placeholder="Enter the password"
				pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$"
				required> <br> <label>Re-Enter the Password</label> <input
				type="password" name="repassword" id="repassword"
				placeholder="Enter the password"
				required> <br>
			<button type="submit" class="btn btn-info">REGISTER</button>
			<br>
		</form>
		<div id="message" style="color:red"></div>
		<script >
		function regiterUser(){
				event.preventDefault();
				let mobileNumber = document.querySelector("#mno").value;
				let password = document.querySelector("#password").value;
				let rePassword = document.querySelector("#repassword").value;
				let registerUser={
					    "mobileNumber" : mobileNumber,
					    "password" : password,	
					    "rePassword":rePassword
					};
				let url = "users/registerUser";
				content="";
				axios.post(url,registerUser).then(res=>{
					console.log("Success");
					let data = res.data;
					content+=data.infoMessage;
					alert(content);
					window.location.href="userlogin.jsp";
					
				}).catch(err=>{
			 		console.log("Error");
			 		 let data = err.response.data;
			 		content+=data.errorMessage;
			 		document.querySelector("#message").innerHTML= content; 
				});
			}
		
		</script>
	</main>

</body>
</html>