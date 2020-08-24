<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
	<style>
		.flex-container {
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
		}

		.wrapper {
			max-width: 200px;
			width: 100%;
		}

		.carousel-item-next,
		.carousel-item-prev,
		.carousel-item.active {
			display: block !important;
		}

		.checked {
			color: orange;
		}


		p {
			font-size: large;
		}
		.carousel-img{
			height:500px;
		}
	</style>
	<title>Buyfy | ${requestScope.product.getName()}</title>
</head>

<style>
	div.carousel-inner {
		position: -webkit-sticky;
		/* Safari */
		position: sticky;
		top: 0;
	}
</style>

<body>
	<jsp:include page="navbar.jsp" />
	<div class="container-fluid col-10 mt-5">

		<c:set var="product" value="${requestScope.product}"></c:set>
		<div class="row my-4 main bg-lightmy-3">
			<!-- Carousel -->
			<div class="col-md-6 col-md-6 carousel-div">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				  <div class="carousel-inner">
				    <c:forEach var="photo" items="${product.images}" varStatus="loop">
				    <c:choose>
					    <c:when test="${loop.first}">
						    <div class="carousel-item active">
						      <img src="images/products/${photo.name}" class="d-block mx-auto carousel-img" id="prod-image" alt="PRODUCT_IMG">
						    </div>
					    </c:when>
					    <c:otherwise>
						    <div class="carousel-item">
						      <img src="images/products/${photo.name}" class="d-block mx-auto carousel-img" alt="PRODUCT_IMG">
						    </div>
					    </c:otherwise>
				    </c:choose>
				    </c:forEach>
				  </div>
				  <c:if test="${product.images.size() > 1 }">
				  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				  </c:if>
				</div>
			</div>
			
			<!-- Carousel End-->
			<div class="col-md-6 col-md-6">
				<div class="ml-3">

					<h1 class="text-4xl mb-1">${product.name }</h1>
					<h6 class="text-muted text-lg mb-2">
						by <a href="DisplayUserServ?uid=${product.vendor.id}">${product.vendor.firstName}</a>
					</h6>

					<div class="row ml-1">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<h6 class="ml-2 text-muted">${product.reviews.size()}Reviews</h6>
					</div>
					<h4 class="text-2xl">
						Price
						<span style="color: red">
							<c:choose>
								<c:when test="${product.discountedPrice > 0}">
									<del>&#8377;${product.price}</del>
								</c:when>
								<c:otherwise>
									&#8377;${product.price}
								</c:otherwise>
							</c:choose>
						</span>
					</h4>
					<c:if test="${product.discountedPrice > 0}">
						<h4 class="text-2xl">
							Now Get At <span style="color: red">
								&#8377;${product.discountedPrice}</span>
						</h4>
					</c:if>
					<div class="m-3">
						<span id="div" class="divpr">
							<button class="btn bg-indigo-500 cart hover:bg-indigo-600" id="pr${product.id}"
							<c:if test="${empty sessionScope.user}">disabled</c:if>
							>
								Add To Cart
							</button>
						</span>
						<c:choose>
							<c:when test="${not empty sessionScope.user}">
								<a id="buynow" class="btn btn-success hover:bg-green-600">
									Buy Now
								</a>
							</c:when>
							<c:otherwise>
								<a href="checkout.jsp" id="buynow" class="btn btn-success hover:bg-green-800">
									Login to Buy
								</a>
							</c:otherwise>
						</c:choose>
					</div>
					<p id="description">

					</p>
				</div>
			</div>
		</div>

	<!-- Displaying Produect Reviews -->
		<hr class="mt-3 mb-3" />
		<div class="col-12">
			<div class="">
				<button type="button" class="btn text-4xl my-3 text-danger">
					<b>Product Reviews</b> <span class="badge badge-light" id="total-reviews">${product.reviews.size()}</span>
				</button>
			</div>
			<c:choose>
			<c:when test="${not empty sessionScope.user}">
			<div class="bg-purple-300 mx-5">
				<form action="" method='GET' class="form-inline py-3">
					<div class="form-group mr-3 col-md-12">
						<input type="text" class="form-control col-md-4 col-sm-6 col-xs-6 bg-purple-200"
							style="border: none; border-bottom: groove;  border-radius: 0;" id="commentbox" name="comment"
							placeholder="Enter Your Review" required />
	
						<button id="comment" class="btn btn-primary ml-3 col-md-2 col-sm-3 col-xs-5">Review</button>
					</div>
				</form>
			</div>
			</c:when>
			<c:otherwise>
				<div class="text-2xl bg-purple-200 p-2 my-2">
					You Must Be Logged In To Make A Review For This Product 
					<a href="login.jsp" class="btn btn-success btn-lg">Login</a>
				</div>
			</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${not empty product.reviews}">
					<c:forEach var="review" items="${product.reviews}" >
						<div class="row col-12" id="prod-reviews">
							<div class="lg:w-1/3 col-sm-4 p-2">
								<b>${review.reviewer}</b>
							</div>
							<div class="lg:w-2/3 col-sm-8 p-2 bg-pink-200">
								<b>${review.review}</b>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<ul class="list-group list-group " >
					</ul>
					<div class="row col-12" id="prod-reviews">
					</div>
					<div class="ml-3 my-3" id="first-review-div">
						<h3 class="text-left text-success my-3 d-inline text-xl">
							<b>Be The First One To Review This Product!</b>
						</h3>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<hr class="mt-3 mb-3" />

		<div class="m-3 text-left mt-4">
			<h1 class="p-3 text-danger d-inline text-4xl"><b>People also search for these products</b></h1>
		</div>
		<!-- Related Products Displays -->
		<section class="text-gray-700 body-font">
			<div class="container px-5 py-10 mx-auto">
				<div class="flex flex-wrap -m-3">
					<c:forEach var="relProd" items="${product.category.products}" begin="0" end="5">
						<c:if test="${relProd.id != product.id }">
							<div class="lg:w-1/3 md:w-1/2 p-2 w-full relProds" id="relProd-${relProd.id}">
								<c:forEach var="relProdImage" items="${relProd.images}" varStatus="loop">
									<c:if test="${loop.first}">
										<a class="block relative h-48 rounded overflow-hidden"> 
										<img alt="ecommerce"
												class="mx-auto object-cover object-center h-full block"
												src="images/products/${relProdImage.name}" alt="NO IMG"/>
										</a>
       								</c:if>
								</c:forEach>
								<div class="mt-4">
									<h3 class="text-black-500 text-base tracking-widest title-font mb-1">
										${relProd.subCategory}</h3>
									<h2 class="text-gray-900 title-font text-lg font-medium">
										${relProd.name}</h2>
									<p class="mt-1">&#8377;${relProd.price}</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
	
	</div>
	<jsp:include page="footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>

	<script>
		var id = '${product.id}';
		var productPrice = ${product.discountedPrice > 0?product.discountedPrice:product.price};
		var userCartName = '${sessionScope.email}';
		if("${sessionScope.user.email}" != ""){
			if (localStorage.getItem(userCartName) == "{}") {
				var cart = {};
			} else {
				// string to js object or json file
				var cart = JSON.parse(localStorage.getItem(userCartName));
				updateCartBadge(cart);
				updateCart(cart);
			}
		}
		
		$('.divpr').on('click', 'button.cart', function () {
			// grabbing id of specific item
			idstr = 'pr' + id;
			// If the clicked item is not present in the list then set it's value to 1
			if (cart[idstr] == undefined) {
				qty = 1;	
				name = `${ product.name}`;
				price = productPrice;
				imageURL = $("#prod-image").attr("src");
				cart[idstr] = [qty, name, parseInt(price),imageURL];
			}
			// else increment it by one
			else {
				cart[idstr][0] = cart[idstr][0] + 1;
			}

			// updating cart value showing in popover
			updateCart(cart);
		});

		
		// This will be for buy now option
		// The current product will be addede to the cart if it is not int the cart
		$(document).on('click', '#buynow', function () {
			// grabbing id of specific item
			idstr = 'pr' + id;
			// If the clicked item is not present in the list then set it's value to 1
			if (cart[idstr] == undefined) {
				qty = 1;
				name = `${ product.name}`;
				price = productPrice;
				cart[idstr] = [qty, name, parseInt(price)];
			}
			// updating cart value showing in popover
			updateCart(cart);
			// redirect to checkout page
			window.location.href = "checkout.jsp";
		});
		
		function updateCart(cart) {
			// if the key is deleted
			if (cart['pr' + id] != undefined) {
				document.getElementById('div').innerHTML = "<button id='minus' class='btn btn-danger minus'>-</button><span class='mx-2'id='val'>" + cart['pr' + id][0] + "</span><button id='plus' class='btn btn-success plus'>+</button>";
			}
			localStorage.setItem(userCartName, JSON.stringify(cart));
			updateSessionCart();
			updateCartBadge(cart);
		}
		
		function updateSessionCart(){
			cartJson =  localStorage.getItem(userCartName);
			userId = '${sessionScope.id}';
			$.ajax({
				type: 'POST',
				url: 'UpdateCartServ',
				data: {
					id : userId,
					cart: cartJson,
					save: 'false',
				},
				success: function (responseText) {
					}
				});
		}
		

		$(".divpr").on('click', 'button.plus', function () {
			cart['pr' + id][0] += 1;
			// valpr is the number displayed in the add to cart button
			document.getElementById('val').innerHTML = cart['pr' + id][0];
			updateCart(cart);
		});
		
		// updating cart no
		function updateCartBadge() {
			let qty = 0;
			for (item in cart) {
				qty += cart[item][0];
			}
			
			$("#cart-badge").text(qty);
		}

		//on click of - button
		$(".divpr").on("click", 'button.minus', function () {
			cart['pr' + id][0] -= 1;
			cart['pr' + id][0] = Math.max(0, cart['pr' + id][0]);
			// if item quantity is 0 then remove key from localStorage
			if (cart['pr' + id][0] === 0) {
				removeKeyFromLocalStorage('pr' + id);
			} else {
				document.getElementById('val').innerHTML = cart['pr' + id][0];
			}
			updateCart(cart);
		});


		function removeKeyFromLocalStorage(key) {
			// delete is used to del object and it has no effect on variables and functions
			delete cart[key];
			// resetting key to Add To Cart Button
			resetToAddToCartBtn(key);
		}

		// resert to AddToCartBtn
		function resetToAddToCartBtn(item) {
			document.getElementById('div').innerHTML = '<button id="' + item + '" class="btn btn-primary cart">Add To Cart</button>';
		}
	</script>
	
	<script>
		// For Fetching Product Details
		$(document).ready(function () {
			description = "";
			id = '${product.id}';
			$.ajax({
				type: 'GET',
				url: 'ProductDescriptionServ',
				data: {
					id: id
				},
				success: function (responseText) {
					$("#description").text(responseText);
				}
			});
		});
		
		// For Sending User Review
		$(document).ready(function () {
			// For Adding Review
			$("#comment").click(function (e){
				pid = "${product.id}";
				uid = "${sessionScope.user.id}";
				reviewer_name = "${sessionScope.user.email}";
				review = $('#commentbox').val();
				$.ajax({
					type: 'GET',
					url: 'AddProdReviewServ',
					data: {
						uid: uid,
						pid: pid,
						reviewMsg: review
					},
					success: function (responseText) {
						if (responseText === 'true') {
							review_div = `
								<div class="lg:w-1/3 col-sm-4 p-2">
									<b>\${reviewer_name}</b>
								</div>
								<div class="lg:w-2/3 col-sm-8 p-2 bg-pink-200">
									<b>\${review}</b>
								</div>
								`;
							$('#prod-reviews').prepend(review_div);
							if(${product.reviews.size()} === 0){
								$("#first-review-div").remove();
							}
							totalReviews =  parseInt($('#total-reviews').text());
							$('#total-reviews').text(totalReviews+1);
						}
					}
				});
				e.preventDefault();
				$('#commentbox').val('');
			});
		});
	</script>
	
	<script>
		$(document).ready(function () {
			// executes when HTML-Document is loaded and DOM is ready  
			$('.relProds').click(function () {
				id = this.id;
				prodId = parseInt(id.replace('relProd-', ''));
				window.location.href = `DisplayProductServ?id=\${prodId}`;
			});
			$(".relProds").hover(function () {
				$(this).addClass('shadow-lg bg-light').css('cursor', 'pointer');
			}, function () {
				$(this).removeClass('shadow-lg bg-light');
			});
		});
	</script>
	
	<script type="text/javascript"> 
		window.addEventListener('beforeunload', function (e) { 
		    if('${sessionScope.user.email}' != ''){
				cartJson =  localStorage.getItem(userCartName);
				userId = '${sessionScope.id}';
				$.ajax({
					type: 'POST',
					url: 'UpdateCartServ',
					data: {
						id : userId,
						cart: cartJson,
						save: 'true',
					},
					success: function (responseText) {
						}
					});
			}
		}); 
	</script> 
</body>

</html>