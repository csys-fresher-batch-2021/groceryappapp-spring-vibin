<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<form onsubmit="login()" method="post">
			<h3>Admin Login</h3>
			<label>Mobilenumber</label> <input type="number" name="mobileNumber"
				id="mno" placeholder="Enter the mobile number"
				 autofocus required> <br> <label>Password</label>
			<input type="password" name="password" id="password"
				placeholder="Enter the password"
				required> <br>
			<button type="submit" class="btn btn-info">ADMIN LOGIN</button>
			<br>
		</form>
		<div id="message"></div>
	</main>
<script>
function login(){
	event.preventDefault();
	let mobileNumber = document.querySelector("#mno").value;
	let password = document.querySelector("#password").value;
	let admin={
		    "mobileNumber" : mobileNumber,
		    "password" : password,					    
		};
	let url ="admin/login";
	axios.post(url,admin).then(res=>{
		alert("Login successfully");
		window.location.href="index.jsp";
		
	}).catch(err=>{
		document.querySelector("#message").innerHTML= "Login failed";
	});
}

</script>
</body>
</html>