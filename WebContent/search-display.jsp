<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<style>
</style>

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
<title>BuyFy | ${requestScope.query}</title>
<style>
.card-img-top {
	max-height: 220px;
	width: auto;
}

</style>
</head>


<jsp:include page="navbar.jsp" />
<body>
	<div class="container">
		<h1 class="text-4xl bg-purple-400 mt-2 mb-4 p-2 text-light "><b>Search Results</b></h1>
		<c:choose>
			<c:when test="${not empty requestScope.products}">
				<h1 class="text-2xl text-red-600 inline bg-pink-300 p-2"><b>${sessionScope.products.size()} Products Found for ${requestScope.query}</b></h1>
				<div class="row mx-auto mt-8">
					<c:forEach var="product" items="${requestScope.products}">
						<div class="col-md-4 mb-10 products"  id="prod-${product.id}">
							<c:forEach var="prodImage" items="${product.images}" varStatus="loop">
								<c:if test="${loop.first}">
									<img class="card-img-top mt-2 mx-auto"
											src="images/products/${prodImage.name}" alt="NO IMG"/>
       							</c:if>
							</c:forEach>
							<div class="card-body">
								<h5 class="text-xl card-title text-success">
									<b>${product.subCategory }</b>
								</h5>
								<h4 class="text-2xl text-red-800">
									&#8377;<fmt:formatNumber value="${product.price}" type="currency"
										pattern="###,###,###,###.00" />
								</h4>
								<p class="card-text text-xl">${product.reviews.size()} Reviews</p>
								<p class="card-text text-xl">${product.name}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
			<div class="row pb-20">
			<div class="col-md-5 text-2xl">
			    <h3 class="text-red-600"><b>Your search <b>- ${requestScope.query} -</b>did not match any Items!</b></h3>
                <h2 class="my-6 ">Suggestions:</h2>
                <ul>
                <li><h4>Make sure that all words are spelled correctly.</h4></li>
                <li><h4>Try different words.</h4></li>
                <li><h4>Try more general keywords.</h4></li>
                <li><h4>Try fewer keywords.</h4></li>
                </ul>
              </div>
              <div class="col-md-5">
				<img src="images\ecommerce\noresult.jpeg" height="500px" width="500px" class="img-fluid mx-auto d-block" alt="Responsive image">
			  </div>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="footer.jsp"/>
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
		crossorigin="anonymous">
	</script>
	<script>
	
		 	// populating search bar with searched query
			$("#search").val(`${requestScope.query}`);
			$(document).ready(function() {
			// executes when HTML-Document is loaded and DOM is ready  
			$('.products').click(function () {
			     id = this.id;
			     prodId = parseInt(id.replace('prod-',''));
			     window.location.href = `DisplayProductServ?id=\${prodId}`;
			});
			$(".products").hover(function() {
				$(this).addClass('shadow-lg').css('cursor', 'pointer');
			}, function() {
				$(this).removeClass('shadow-lg');
			});
		});
	</script>
</body>

</html>

