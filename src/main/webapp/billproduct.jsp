<%@page import="in.vibin.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="in.vibin.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>GroceryManagementApp</title>
</head>
<body>
	<main class="container-fluid">
		<%
		String isUser = (String) session.getAttribute("LOGGED_IN_USER");
		%>
		<h3>####Grocery Store</h3>
		<h4>BILL</h4>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
		<table class="table table-hover table-bordered">
			<caption>BILL</caption>
			<thead>
				<tr>
					<th id="sNo">S.NO</th>
					<th id="name">Product Name</th>
					<th id="price">Price per Quantity</th>
					<th id="orderedquantity">Ordered Quantity</th>
					<th id="amount">Amount</th>
			</thead>

			<tbody id="order-tbl">
			<tbody id="order-tbl1"></tbody>
			<c:if test="${sessionScope.LOGGED_IN_USER=='newUser'}">
     		<tbody id="order-tbl2"></tbody> <br/></c:if>
				
			
			</tbody>

		</table>
		<a href="" onClick="goToHome()" class="btn btn-info">Go To Home</a>
		<script>
		getAllProducts();
function getAllProducts(){
	
	let url="order";
	let i=0;
	let serialNo=0;
	let totalAmount=0;
	let discountAmount=0;
	let discount=localStorage.getItem("discount");
	fetch(url).then(res=>res.json()).then(res=>{
		let products=res;
		 let content="";
		for (let product of products){
				i++;
				serialNo=i;
 				content +="<tr><td>"+ serialNo + "</td><td>"+ product.name + "</td><td>"+"Rs. "+product.price +"</td><td>"+product.orderedQuantity+"</td><td>"+"Rs. "+product.amount+"</td></tr>";					
 				totalAmount = totalAmount + product.amount;
 				discountAmount=Math.round(totalAmount-(totalAmount*discount/100));
		}
		alert("processing...");
		content1="<tr><th id='totalamount' colspan=4 class='text-center'>TOTAL AMOUNT</th><th id='tamount'>Rs."+totalAmount+" </th></tr>";
		content2="<tr><th id='discountamount' colspan=4 class='text-center'>TOTAL AMOUNT("+discount+"% DISCOUNT FOR NEW USER)</th><th id='damount'>Rs."+discountAmount+" </th></tr>";
		document.querySelector("#order-tbl").innerHTML=content;
		document.querySelector("#order-tbl1").innerHTML=content1; 
		if(discount>0){
		document.querySelector("#order-tbl2").innerHTML=content2;
		}
				})
				let url2="order/deleteTable";
	axios.delete(url2).then(res => {
	});

}
function goToHome(){
	event.preventDefault();
	let url="users/logout";
	axios.post(url).then(res=>{
		let data = res.data;
		if(data==true){
			window.location.href="index.jsp";
		}
		
}
	);
}
</script>
	</main>
</body>
</html>
