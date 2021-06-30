<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Time"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="in.vibin.service.SellingHistory"%>
<%@page import="in.vibin.service.ProductService"%>
<%@page import="in.vibin.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="in.vibin.model.*"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<title>GroceryManagementApp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container-fluid">
		<h3>Purchase History</h3>
		<label>Enter the mobile number</label> <input type="text" id="myInput"
			onkeyup="myFunction()" placeholder="Search for mobile number..."
			autofocus>
		<table class="table table-hover table-bordered" id="table">
			<caption>Purchase History</caption>
			<thead>
				<tr>
					<th id="id">MobileNumber</th>
					<th id="productName">Product Name</th>
					<th id="price">Price per Quantity</th>
					<th id="quantity">Ordered Quantity</th>
					<th id="amount">Amount</th>
					<th id="quantity">Purchase Date</th>
					<th id="amount">Purchase Time</th>
				</tr>
			</thead>
			<tbody id="history-tbl">
			</tbody>
		</table>
		<script>
		
		getSellingHistory();
		function getSellingHistory(){
			
			let url="sellingHistory";
			fetch(url).then(res=>res.json()).then(res=>{
				let sellingHistory=res;
				 let content="";
				for (let history of sellingHistory){
		 				content +="<tr><td>"+ history.mobileNumber + "</td><td>"+ history.productName + "</td><td>"+"Rs. "+ history.pricePerQuantity +"</td><td>"+history.orderedQuantity+"</td><td>"+"Rs. "+history.amount+"</td><td>"+moment(history.orderDate).format('DD-MM-YYYY')+"</td><td>"+moment(history.orderTime,['HH:mm:ss']).format('hh:mm A')+"</td></tr>";					
					}
				document.querySelector("#history-tbl").innerHTML=content; 
				
				})
				
			}
			function myFunction() {
				let input, filter, table, row, data, i, txtValue;
				input = document.getElementById("myInput");
				filter = input.value.toUpperCase();
				table = document.getElementById("table");
				row = table.getElementsByTagName("tr");
				for (i = 0; i < row.length; i++) {
					data = row[i].getElementsByTagName("td")[0];
					if (data) {
						txtValue = data.textContent || data.innerText;
						if (txtValue.toUpperCase().indexOf(filter) == 0) {
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
