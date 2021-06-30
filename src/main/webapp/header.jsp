<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/css/style.css">

<header>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">GroceryManagementApp</a>
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<%
		String isAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
		String isUser = (String) session.getAttribute("LOGGED_IN_USER");
		%>
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active">
					<%
					if (isAdmin == "admin") {
					%> <a class="nav-link"
					href="displayproduct.jsp">DisplayOverview<span class="sr-only">(current)</span></a>
					<%
					}
					%> <%
 if (isAdmin == null && isUser == null) {
 %> <a class="nav-link"
					href="displayproduct.jsp">DisplayProduct<span class="sr-only">(current)</span></a>
					<%
					}
					%>
				</li>
				<%
				if (isAdmin != "admin") {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="buyproduct.jsp">BuyProduct</a></li>
				<%
				}
				%>
				<%
				if (isAdmin == "admin") {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="alterlist.jsp">AlterList</a></li>
				<%
				}
				%>
			</ul>

			<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
				<%
				if (isAdmin == null && isUser == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href=" adminlogin.jsp">AdminLogin</a></li>
				<li class="nav-item active"><a class="nav-link"
					href=" userlogin.jsp">UserLogin</a></li>
				<%
				}
				%>
				<%
				if (isUser == null && isAdmin == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="registeruser.jsp">RegisterUser</a></li>
				<%
				}
				%>
				<%
				if (isAdmin == "admin") {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="discount.jsp">Discount</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="sellinghistory.jsp">PurchaseHistory</a></li>
				<li class="nav-item active"><a class="nav-link"
					onClick="logout()"	href="">Logout=></a></li>
				<%
				}
				%>
				<%
				if (isUser == "user"||isUser == "newUser") {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="orderproduct.jsp">Cart</a></li>
				<li class="nav-item active"><a class="nav-link"
				onClick="logout()"	href="">Logout=></a></li>
				<%
				}
				%>
			</ul>

		</div>
	</nav>
	<script>
function logout(){
	event.preventDefault();
	let url="users/logout";
	axios.post(url).then(res=>{
		let data = res.data;
		if(data==true){
			alert("Successfully logedout")
			window.location.href="index.jsp";
		}
		
}
	);
}
</script>
</header>
