<%@page import="in.vibin.service.ProductService"%>
<%@page import="in.vibin.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="in.vibin.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>GroceryManagementApp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<%
		String isUser = (String) session.getAttribute("LOGGED_IN_USER");
		String isAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
		if (isUser != "user"&&isUser != "newUser" && isAdmin == null) {
			response.sendRedirect("userlogin.jsp?errorMessage=Please login");
		}
		%>

		<h3>List of products</h3>
		<label>Enter the name</label> <input type="text" id="myInput"
			onkeyup="myFunction()" placeholder="Search for names..." autofocus>
		<table class="table table-hover table-bordered" id="table">
			<caption>List of Products</caption>
			<thead>

				<tr>
					<th id="sNo">S.NO</th>
					<th id="id">ID</th>
					<th id="productName">Product Name</th>
					<th id="price">Price per Quantity</th>
					<th id="quantity">Available Quantity</th>
					<%
					if (isAdmin == null) {
					%>
					<th id="buy">Buy</th>
					<%
					}
					%>
					<%
					if (isAdmin != null && isAdmin.equals("admin")) {
					%>
					<th id="addquantity">Add quantity</th>
					<th id="delete">Delete</th>
					<%
					}
					%>
				
			</thead>
			<tbody>
				<tr>
					<%
					int i = 1;
					List<Product> productList = ProductService.getProduct();
					for (Product product : productList) {
						int id=product.getId();
						String name = product.getName();
						double price = product.getPrice();
						int quantity = product.getQuantity();
						int serialNo = i;
					%>
					<%
					if (isUser == "user"||isUser=="newUser" && quantity > 0) {
						i++;
					%>

					<td><%=serialNo%></td>
					<td><%=id%></td>
					<td><%=name%></td>
					<td>Rs. <%=price%></td>
					<td><%=quantity%></td>
					<%
					} 
					else if(isAdmin=="admin"){
					i++;
					%>
					<td><%=serialNo%></td>
					<td><%=id%></td>
					<td><%=name%></td>
					<td>Rs. <%=price%></td>
					<td><%=quantity%></td>

					<%
					}
					%>
					<%
					if (isAdmin == null && quantity > 0) {
					%>
					<td><a
						href="BuyProductServlet?id=<%=id%>&name=<%=name%>&price=<%=price%>&quantity=<%=quantity%>"
						class="btn btn-info">Buy</a></td>
					<%
					}
					%>

					<%
					if (isAdmin != null && isAdmin.equals("admin")) {
					%>
					<td><a
						href="AddQuantityServlet?productID=<%=id%>&availablequantity=<%=quantity%>"
						class="btn btn-info">Add quantity</a>
					<td><a href="DeleteProductServlet?productID=<%=id%>"
						class="btn btn-danger">Delete</a> <%
 }
 %>
				</tr>
			</tbody>
			<%
			}
			%>
		</table>
		<%
		if (isAdmin != null && isAdmin.equals("admin")) {
		%>
		<a href="addproduct.jsp" class="btn btn-info">ADD Product</a>
		<%
		}
		%>
	</main>
	<script>
		function myFunction() {
			let input, filter, table, row, data, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table");
			row = table.getElementsByTagName("tr");
			for (i = 0; i < row.length; i++) {
				data = row[i].getElementsByTagName("td")[2];
				if (data) {
					txtValue = data.textContent || data.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						row[i].style.display = "";
					} else {
						row[i].style.display = "none";
					}
				}
			}
		}
	</script>
</body>
</html>
