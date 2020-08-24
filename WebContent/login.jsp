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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	margin: 12px 3px;
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

body{
	background: url('images/ecommerce/cart.jpeg');
    background-repeat:no-repeat;
    background-size:cover;
}
</style>
<title>BuyFy | Login</title>
<link rel="icon" href="images/ecommerce/logo.png" type="image/png">
</head>

<body class="text-center row m-0">
	<c:if test="${requestScope.isIncorrect}">
	<div class="col-md-12">
	<div class="alert col-md-4 mx-auto alert-danger alert-dismissible fade show"
		role="alert">
		<strong>Error :</strong> Email or Password is incorrect!
	</div>
	</div>
	</c:if>
	<form class="form-signin col-md-12 mt-0" method="POST" action="LoginServ">
		<a href="index.jsp">
			<img class="mb-4" src="images/ecommerce/logo.png" alt="" width="250"
			height="150">
		</a>
		<h1 class="h3 mb-3 font-weight-normal">Login</h1>
		<label for="inputEmail" class="sr-only">Enter Email</label> 
		<input
			type="email" name="email" id="inputEmail" class="form-control"
			placeholder="Enter Your Email" required autofocus> 
		<label
			for="inputPassword" class="sr-only">Password</label> 
		<input
			type="password" name="password" id="inputPassword"
			class="form-control" placeholder="Enter Your Password" required>
		<button class="btn btn-lg btn-success btn-block" type="submit">
			Login
		</button>
		<a href="signup.jsp" class="btn btn-danger m-2">Create New
			Account</a>

		<p class="mt-5 mb-3 text-muted p-4 bg-light">&copy; 2020 BuyFy</p>
	</form>
</body>

</html>