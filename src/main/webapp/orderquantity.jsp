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
		<h3>Order Quantity</h3>
		<form onsubmit="orderProduct()">
			<label>Enter the quantity</label> <input type="number"
				name="orderedquantity" id="orderedquantity" min="1" max=""
				placeholder="Enter the quantity" required autofocus><br>
			<button class="btn btn-info">Order</button>
		</form>
<script>
		let availableQuantity = function() {
			let quantity = localStorage.getItem("quantity");
			return quantity;
		}
		document.querySelector("#orderedquantity").setAttribute("max", availableQuantity());
		function orderProduct(){
			event.preventDefault();
			let id=localStorage.getItem("id");
			let name=localStorage.getItem("name");
			let price=localStorage.getItem("price");
			let quantity=localStorage.getItem("quantity");
			let orderQuantity= document.querySelector("#orderedquantity").value;
			let url="grocery/orderProduct";
			let orderProduct={
					"id":id,
					"name":name,
					"price":price,
					"availableQuantity":quantity,
					"orderQuantity":orderQuantity
			}
			axios.post(url,orderProduct).then(res=>{
			 window.location.href="orderproduct.jsp";	 
			})
			
		}
			</script>
	</main>
	
</body>
</html>