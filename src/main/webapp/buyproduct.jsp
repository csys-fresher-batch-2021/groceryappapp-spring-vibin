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
		if (isUser != "user" && isUser != "newUser" ) {
			response.sendRedirect("userlogin.jsp");
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
					<th id="buy">Buy</th>
			</thead>
			<tbody id="product-tbl">
			</tbody>
			
		</table>
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
		function buyProduct(id,name,price,quantity){
			event.preventDefault();
			localStorage.setItem("id",id);
			localStorage.setItem("name",name);
			localStorage.setItem("price",price);
			localStorage.setItem("quantity",quantity);
			window.location.href="orderquantity.jsp";
		}
		getAllProducts();
		function getAllProducts(){
			let url="grocery";
			let i=0;
			let serialNo=0;
			fetch(url).then(res=>res.json()).then(res=>{
				console.log(res);
				let products=res;
				 let content="";
				for (let product of products){
					if(product.quantity>0){
						i++;
						serialNo=i;
		 				content +="<tr><td>"+ serialNo + "</td><td>"+ product.id + "</td><td>"+ product.name +"</td><td>"+"Rs. "+product.price+"</td><td>"+product.quantity+"</td><td><button class='btn btn-info'  onclick='buyProduct("
						+ product.id + ",\"" + product.name + "\","+product.price+","+product.quantity+")'>Buy</button> </td></tr></tr>";					
					}
				}
				document.querySelector("#product-tbl").innerHTML=content; 
				
				})
				
			}
	</script>
</body>
</html>
