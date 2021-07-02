<!DOCTYPE html>
<%@page import="in.vibin.controller.OrderListController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<title>MyApp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<h3>Welcome To Grocery Management App</h3>
		<br>
		<c:choose>
			<c:when test="${sessionScope.LOGGED_IN_USER=='user'}">
				<p style="color: green">USER Login</p>
				<br />
			</c:when>
			<c:when test="${sessionScope.LOGGED_IN_USER=='newUser'}">
				<p style="color: green">NEWUSER Login</p>
				<br />
			</c:when>
			<c:when test="${sessionScope.LOGGED_IN_ADMIN=='admin'}">
				<p style="color: green">ADMIN Login</p>
				<br />
			</c:when>
			<c:otherwise>
				<script>
		removeCart();
			function removeCart(){
			let url="order/removeCart";
			axios.patch(url).then(res=>{
			})
			}
			
			</script>
			</c:otherwise>
		</c:choose>


		<div id="message" style="color: green"></div>
		<p>REFERENCE(for test purpose only I show this login
			credentials...)</p>
		<br>
		<p>
			Admin login<br>MobileNumber=9659644868<br>Password=Vibin#321
		</p>
		<br>
		<p>
			User login<br>MobileNumber=9659644868<br>Password=Vibin#321
		</p>
		<script>
		getDiscount();
		function getDiscount(){
			let url2="discount";
			axios.get(url2).then(res=>{
				let discount=res.data;
				localStorage.setItem("discount",discount);
				if(discount>0){
				document.querySelector("#message").innerHTML = discount + "% Discount for new user";
				};
				})
		}
		</script>
	</main>
</body>
</html>
