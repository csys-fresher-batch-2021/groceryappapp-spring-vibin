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
getAllProducts();
function getAllProducts() {
	let url = "grocery";
	let i = 0;
	let serialNo = 0;
	fetch(url).then(res => res.json()).then(res => {
		let products = res;
		let content = "";
		for (let product of products) {
			if (product.quantity > 0) {
				i++;
				serialNo = i;
				content += "<tr><td>" + serialNo + "</td><td>"
					+ product.id + "</td><td>"
					+ product.name + "</td><td>"
					+ "Rs. " + product.price + "</td><td>"
					+ product.quantity + "</td><td><button class='btn btn-info' onclick='addQuantity("
					+ product.id + "," + product.quantity +
					")'>Add quantity</button></td><td><button class='btn btn-danger'  onclick='myDelete("
					+ product.id + ",\"" + product.name + "\")'>Delete</button> </td></tr>"
			}
		}
		document.querySelector("#product-tbl").innerHTML = content;

	})

}
function myDelete(id, name) {
	let proceed = confirm("Are you sure you want to delete?" + name);
	if (proceed) {
		let url = "grocery/delete/" + id;
		axios.delete(url).then(res => {
			getAllProducts();
		})
		
		document.querySelector("#message").innerHTML = name + " deleted successfully";
	}
	
	
}
function addQuantity(id, quantity) {
	event.preventDefault();
	localStorage.setItem("id",id);
	window.location.href="addquantity.jsp";
	 
}