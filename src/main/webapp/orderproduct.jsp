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
		%>
		<h3>Ordered Product List</h3>
		<table class="table table-hover table-bordered">
			<caption>List of Products</caption>
			<thead>
				<tr>
					<th id="sNo">S.NO</th>
					<th id="name">Name</th>
					<th id="price">Price per Quantity</th>
					<th id="orderedquantity">Ordered Quantity</th>
					<th id="amount">Amount</th>
					<th id="amount">Cancel Order</th>
			</thead>
			<tbody id="order-tbl">
			<tbody id="order-tbl1"></tbody>
			<%if(isUser=="newUser"){%>
				<tbody id="order-tbl2"></tbody>
			<%}%>
			</tbody>

		</table>
		<a href="" onClick="SellingHistory()" class="btn btn-info">Proceed
			for Bill</a>
		<div id="message" style="color: red"></div>
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
 				content +="<tr><td>"+ serialNo + "</td><td>"+ product.name + "</td><td>"+"Rs. "+product.price +"</td><td>"+product.orderedQuantity+"</td><td>"+"Rs. "+product.amount+"</td><td><button class='btn btn-danger'  onclick='cancelOrder("
				+ product.id + ",\"" + product.name + "\","+product.orderedQuantity+")'>Cancel</button> </td></tr></td></tr>";					
 				totalAmount = totalAmount + product.amount;
 				discountAmount=Math.round(totalAmount-(totalAmount*discount/100));
		}
		content1="<tr><th id='totalamount' colspan=4 class='text-center'>TOTAL AMOUNT</th><th id='tamount'>Rs."+totalAmount+" </th></tr>";
		content2="<tr><th id='discountamount' colspan=4 class='text-center'>TOTAL AMOUNT("+discount+"% DISCOUNT FOR NEW USER)</th><th id='damount'>Rs."+discountAmount+" </th></tr>";
		document.querySelector("#order-tbl").innerHTML=content;
		 document.querySelector("#order-tbl1").innerHTML=content1; 
		 if(discount>0){
		 document.querySelector("#order-tbl2").innerHTML=content2;
		 }
		})
}
		function cancelOrder(id,name,orderedQuantity){
			let cancelOrder={
					"id":id,
					"name":name,
					"orderQuantity":orderedQuantity
			}
			let url="grocery/cancelOrder";
			axios.patch(url,cancelOrder).then(res=>{
				window.location.href="orderproduct.jsp";
			})
		}
	function SellingHistory(){
		event.preventDefault();
		let url="sellingHistory/addSellingHistory";
		axios.patch(url).then(res=>{
			
			window.location.href="billproduct.jsp";
		}).catch(err=>{
			document.querySelector("#message").innerHTML= "Please purchase a product";
		})
		
	
	}
	</script>
	</main>
</body>
</html>
