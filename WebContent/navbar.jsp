<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<head>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<link rel="icon" href="images/ecommerce/logo.png" type="image/png">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3 text-2xl">
		<a class="navbar-brand" href="index.jsp"><img src="images/ecommerce/logo.png" height="80px" width="150px"/></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<h4>
				<a class="nav-link text-light m-1 p-0" href="about-us.jsp">About Us</a>
			</h4>
			<h4>
				<a class="nav-link text-light m-1 p-0" href="contact-us.jsp">Contact Us</a>
			</h4>
			<form action="SearchProductServ" method="GET" id="search-form"
				class="form-inline my-2 my-lg-0 col-md-6 p-0  mx-auto" >
				<select class="form-control-lg bg-warning col-md-3 col-sm-3" name="category"
					id="">
					<option value="all">All Categories</option>
			        <option value="clothes">Clothes</option>
			        <option value="electronics">Electronics</option>
			        <option value="books">Books</option>
			        <option value="accessories">Accessories   
			        <option value="sports">Sports</option>
				</select> 
				<input class="form-control-lg mr-sm-2 col-md-6 col-sm-6"
					type="search" name="search" id="search" placeholder="Search"
					aria-label="Search">
				<button
					class="btn btn-lg btn-outline-warning my-2 my-sm-0 col-md-2 col-sm-2"
					type="submit">Search</button>
			</form>

			<c:choose>
				<c:when test="${sessionScope.user != null }">
					<div class="dropdown mx-2">
						<button class="btn btn-lg btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">${sessionScope.user.firstName}</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="DisplayUserServ?uid=${sessionScope.user.id}">My Profile</a> 
							<a class="dropdown-item" href="DisplayAllOrdersServ">My Orders</a> 
							<a class="dropdown-item" href="my-cart.jsp">My Cart</a>
							<c:if test="${sessionScope.user.accountType eq 'admin' or sessionScope.user.accountType eq 'merchant'}">
								<a class="dropdown-item" href="add-product.jsp">Sell Product</a> 
							</c:if>
							<a class="dropdown-item" href="login.jsp">Log into another account</a> 
							<a class="dropdown-item bg-red-300" href="LogoutServ">Logout</a> 
							<c:if test="${sessionScope.user.accountType == 'admin'}">
								<a class="dropdown-item bg-purple-300" href="admin-dashboard.jsp">Admin Dashboard</a>
							</c:if>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<a href="signup.jsp" class="btn btn-lg btn-primary mr-2">New Customer</a>
					<a href="login.jsp" class="btn btn-lg btn-success">Login</a>
				</c:otherwise>
			</c:choose>
			<a href="my-cart.jsp" class="m-2 btn btn-lg btn-primary">
				Cart <span class="badge badge-light" id="cart-badge">0</span>
			</a>
			
		</div>
	</nav>
</body>
	<script src="https://code.jquery.com/jquery-1.10.2.js"
		type="text/javascript"></script>
<script>


	$('#search-form').submit(function(e) {
		query = $.trim($("#search").val());
	    if (query === "" || query.length <3 ) {
	    	$("#search").focus();
	        e.preventDefault();
	    }
	});
	
	function updateCartBadge() {
		// if user is not logged in then this will not parse any localstorage item
		if('${sessionScope.user.id}' != ''){
				cart = JSON.parse(`${sessionScope.cart}`);
				let qty = 0;
				for (item in cart) {
					console.log("IN");
					qty += parseInt(cart[item][0]);
				}
				$("#cart-badge").text(qty);
				localStorage.setItem('${sessionScope.email}',JSON.stringify(cart));
			}
	}
	
	updateCartBadge();
	


</script>