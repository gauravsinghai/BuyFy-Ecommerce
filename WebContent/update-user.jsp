<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>BuyFy | Edit User</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<%
	session.setAttribute("auth-token", "03c77a7ed94e11fb00d61913f743f7e09c0abf4df5c1080f51e17895542d77c5");
%>
<jsp:include page="navbar.jsp" />
<body id="body">
		<c:choose>
			<c:when test="${user.accountType eq 'admin'}">
				<c:set var="isAdmin" value="enabled" />
			</c:when>
			<c:otherwise>
				<c:set var="isAdmin" value="readonly" />
			</c:otherwise>
		</c:choose>

<div class="container">
		<c:set var="user" value="${requestScope.user}"></c:set>
		<div class="rounded-lg p-2 row" id="create-new-div">
			<div class="mx-auto bg-purple-200 px-5 py-4">
				<h1 class="text-4xl bg-red-300 p-3">Edit Details</h1>
				<form action="UpdateUserServ" method="POST"
					enctype="multipart/form-data" id="myForm">
					<input type="hidden" name="user-id" value="${user.id}" />

					<div class="avatar-upload">
						<div class="avatar-edit">
							<input type='file' id="imageUpload" name="profile-pic"
								accept=".png, .jpg, .jpeg" /> <label for="imageUpload"></label>
						</div>
						<div class="avatar-preview">
							<div id="imagePreview"
								style="background-image: url(images/users/${user.profilePic.name});">
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">First Name</label> <input
								class="form-control" type="text" name="first-name" required
								placeholder="First Name" value="${user.firstName}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Last Name</label> <input
								class="form-control" type="text" name="last-name" required
								placeholder="Last Name" value="${user.lastName}">
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label> <input type="email"
								class="form-control" name="email" id="email" placeholder="Email"
								value="${user.email}" readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Mobile Number</label> <input
								class="form-control" type="number" name="phone" required
								placeholder="Mobile Number" value="${user.phone}">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6 p-0 text-xl">
							<div class="custom-control custom-switch mr-3">
								<input type="radio" id="customRadioInline1" name="gender"
									value="male" class="custom-control-input" ${isAdmin}
									<c:if test="${user.gender eq 'male'}">checked</c:if>
									> 
								<label
									class="custom-control-label" for="customRadioInline1">Male</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="radio" id="customRadioInline2"
									name="gender" value="female" class="custom-control-input" ${isAdmin}
									<c:if test="${user.gender eq 'female'}">checked</c:if>
									> 
								<label class="custom-control-label"
									for="customRadioInline2">Female</label>
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" placeholder="Leave password blank if you dont want to change it"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" name="password"
								title="Leave Password Blan If You Dont Want TO Change It">
						</div>
						<div class="form-group col-md-6">
							<c:choose>
							<c:when test="${sessionScope.user.accountType eq 'admin'}">
							<div class="custom-control custom-switch">
								<input type="radio" id="customRadioUser3" 
									name="account-type" value="user" class="custom-control-input"
									<c:if test="${user.accountType eq 'user'}">checked</c:if>
									>
								<label class="custom-control-label"
									for="customRadioUser3">user</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="radio" id="customRadioMerchant3" 
									name="account-type" value="merchant" class="custom-control-input"
									<c:if test="${user.accountType eq 'merchant'}">checked</c:if>
									> 
								<label class="custom-control-label"
									for="customRadioMerchant3">Merchant</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="radio" id="customRadioAdmin3"
									name="account-type" value="admin" class="custom-control-input"
									<c:if test="${user.accountType eq 'admin'}">checked</c:if>
									> 
								<label class="custom-control-label"
									for="customRadioAdmin3">Admin</label>
							</div>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="account-type" value="user"/>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<c:forEach var="addr" items="${user.address}">
						<div class="form-group">
							<label for="inputAddress">Address</label> <input type="text"
								class="form-control" name="address-line1" required
								id="inputAddress" placeholder="1234 Main St"
								value="${addr.addressLine1}">
						</div>
						<div class="form-group">
							<label for="inputAddress2">Address 2</label> <input
								class="form-control" type="text" name="address-line2" required
								id="inputAddress2" placeholder="Apartment, studio, or floor"
								value="${addr.addressLine2}">
						</div>
						<div class="form-row">
							<div class="form-group col-md-3">
								<label for="inputCity">City</label> <input type="text"
									class="form-control" id="inputCity" name="city" required
									value="${addr.city}">
							</div>

							<div class="form-group col-md-4">
								<label for="inputState">State</label> <input type="text"
									class="form-control" type="text" name="state" required
									id="state" value="${addr.state}">
							</div>
							<div class="form-group col-md-3">
								<label for="inputCity">Country</label> <input type="text"
									class="form-control" name="country" required id="country"
									value="${addr.country}">
							</div>
							<div class="form-group col-md-2">
								<label for="inputZip">Zip</label> <input class="form-control"
									type="number" name="postalcode" required id="inputZip"
									value="${addr.postalCode}">
							</div>
						</div>
					</c:forEach>
					<div class="p-t-15 text-center">
						<button class="btn  btn-success btn-lg" id="submit-btn">SAVE</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
	<!--//main-->

	<!-- partial -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script src="./js/script.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"
		type="text/javascript"></script>

</body>

</html>