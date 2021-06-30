<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<form onsubmit="addProduct()">
			<h3>Add Products</h3>
			 <label>Product name</label> <input
				type="text" name="name" id="name" placeholder="Enter the name"
				required autofocus> <br> <label>Price per Quantity(Rs)</label> <input
				type="number" name="price" id="price" min="1" max="1000"step="0.01"
				placeholder="Enter the price" required> <br> <label>Quantity</label>
			<input type="number" name="quantity" id="quantity" min="1" max="1000"
				placeholder="Enter the quantity" required> <br>
			<button class="btn btn-info">Add Product</button>
			<br>
		</form>
		<div style="color:red" id="message"></div>
		<script >
		function addProduct(){
				event.preventDefault();
				let name = document.querySelector("#name").value.toLowerCase();
				let price = document.querySelector("#price").value;
				let quantity = document.querySelector("#quantity").value;
				let product={
					    "name" : name,
					    "price" : price,	
					    "quantity":quantity
					};
				let url = "grocery/addProduct";
				content="";
				axios.post(url,product).then(res=>{
					console.log("Success");
					let data = res.data;
					content+=data.infoMessage;
					alert(content);
					
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