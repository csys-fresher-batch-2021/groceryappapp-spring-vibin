<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Discount</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
	<h3>Discount Details</h3>
	<div id="message"></div>
		<form onsubmit="updateDiscount()">
			<label>Enter the discount % to update</label> <input  type="number"
				name="updateddiscount" id="updateddiscount" min="0" max="100"
				 placeholder="Enter the discount %(0-100)" required autofocus><br>
			<button class="btn btn-info">Update Discount</button>
		</form>
		<script >
		function updateDiscount(){
			let updatedDiscount=document.querySelector("#updateddiscount").value;
			let url="discount/updateDiscount/"+updatedDiscount;
			axios.patch(url).then(res=>{
				alert("Discount updated sucessfully");
			})
		}
		getdiscount();
		function getdiscount(){
			let url2="discount";
			axios.get(url2).then(res=>{
				let discount=res.data;
			document.querySelector("#message").innerHTML = "Current discount % for new user is ,<h3>"+discount+"% <h3>";
		})
		}
		</script>

	</main>
</body>
</html>