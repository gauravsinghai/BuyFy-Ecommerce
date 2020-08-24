<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

<title>BuyFy | Users Feedback</title>
</head>
<jsp:include page="navbar.jsp"/>
<%!
	String color[] = {"primary", "danger","warning","success","info","dark"};
%>
<body>
	<div class="container my-5">
		<div class="mt-3">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">BuyFy Feedbacks</li>
				</ol>
			</nav>
		</div>
	<c:choose>
		<c:when test="${requestScope.feedbacks.size() > 0 }">
		<div class="text-center m-6">
			<h1 class="text-4xl bg-purple-400 p-2 inline">BuyFy Feedbacks ( ${requestScope.feedbacks.size()} )</h1>
		</div>
			<c:forEach var="user" items="${requestScope.feedbacks}">
				<div class="card text-white bg-<%=color[(int)Math.round((Math.random()*10)%5)]%> mb-3">
					<div class="card-header col-12">
						<b>${user.name} (${user.email})</b> gives feedback at <b><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value="${user.timeStamp}"/></b>
					</div>
					<div class="card-body">
						<p class="card-text col-12">${user.desc}</p>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h1 class="bg-primary"></h1>
		</c:otherwise>
		
	</c:choose>	
	</div>
<jsp:include page="footer.jsp"/>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>