<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>GroceryManagementApp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
	

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
					<th id="addquantity">Add quantity</th>
					<th id="delete">Delete</th>
			</thead>
			<tbody id=product-tbl>
			</tbody>
		</table>

		<a href="addproduct.jsp" class="btn btn-info">ADD Product</a><br>
		<div id="message" style="color:red"></div>
		<script src="js/alterlist.js"></script>
	</main>
	
</body>
</html>
