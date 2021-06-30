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
	<h3>Add Quantity</h3>
		<form onsubmit="addQuantity()">
			<label>Enter the quantity to add</label> <input type="number"
				name="addedquantity" id="addedquantity" min="1" max="1000"
				 placeholder="Enter the quantity" required autofocus><br>
			<button class="btn btn-info">Add Quantity</button>
		</form>
<script >
function addQuantity(){
	event.preventDefault();
	let id=localStorage.getItem("id");
	let addingQuantity=document.querySelector("#addedquantity").value;
	let url="grocery/addQuantity";
	let addQuantity={
			"id":id,
			"addingQuantity":addingQuantity
	};
	axios.patch(url,addQuantity).then(res=>{
		alert("Quantity added successfully");
		localStorage.clear();
		window.location.href="alterlist.jsp";
	});
}
</script>
	</main>
</body>
</html>
