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
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<title>BuyFy | cart</title>
</head>
<jsp:include page="navbar.jsp" />
<body>
	<%
		response.setHeader("Cache-Control","no-cache");
		response.setHeader("Cache-Control","no-store");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader ("Expires", 0);
	%> 

	<div class="container">
		<div class="text-center text-4xl m-5">
			<h1>
				<span class="bg-purple-300 p-2">My Cart</span>
			</h1>
		</div>

		<div id="order1" class="order mb-5">
			<div class="card">
				<div class="card-header text-2xl" id="cart-header"></div>
				<div class="card-body m-0 p-0">
					<section class="text-gray-500 bg-gray-900 body-font">
						<div class="container px-5 py-24 mx-auto">
							<div class="flex flex-wrap -m-4" id="cart-div"></div>
						</div>
					</section>
				</div>
			</div>
		</div>

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
	<script src="https://code.jquery.com/jquery-1.10.2.js"
		type="text/javascript"></script>
	<script>
	
	// This will create cart of user	
		function makeMyCart() { 
		if('${sessionScope.user.email}' !== ''){
		
		let cartItems = JSON.parse(localStorage.getItem('${sessionScope.email}'));
		if(!jQuery.isEmptyObject(cartItems)){
			let itemsQty = 0;
			let totalAmount = 0;
			$("#cart-div").empty();
			$("#cart-header").empty();
			for(item in cartItems){
				itemsQty++;
				let id = item.replace("pr","");
				let qty 	= cartItems[item][0];
				let name 	= cartItems[item][1];
				let price 	= cartItems[item][2];
				let imgURL 	= cartItems[item][3];
				totalAmount += price*qty;
				cartNode =`
				<div class="lg:w-1/4 md:w-1/2 p-4 w-full" id= "prod-outerdiv-\${id}">
					<div class="order-card"
					id="prod-\${id}">
						<a class="block relative h-48 rounded"> 
							<img alt="ecommerce" class="object-center mx-auto h-full block"
							src="\${imgURL}">
						</a>
						<div class="mt-4">
							<h3
								class="text-gray-500 text-xs tracking-widest title-font mb-1">Quantity: \${qty}</h3>
							<h2 class="text-white title-font text-lg font-medium">
								\${name}</h2>
							<p class="mt-1">Price: \${price}</p>
						</div>
					</div>
					<button class="btn btn-danger remove-prods" id="remove-\${id}">Remove</button>
				</div>
				`;
				$("#cart-div").append(cartNode);
			}
			cardHeader = `
				You Have \${itemsQty} Items In Your List<br/>
				Total Amount : \${totalAmount}
				<a class="btn btn-lg btn-success float-right" href="checkout.jsp">CheckOut</a>
			`;
			$("#cart-header").append(cardHeader);

		}else{
			emptyCart = `
					<img src="images\\ecommerce\\empty-cart.PNG" height="500px" width="500px" 
						class="img-fluid mx-auto d-block" alt="Responsive image">
			  
			`;
			$("#cart-header").text("OOps Your Cart Is Empty!");
			$("#cart-div").append(emptyCart);
		}
	}
	}
	makeMyCart();
	
			

	$(document).ready(function() {
		$(document).on('click', '.remove-prods', function(){

			id = this.id.replace('remove-',"");
			cart = JSON.parse(localStorage.getItem('${sessionScope.user.email}'));
			// removing cart items
			delete cart["pr"+id];
			if(jQuery.isEmptyObject(cart)){
				cart = {};
			}
			$(`#prod-outerdiv-\${id}`).remove();
			localStorage.setItem('${sessionScope.user.email}', JSON.stringify(cart));
			updateSessionCart(cart);
			updateCartBadge(cart);
			makeMyCart();
		});
	});
	
	function updateCartBadge(cart) {
		let qty = 0;
		for (item in cart) {
			qty += cart[item][0];
		}		
		$("#cart-badge").text(qty);
	}
	
	// update session cart attribute
	function updateSessionCart(cart){
		cartJson =  localStorage.getItem('${sessionScope.user.email}');
		userId = '${sessionScope.user.id}';
		$.ajax({
			type: 'POST',
			url: 'UpdateCartServ',
			data: {
				id : userId,
				cart: cartJson,
				save: 'false',
			},
			success: function (responseText) {}
			});
	}
	
	
	// For Cart cards Shadow effect and click event
	$(document).ready(function() {
		// executes when HTML-Document is loaded and DOM is ready  
		$('.order-card').click(function () {
		     id = this.id;
		     prodId = parseInt(id.replace('prod-',''));
		     window.location.href = `DisplayProductServ?id=\${prodId}`;
		});
		$(".order-card").hover(function() {
			$(this).addClass('shadow-lg').css('cursor', 'pointer');
		}, function() {
			$(this).removeClass('shadow-lg');
		});
	});
	</script>
	
	
	<script type="text/javascript"> 
	// If user abrubdly closes browser or window then send user cart details to save in db
		window.addEventListener('beforeunload', function (e) { 
		    if('${sessionScope.user.email}' != ''){
				id = '${sessionScope.user.id}';
				cartJson =  localStorage.getItem('${sessionScope.user.email}');
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