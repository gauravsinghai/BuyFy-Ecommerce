<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>BuyFy | Admin DashBoard</title>
</head>

<jsp:include page="navbar.jsp" />
<body>
	<div class="p-8 bg-blue-200">
		<div class="">
			<h1 class="text-4xl">Hello ${sessionScope.user.firstName}
				${sessionScope.user.lastName}</h1>
		</div>
	</div>


	<div class="container my-5">
		<div class="text-center m-5">
			<h1 class="text-4xl bg-pink-300 inline p-3">....... Admin Dashboard .......</h1>
		</div>
	  	<div class="col-md-6 text-center mx-auto mt-3">
    		<b>
	    	<a href="DisplayAllUsersServ" class="text-2xl bg-purple-300 list-group-item card list-group-item-action mb-3">
	    		Users
	    	</a>
			<a href="DisplayAllProductsServ" class="text-2xl bg-purple-300 list-group-item card list-group-item-action mb-3">
				Products
			</a>
			<a href="DisplayAllFeedback" class="text-2xl bg-purple-300 list-group-item card list-group-item-action mb-3">
				Our Website Feedback
			</a>
			</b>
		</div>
	</div>
	<br>

	<jsp:include page="footer.jsp" />
	<script>
	// For Shadow Effect on User Cards and Redirection
	$(document).ready(function() {
		// executes when HTML-Document is loaded and DOM is ready  
		$(".card").hover(function() {
			$(this).addClass('shadow-lg').css('cursor', 'pointer');
		}, function() {
			$(this).removeClass('shadow-lg');
		});
	});
	</script>
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