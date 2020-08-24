<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<title>BuyFy | My Orders</title>
</head>
<jsp:include page="navbar.jsp" />
<body>
	<%
		response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	%>

	<div class="container mb-10">
		<div class="text-center text-4xl m-5">
			<h1>
				<span class="bg-purple-300 p-2">My Orders</span>
			</h1>
		</div>
		<c:choose>
			<c:when test="${not empty requestScope.orders}">
				<c:forEach var="i" begin="0" end="${requestScope.orders.size()-1}" step="1">
					<c:set var="order"
						value="${requestScope.orders.get(requestScope.orders.size()-1-i)}"></c:set>
					<div id="order${order.id}" class="order mb-5">
						<div class="card">

							<c:choose>
								<c:when test="${order.orderDelivered}">
									<div class="card-header text-2xl bg-blue-200">
										<h1 class="text-blue-600">
											<b>Ordered Delivered</b>
										</h1>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${order.transacStatus}">
											<div class="card-header text-2xl bg-green-200">
												<h1 class="text-green-700">
													<b>Order Has Been Placed</b>
												</h1>
										</c:when>
										<c:otherwise>
											<div class="card-header text-2xl bg-red-200">
												<h1 class="text-red-700">
													<b>Order Payment Failed</b>
												</h1>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>

							Order Id :${order.id}<br /> Order Date :
							<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
								value="${order.orderDate}" />
							<br /> 
							Total Amount :&#8377;<fmt:formatNumber value="${order.amount}" type="currency"
								pattern="###,###,###,###.00" />
							<c:if test="${order.transacStatus}">
							<br/>
							Payment Date :<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
								value="${order.paymentDate }" />
							</c:if>
							<a class="btn btn-success rounded-circle float-right order-btn"
								id="order-btn${order.id}" data-toggle="collapse"
								href="#collapsOrder${order.id}" role="button"
								aria-expanded="false" aria-controls="collapsOrder1"> + </a>
						</div>
						<div class="card-body m-0 p-0 collapse"
							id="collapsOrder${order.id}">
							<section class="text-gray-500 bg-gray-900 body-font">
								<div class="container px-5 py-24 mx-auto">
									<div class="flex flex-wrap -m-4">
										<c:forEach var="products" items="${order.products}">
											<div class="lg:w-1/4 md:w-1/2 p-4 w-full">
												<a class="block relative h-48 rounded">
											<c:forEach var="photo" items="${products.product.images}" varStatus="loop">
											    <c:if test="${loop.first}">
												      <img src="images/products/${photo.name}" class="object-center mx-auto h-full block">
												    
											    </c:if>
										    </c:forEach>
											
												</a>
												<div class="mt-4">
													<h3
														class="text-gray-500 text-xs tracking-widest title-font mb-1">${products.product.subCategory}</h3>
													<h2 class="text-white title-font text-lg font-medium">${products.product.name}</h2>
													<h2 class="text-white title-font text-lg font-medium">Qty
														:${products.quantity}</h2>
													<p class="mt-1">
														&#8377;
														<fmt:formatNumber value="${products.product.price}"
															type="currency" pattern="###,###,###,###.00" />
													</p>
												</div>
											</div>
										</c:forEach>

									</div>
								</div>
							</section>
						</div>
					</div>
		</div>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="card">
			<div class="card-header text-2xl" id="cart-header">
				You Have No Orders Yet, Buy NOW EXCLUSIVE DEALS with BuyFy <a
					class="btn btn-success btn-lg" href="index.jsp">Shop NOW </a>
			</div>
			<div class="card-body m-0 p-0">
				<section class="text-gray-500 bg-gray-900 body-font">
					<div class="container px-5 py-5 mx-auto">
						<div class="flex flex-wrap -m-4" id="cart-div">
							<img src="images/ecommerce/no-orders.jpeg" height="600px"
								width="600px" class="img-fluid mx-auto d-block"
								alt="Responsive image">
						</div>
					</div>
				</section>
			</div>
		</div>
	</c:otherwise>
	</c:choose>
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
	<script>
		$(document).ready(function() {
			$('.order-btn').click(function() {
				id = $(this).attr('id')
				id = '#' + id;
				if ($(id).hasClass("btn-success")) {
					$(id).addClass("btn-danger");
					$(id).removeClass("btn-success");
					$(id).text('X');
				} else {
					$(id).addClass("btn-success");
					$(id).removeClass("btn-danger");
					$(id).text('+');
				}
			})
		});
		$(document).ready(function() {
			$('.order-btn').click();
		});
	</script>
</body>

</html>