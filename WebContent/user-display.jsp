<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 10;
	padding: 10;
	box-sizing: border-box;
	list-style: none;
	font-family: 'Josefin Sans', sans-serif;
}

body {
	background-color: #f3f3f3;
}

.wrapper {

	max-width: 1500px;
	height: 700px;
	display: flex;
	box-shadow: 0 1px 20px 0 rgba(69, 90, 100, .08);
}

.wrapper .left {
	width: 25%;
	background: linear-gradient(to right, #01a9ac, #01dbdf);
	padding: 30px 25px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	text-align: center;
	color: #fff;
}

.wrapper .left img {
	border-radius: 50px;
	margin-bottom: 30px;
}

.wrapper .left h4 {
	margin-bottom: 40px;
}

.wrapper .left p {
	font-size: 22px;
}

.wrapper .right {
	width: 65%;
	background: #fff;
	padding: 30px 25px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

.wrapper .right .info h3 {
	margin-bottom: 15px;
	padding-bottom: 5px;
	border-bottom: 1px solid #e0e0e0;
	color: #353c4e;
	text-transform: uppercase;
	letter-spacing: 5px;
}

.wrapper .right .info_data {
	display: flex;
	justify-content: space-between;
}

.wrapper .right .info_data .data {
	width: 45%;
}

.wrapper .right .info_data .data h4 {
	color: #353c4e;
	margin-bottom: 15px;
	font-size: 30px;
}

.wrapper .right .info_data .data p {
	font-size: 20px;
	margin-bottom: 20px;
	color: #919aa3;
}
</style>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<jsp:include page="navbar.jsp" />
<body>
<c:set var="user" value="${requestScope.user}" scope="page"></c:set>
<div class="container">
	${requestScope.updateUserMessage}
	<c:if test="${sessionScope.user.accountType eq 'admin' or sessionScope.user.id eq user.id}">
		<a href="GetUpdatingUserDetailsServ?uid=${user.id}" class="btn btn-primary float-right">Edit Profile</a>
	</c:if>
	<div class='wrapper m-3  form-group'>
		<div class='left col-md-4' align="center">
			<img src="images/users/${user.profilePic.name}" alt="user" width='300'
				height='300' class="mx-auto"/>
			<p>${fn:toUpperCase(user.accountType)}</p>
		</div>
		<div class='right col-md-8'>
			<div class='info'>
				<h3>
					${user.firstName} ${user.lastName}
				</h3>
				<div class='info_data row'>
					<div class='data col-md-6'>
						<h4>Email</h4>
						<p>
							${user.email}
						</p>
					</div>
					<div class='data col-md-6'>
						<h4>Phone</h4>
						<p>
							${user.phone}
						</p>
					</div>
				</div>
			<c:forEach var="addr" items="${user.address}">
				<div class='info_data row'>
					<div class='data col-md-6'>
						<h4>Address Line 1</h4>
						<p>
							${addr.addressLine1}
						</p>
					</div>
					<div class='data col-md-6'>
						<h4>Address Line 2</h4>
						<p>
							${addr.addressLine2}
						</p>
					</div>
				</div>
				<div class='info_data row'>
					<div class='data col-md-6'>
						<h4>City</h4>
						<p>
							${addr.city}
						</p>
					</div>
					<div class='data col-md-6'>
						<h4>State</h4>
						<p>
							${addr.state}
						</p>
					</div>
				</div>
				<div class='info_data row'>
					<div class='data col-md-6'>
						<h4>Postal Code</h4>
						<p>
							${addr.postalCode}
						</p>
					</div>
					<div class='data col-md-6'>
						<h4>Country</h4>
						<p>
							${addr.country}
						</p>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
</div>
	</div>
	 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>