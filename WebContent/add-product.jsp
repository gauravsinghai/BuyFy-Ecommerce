<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>BuyFy | Sell Product</title>
<script type="text/javascript">
	function populate(s1, s2) {
		var s1 = document.getElementById(s1);
		var s2 = document.getElementById(s2);
		console.log(s1.value);
		s2.innerHTML = "";
		if (s1.value == "clothes") {
			var optionArray = [ "menswear|Menswear", "womenswear|Womenswear",
					"kidswear|Kidswear"];
		} else if (s1.value == "electronics") {
			var optionArray = [ "mobiles|Mobiles", "laptops|Laptop",
					"headphones|Headphones" ];
		} else if (s1.value == "books") {
			var optionArray = [ "academic|Academic", "novel|Novel",
					"biography|Biography/AutoBiography" ];
		} else if (s1.value == "accessories") {
			var optionArray = [ "watches|Watches", "perfume|Perfume",
					"wallets|Wallets" ];
		} else if (s1.value == "sports") {
			var optionArray = [ "cricket|Cricket", "football|Football",
					"gym|Gym" ];
		}
		for ( var option in optionArray) {
			var pair = optionArray[option].split("|");
			var newOption = document.createElement("option");
			newOption.value = pair[0];
			newOption.innerHTML = pair[1];
			s2.options.add(newOption);
		}

	}
</script>

</head>
<jsp:include page="navbar.jsp" />
<body>
	<div class="container bg-light mt-3">
		<div class="text-center">
			<h1>
				<span class="badge bg-purple-300 p-3 mt-3 mb-2 text-4xl">Sell
					Product</span>
			</h1>
			<h1>
				<span class="badge bg-pink-300 mb-3 text-2xl">Please Fill
					Details of Your Product Below</span>
			</h1>
		</div>

		<form action="AddProductServ" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="product-id" value="0"/>
			
			<c:choose>
			<c:when test="${sessionScope.user.accountType eq 'admin'}">
				<div class="form-row col-12 p-0">
					<div class="form-group col-6">
						<label for="user-id">User Id</label>
					<input type="number" class="form-control col" name="user-id" id="user-id"
							placeholder="User Id" required>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="user-id" value="${sessionScope.user.id}"/>
			</c:otherwise>
			</c:choose>
			<div class="form-group mb-8">
				<label for="exampleFormControlInput1">Product Name</label>
				<input type="text" class="form-control" name="product-name"
					id="exampleFormControlInput1" placeholder="Product Name" required>
			</div>

			<div class="form-row col-12 p-0 mb-8">
				<div class="form-row col-6 ">
					<label for="exampleFormControlTextarea1">Product Category</label> 
					<select name="category-type"
						class="form-control btn btn-lg btn-outline-dark"
						id="exampleFormControlSelect1"
						onclick="populate(this.id,'exampleFormControlSelect2')">
						<option value="clothes">Clothes</option>
						<option value="electronics">Electronics</option>
						<option value="books">Books</option>
						<option value="accessories">Accessories
						<option value="sports">Sports</option>
					</select>
				</div>
				<div class="form-row col-6  ml-2">
					<label for="exampleFormControlTextarea1">Product Sub
						Category</label> 
					<select class="form-control btn btn-lg btn-outline-dark"
						id="exampleFormControlSelect2" name="subcategory" required>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">Product Description</label>
				<textarea class="form-control" name="product-description"
					id="exampleFormControlTextarea1" rows="6" required></textarea>
			</div>

			<div class="form-row col-12 p-0">
				<div class="form-group col-6">
					<label for="product-price">Product Price</label>
					<input type="number" step="0.01" class="form-control col" name="product-price"
						id="product-price" placeholder="Product Price" required>
				</div>
				<div class="form-group col-6">
					<label for="product-discounted-price">Product Discounted
						Price</label>
					<input type="number" step="0.01" class="form-control col"
						name="product-discounted-price" id="product-discounted-price"
						placeholder="Product Discounted Price" required>
				</div>
			</div>
			<!-- File Button -->
			<h1 class="text-xl bg-green-300 p-2 mt-6 col-md-4">Upload Your
				Product Images</h1>
			<div class="form-group mt-3 row">
				<div class="col-md-6 p-3">
					<input id="filebutton" name="image1" class="btn bg-purple-300"
						type="file" required>
				</div>
				<div class="col-md-6 p-3">
					<input id="filebutton" name="image2" class="btn bg-red-300"
						type="file">
				</div>
				<div class="col-md-6 p-3">
					<input id="filebutton" name="image3" class="btn bg-purple-300"
						type="file">
				</div>
				<div class="col-md-6 p-3">
					<input id="filebutton" name="image4" class="btn bg-purple-300"
						type="file">
				</div>
			</div>

			<!-- Button -->
			<div class="form-group text-center">
				<input id="singlebutton" name="singlebutton" type='submit'
					class="btn btn-success btn-lg" value="save">
			</div>

		</form>
	</div>

	<jsp:include page="footer.jsp" />


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>

</html>