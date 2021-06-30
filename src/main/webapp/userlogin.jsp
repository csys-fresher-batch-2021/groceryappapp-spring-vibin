<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main class="container-fluid">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
		<form onsubmit="login()" method="post">
			<h3>User Login</h3>
			<label>Mobilenumber</label> <input type="number" min="0"
				name="mobileNumber" id="mno" placeholder="Enter the mobile number"
				autofocus required> <br> <label>Password</label> <input
				type="password" name="password" id="password"
				placeholder="Enter the password" required> <br>
			<button type="submit" class="btn btn-info">USER LOGIN</button>
			<br>
		</form>
		<div id="message" style="color:red"></div>
	</main>
	<script>
function login(){
	event.preventDefault();
	let mobileNumber = document.querySelector("#mno").value;
	let password = document.querySelector("#password").value;
	let user={
		    "mobileNumber" : mobileNumber,
		    "password" : password,					    
		};
	let url = "users/login";
	axios.post(url,user).then(res=>{
		alert("Login successfully");
		window.location.href="index.jsp";
	}).catch(err=>{
		document.querySelector("#message").innerHTML= "Login failed";
	});
}

</script>
</body>
</html>