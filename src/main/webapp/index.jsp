<!DOCTYPE html>
<%@page import="in.vibin.controller.OrderListController"%>
<html lang="en">
<head>
<title>MyApp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<h3>Welcome To Grocery Management App</h3>
		<br>
		<%
		String isAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
		String isUser = (String) session.getAttribute("LOGGED_IN_USER");
		if (isUser == null) {%>
			<script>
			removeCart();
			function removeCart(){
			let url="order/removeCart";
			axios.patch(url).then(res=>{
			})
			}
			
			</script>
		<%}
		if (isAdmin == "admin") {
			out.println("<font color='green'> ADMIN Login </font>");
		%><br>

		<%
		}
		if (isUser == "user") {
		out.println("<font color='green'> USER Login </font>");
		%><br>
		<%
		}
		if (isUser == "newUser") {
		out.println("<font color='green'>NEW USER Login </font>");
		%><br>
		<%
		}
		%>
<div id="message" style="color:green"></div>
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
