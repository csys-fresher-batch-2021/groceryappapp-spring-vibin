<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Display product</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<h3>Display product</h3>
		<label>Enter the name</label> <input type="text" id="myInput"
			onkeyup="myFunction()" placeholder="Search for names..." autofocus>
		<table class="table table-hover table-bordered" id="table">
			<caption>List of Products</caption>

			<thead>
				<tr>
					<th id="sno">S.No</th>
					<th id="id">ID</th>
					<th id="name">Name</th>
					<th id="price">Price per Quantity</th>
					<th id="quantity">Available Quantity</th>

				</tr>
			</thead>
			<tbody id="product-tbl">
			</tbody>
		</table>
		<script>
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
 				content +="<tr><td>"+ serialNo + "</td><td>"+ product.id + "</td><td>"+ product.name +"</td><td>"+"Rs. "+product.price+"</td><td>"+product.quantity+"</td></tr>";					
			}
		}
		document.querySelector("#product-tbl").innerHTML=content; 
		
		})
		
	}


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
			if (txtValue.toUpperCase().indexOf(filter) >-1) {
				row[i].style.display = "";
			} else {
				row[i].style.display = "none";
			}
		}
	}
}

</script>
	</main>
</body>

</html>