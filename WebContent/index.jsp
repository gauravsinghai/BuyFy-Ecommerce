<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>BuyFy</title>
<style>
.carousel-control-prev-icon, .carousel-control-next-icon {
	padding: 20%;
}

.carousel .item {
	height: 650px;
}

.carousel-header {
	max-height: 650px;
}

.carousel-display-1 {
	max-height: 560px;
}

.carousel-video-1 {
	max-height: 560px;
	margin: auto;
}
</style>
</head>
<jsp:include page="navbar.jsp" />

<body>
	${requestScope.productAddedMsg}
	<!-- CAROUSEL 1-->
	<div id="carouselExampleCaptions" class="carousel slide  carousel-top"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
		</ol>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images\\ecommerce\\topcarousel1.jpg"
					class="d-block w-100 carousel-header img-fluid" alt="...">
				<div class="carousel-caption d-none d-md-block"></div>
			</div>
			<div class="carousel-item">
				<img src="images\\ecommerce\\topcarousel2.jpg"
					class="d-block w-100 carousel-header img-fluid" alt="...">
				<div class="carousel-caption d-none d-md-block"></div>
			</div>
			<div class="carousel-item">
				<img src="images\\ecommerce\\topcarousel3.jpg"
					class="d-block w-100 carousel-header img-fluid" alt="...">
				<div class="carousel-caption d-none d-md-block"></div>
			</div>
			<div class="carousel-item">
				<img src="images\\ecommerce\\topcarousel4.jpg"
					class="d-block w-100 carousel-header img-fluid" alt="...">
				<div class="carousel-caption d-none d-md-block"></div>
			</div>
		</div>

		<a class="carousel-control-prev" href="#carouselExampleCaptions"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- CAROUSLE END 1-->

	<div class="container">
		<!--  1st Products Display -->
		<section class="text-gray-700 body-font">
			<div class="container px-5 py-20 mx-auto bg-purple-100">
				<h1 class="text-2xl p-3 bg-purple-500 text-light mb-4">
					<b>Top deals on
						${fn:toUpperCase(sessionScope.categories.get(0).categoryType)}</b>
				</h1>
				<div class="flex flex-wrap -m-4">
					<c:forEach var="prod"
						items="${sessionScope.categories.get(0).products}">
						<div class="lg:w-1/4 md:w-1/2 p-4 prod-card card-shadow w-full"
							id="prod-${prod.id}">
							<a class="block relative h-48 rounded overflow-hidden"> <c:forEach
									var="photo" items="${prod.images}" varStatus="loop" begin='0'
									end="0">
									<c:if test="${loop.first}">
										<img alt="ecommerce"
											class="object-center h-full block mx-auto"
											src="images/products/${photo.name}">
									</c:if>
								</c:forEach>
							</a>
							<div class="mt-4">
								<h3
									class="text-gray-500 text-xs tracking-widest title-font mb-1">${prod.subCategory}</h3>
								<h2
									class="text-gray-900 title-font text-lg font-medium overflow-hidden">
									${prod.name }</h2>
								<p class="mt-1">
									&#8377;
									<fmt:formatNumber value="${prod.price}" type="currency"
										pattern="###,###,###,###.00" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!--  1st Products Display END-->

		<!--  Categories Selector -->
		<section class="body-font mt-4 bg-purple-100">
			<div class="flex flex-wrap -m-4">
				<div class="lg:w-1/4 sm:w-1/2 p-4 card-shadow"
					onclick="location.href='DisplayByCategoryServ?cat=sports';">
					<h1 class="text-4xl text-center p-2">Gym and Sports</h1>
					<div class="flex relative">
						<img alt="gallery"
							class="absolute inset-0 h-full object-cover object-center"
							src="images/ecommerce/category3.jpeg">
						<div
							class="px-8 py-10 relative z-10 w-full border-4 border-gray-200 bg-white opacity-0 hover:opacity-100">
							<h2
								class="tracking-widest text-sm title-font font-medium text-indigo-500 mb-1">
								Sports and Gym Equipments</h2>
							<h1 class="title-font text-lg font-medium text-gray-900 mb-3">
								Real mens need real things</h1>
							<p class="leading-relaxed">Get All Sports and Gym Equipments
								starting from Rs400</p>
						</div>
					</div>
				</div>

				<div class="lg:w-1/4 sm:w-1/2 p-4 card-shadow"
					onclick="location.href='DisplayByCategoryServ?cat=accessories';">
					<h1 class="text-4xl text-center p-2">Accessories</h1>
					<div class="flex relative">
						<img alt="gallery"
							class="absolute inset-0 w-full h-full object-cover object-center"
							src="images/ecommerce/category2.jpeg">
						<div
							class="px-8 py-10 relative z-10 w-full border-4 border-gray-200 bg-white opacity-0 hover:opacity-100">
							<h2
								class="tracking-widest text-sm title-font font-medium text-indigo-500 mb-1">
								New Accessories and Watches that suits you</h2>
							<h1 class="title-font text-lg font-medium text-gray-900 mb-3">
								Digital and Analog Watches</h1>
							<p class="leading-relaxed">Apple Watched, Rolex , Titan and
								Cool Accessories starting from Rs1000</p>
						</div>
					</div>
				</div>

				<div class="lg:w-1/4 sm:w-1/2 p-4 card-shadow"
					onclick="location.href='DisplayByCategoryServ?cat=clothes';">
					<h1 class="text-4xl text-center p-2">Clothing</h1>
					<div class="flex relative">
						<img alt="gallery"
							class="absolute inset-0 h-full object-cover object-center"
							src="images/ecommerce/category1.jpg">
						<div
							class="px-8 py-10 relative z-10 w-full border-4 border-gray-200 bg-white opacity-0 hover:opacity-100">
							<h2
								class="tracking-widest text-sm title-font font-medium text-indigo-500 mb-1">
								New Clothes and Shoes That Fits YOU</h2>
							<h1 class="title-font text-lg font-medium text-gray-900 mb-3">
								Made in INDIA from finest clothing materials</h1>
							<p class="leading-relaxed">Cotton Shirts and Denims and
								Hoodies starting from Rs500</p>
						</div>
					</div>
				</div>
				<div class="lg:w-1/4 sm:w-1/2 p-4 card-shadow"
					onclick="location.href='DisplayByCategoryServ?cat=electronics';">
					<h1 class="text-4xl text-center p-2">Electronics</h1>
					<div class="flex relative">
						<img alt="gallery"
							class="absolute inset-0 w-full h-full object-center"
							src="images/ecommerce/category4.jpg">
						<div
							class="px-8 py-10 relative z-10 w-full border-4 border-gray-200 bg-white opacity-0 hover:opacity-100">
							<h2
								class="tracking-widest text-sm title-font font-medium text-indigo-500 mb-1">
								New Phones, Tablets, Headsets Gaming Consoles on exciting</h2>
							<h1 class="title-font text-lg font-medium text-gray-900 mb-3">
								Not Much Budget Not a Problem Budget Friendly Phones are here.</h1>
							<p class="leading-relaxed">OnePlus, Apple and Gaming Consoles
								starting from Rs5000</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--  Categories Selector END -->

		<!-- Video Carousel -->
		<div id="video-carousel-example2" class="carousel slide carousel-fade"
			data-ride="carousel">
			<!--Indicators-->
			<ol class="carousel-indicators">
				<li data-target="#video-carousel-example2" data-slide-to="0"
					class="active"></li>
				<li data-target="#video-carousel-example2" data-slide-to="1"></li>
				<li data-target="#video-carousel-example2" data-slide-to="2"></li>
				<li data-target="#video-carousel-example2" data-slide-to="3"></li>
			</ol>
			<!--/.Indicators-->
			<!--Slides-->
			<div class="carousel-inner" role="listbox">
				<!-- First slide -->
				<div class="carousel-item active">
					<div class="view">
						<video class="video-fluid carousel-video-1" autoplay loop muted>
							<source src="images\ecommerce\Clothes.mp4" type="video/mp4" />
						</video>
						<div class="mask rgba-indigo-light"></div>
					</div>
				</div>

				<!-- Second slide -->
				<div class="carousel-item">
					<div class="view">
						<video class="video-fluid carousel-video-1" autoplay loop muted>
							<source src="images\ecommerce\Watch.mp4" type="video/mp4" />
						</video>
						<div class="mask rgba-purple-slight"></div>
					</div>
				</div>

				<!-- Third slide -->
				<div class="carousel-item">
					<div class="view">
						<video class="video-fluid carousel-video-1" autoplay loop muted>
							<source src="images\ecommerce\phone.mp4" type="video/mp4" />
						</video>
						<div class="mask rgba-black-strong"></div>
					</div>
				</div>

				<!-- Fourth slide -->
				<div class="carousel-item">
					<div class="view">
						<video class="video-fluid carousel-video-1" autoplay loop muted>
							<source src="images\ecommerce\OnePlus8.mp4" type="video/mp4" />
						</video>
						<div class="mask rgba-purple-slight"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- -Video Carousel End -->


		<!--  2st Products Display -->
		<section class="body-font">
			<div class="container px-5 py-20 mx-auto">
				<h1 class="text-2xl p-3 bg-purple-500 text-light mb-4">
					<b>Top deals on
						${fn:toUpperCase(sessionScope.categories.get(1).categoryType)}</b>
				</h1>
				<div class="flex flex-wrap -m-4">
					<c:forEach var="prod"
						items="${sessionScope.categories.get(1).products}">
						<div class="lg:w-1/4 md:w-1/2 p-4 prod-card card-shadow w-full"
							id="prod-${prod.id}">
							<a class="block relative h-48 rounded overflow-hidden"> 
							<c:forEach
									var="photo" items="${prod.images}" varStatus="loop" begin="0"
									end="0">
									<c:if test="${loop.first}">
										<img alt="ecommerce"
											class="object-center h-full block mx-auto"
											src="images/products/${photo.name}">
									</c:if>
								</c:forEach>
							</a>
							<div class="mt-4">
								<h3
									class="text-gray-500 text-xs tracking-widest title-font mb-1">${prod.subCategory}</h3>
								<h2
									class="text-gray-900 title-font text-lg font-medium overflow-hidden">
									${prod.name }</h2>
								<p class="mt-1">
									&#8377;<fmt:formatNumber value="${prod.price}" type="currency"
										pattern="###,###,###,###.00" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!--  2st Products Display END -->


		<!--  3st Products Display -->
		<section class="body-font">
			<div class="container px-5 py-20 mx-auto">
				<h1 class="text-2xl p-3 bg-purple-500 text-light mb-4">
					<b>Top deals on
						${fn:toUpperCase(sessionScope.categories.get(2).categoryType)}</b>
				</h1>
				<div class="flex flex-wrap -m-4">
					<c:forEach var="prod"
						items="${sessionScope.categories.get(2).products}">
						<div class="lg:w-1/4 md:w-1/2 p-4 prod-card card-shadow w-full"
							id="prod-${prod.id}">
							<a class="block relative h-48 rounded overflow-hidden"> <c:forEach
									var="photo" items="${prod.images}" varStatus="loop" begin='0'
									end="0">
									<c:if test="${loop.first}">
										<img alt="ecommerce"
											class="object-center h-full block mx-auto"
											src="images/products/${photo.name}">
									</c:if>
								</c:forEach>
							</a>
							<div class="mt-4">
								<h3
									class="text-gray-500 text-xs tracking-widest title-font mb-1">${prod.subCategory}</h3>
								<h2
									class="text-gray-900 title-font text-lg font-medium overflow-hidden">
									${prod.name }</h2>
								<p class="mt-1">
									&#8377;
									<fmt:formatNumber value="${prod.price}" type="currency"
										pattern="###,###,###,###.00" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!--  3st Products Display END -->

		<!-- CAROUSEL 2-->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item carousel-top active">
					<img src="images\\ecommerce\\downcarousel1.jpg"
						class="d-block w-100 carousel-display-1" alt="...">
				</div>
				<div class="carousel-item">
					<img src="images\\ecommerce\\downcarousel2.jpg"
						class="d-block w-100 carousel-display-1" alt="...">
				</div>
				<div class="carousel-item">
					<img src="images\\ecommerce\\downcarousel3.jpg"
						class="d-block w-100 carousel-display-1" alt="...">
				</div>

			</div>

			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- CAROUSLE END 2-->


		<!--  4st Products Display -->
		<section class="body-font">
			<div class="container px-5 py-20 mx-auto">
				<h1 class="text-2xl p-3 bg-purple-500 text-light mb-4">
					<b>Top deals on
						${fn:toUpperCase(sessionScope.categories.get(3).categoryType)}</b>
				</h1>
				<div class="flex flex-wrap -m-4">
					<c:forEach var="prod"
						items="${sessionScope.categories.get(3).products}">
						<div class="lg:w-1/4 md:w-1/2 p-4 prod-card card-shadow w-full"
							id="prod-${prod.id}">
							<a class="block relative h-48 rounded overflow-hidden"> <c:forEach
									var="photo" items="${prod.images}" varStatus="loop" begin='0'
									end="0">
									<c:if test="${loop.first}">
										<img alt="ecommerce"
											class="object-center h-full block mx-auto"
											src="images/products/${photo.name}">
									</c:if>
								</c:forEach>
							</a>
							<div class="mt-4">
								<h3
									class="text-gray-500 text-xs tracking-widest title-font mb-1">${prod.subCategory}</h3>
								<h2
									class="text-gray-900 title-font text-lg font-medium overflow-hidden">
									${prod.name }</h2>
								<p class="mt-1">
									&#8377;
									<fmt:formatNumber value="${prod.price}" type="currency"
										pattern="###,###,###,###.00" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!--  4st Products Display END-->


		<!--  5st Products Display -->
		<section class="body-font">
			<div class="container px-5 pt-20 mx-auto">
				<h1 class="text-2xl p-3 bg-purple-500 text-light mb-4">
					<b>Top deals on
						${fn:toUpperCase(sessionScope.categories.get(4).categoryType)}</b>
				</h1>
				<div class="flex flex-wrap -m-4">
					<c:forEach var="prod"
						items="${sessionScope.categories.get(4).products}">
						<div class="lg:w-1/4 md:w-1/2 p-4 prod-card card-shadow w-full"
							id="prod-${prod.id}">
							<a class="block relative h-48 rounded overflow-hidden"> <c:forEach
									var="photo" items="${prod.images}" varStatus="loop" begin='0'
									end="0">
									<c:if test="${loop.first}">
										<img alt="ecommerce"
											class="object-center h-full block mx-auto"
											src="images/products/${photo.name}">
									</c:if>
								</c:forEach>
							</a>
							<div class="mt-4">
								<h3
									class="text-gray-500 text-xs tracking-widest title-font mb-1">${prod.subCategory}</h3>
								<h2
									class="text-gray-900 title-font text-lg font-medium overflow-hidden">
									${prod.name }</h2>
								<p class="mt-1">
									&#8377;
									<fmt:formatNumber value="${prod.price}" type="currency"
										pattern="###,###,###,###.00" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!--  5st Products Display END-->

		<!-- App Store  -->
		<section class="text-gray-700 body-font">
			<div
				class="mx-auto flex px-5 pt-5 pb-24 md:flex-row flex-col items-center col-md-10">
				<div class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6 mb-10 md:mb-0">
					<img class="object-cover object-center rounded" alt="img"
						src="images\ecommerce\join-and-subscribe.jpeg">
				</div>
				<div
					class="lg:flex-grow md:w-1/2 lg:pl-24 md:pl-16 flex flex-col md:items-start md:text-left items-center text-center">
					<h1
						class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-900">
						Join and Subscribe us for more details</h1>
					<p class="mb-8 leading-relaxed">
						Join us for exclusive offers and discounts. The members will be
						able to access the sale prior to the defined time. We provide
						special treatment to our exclusive customers. The members will be
						having free-delivery as long as they are our exclusive members.<br>
						Join now to avail these benefits.
					</p>
					<div class="flex w-full md:justify-start justify-center">
						<input
							class="bg-gray-100 rounded mr-4 border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 lg:w-full xl:w-1/2 w-2/4"
							placeholder="Enter your email address" type="text">
						<button
							class="inline-flex text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg">Join</button>
					</div>
					<p class="text-sm mt-2 text-gray-500 mb-8 w-full"></p>
					<div class="flex lg:flex-row md:flex-col">
						<button
							class="bg-gray-200 inline-flex py-3 px-5 rounded-lg items-center hover:bg-gray-300 focus:outline-none">
							<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
								class="w-6 h-6" viewBox="0 0 512 512">
								<path
									d="M99.617 8.057a50.191 50.191 0 00-38.815-6.713l230.932 230.933 74.846-74.846L99.617 8.057zM32.139 20.116c-6.441 8.563-10.148 19.077-10.148 30.199v411.358c0 11.123 3.708 21.636 10.148 30.199l235.877-235.877L32.139 20.116zM464.261 212.087l-67.266-37.637-81.544 81.544 81.548 81.548 67.273-37.64c16.117-9.03 25.738-25.442 25.738-43.908s-9.621-34.877-25.749-43.907zM291.733 279.711L60.815 510.629c3.786.891 7.639 1.371 11.492 1.371a50.275 50.275 0 0027.31-8.07l266.965-149.372-74.849-74.847z">
								</path>
							</svg>
							<span class="ml-4 flex items-start flex-col leading-none">
								<span class="text-xs text-gray-600 mb-1">GET IT ON</span> <span
								class="title-font font-medium">Play Store</span>
							</span>
						</button>
						<button
							class="bg-gray-200 inline-flex py-3 px-5 rounded-lg items-center lg:ml-4 md:ml-0 ml-4 md:mt-4 mt-0 lg:mt-0 hover:bg-gray-300 focus:outline-none">
							<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
								class="w-6 h-6" viewBox="0 0 305 305">
								<path
									d="M40.74 112.12c-25.79 44.74-9.4 112.65 19.12 153.82C74.09 286.52 88.5 305 108.24 305c.37 0 .74 0 1.13-.02 9.27-.37 15.97-3.23 22.45-5.99 7.27-3.1 14.8-6.3 26.6-6.3 11.22 0 18.39 3.1 25.31 6.1 6.83 2.95 13.87 6 24.26 5.81 22.23-.41 35.88-20.35 47.92-37.94a168.18 168.18 0 0021-43l.09-.28a2.5 2.5 0 00-1.33-3.06l-.18-.08c-3.92-1.6-38.26-16.84-38.62-58.36-.34-33.74 25.76-51.6 31-54.84l.24-.15a2.5 2.5 0 00.7-3.51c-18-26.37-45.62-30.34-56.73-30.82a50.04 50.04 0 00-4.95-.24c-13.06 0-25.56 4.93-35.61 8.9-6.94 2.73-12.93 5.09-17.06 5.09-4.64 0-10.67-2.4-17.65-5.16-9.33-3.7-19.9-7.9-31.1-7.9l-.79.01c-26.03.38-50.62 15.27-64.18 38.86z">
								</path>
								<path
									d="M212.1 0c-15.76.64-34.67 10.35-45.97 23.58-9.6 11.13-19 29.68-16.52 48.38a2.5 2.5 0 002.29 2.17c1.06.08 2.15.12 3.23.12 15.41 0 32.04-8.52 43.4-22.25 11.94-14.5 17.99-33.1 16.16-49.77A2.52 2.52 0 00212.1 0z">
								</path>
							</svg>
							<span class="ml-4 flex items-start flex-col leading-none">
								<span class="text-xs text-gray-600 mb-1">Available on</span> <span
								class="title-font font-medium">App Store</span>
							</span>
						</button>
					</div>
				</div>
			</div>
		</section>

		<!-- App Store END -->

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
		// For Cart cards Shadow effect and click event
		$(document).ready(function() {
			// executes when HTML-Document is loaded and DOM is ready  
			$('.prod-card').click(function() {
				id = this.id;
				prodId = parseInt(id.replace('prod-', ''));
				window.location.href = `DisplayProductServ?id=\${prodId}`;
			});
			$(".card-shadow").hover(function() {
				$(this).addClass('shadow-lg').css('cursor', 'pointer');
			}, function() {
				$(this).removeClass('shadow-lg');
			});
		});
	</script>

	<script>
		// Setting up cart for user
		cart = '${sessionScope.cart}';
		if (cart === '') {
			cart = '{}'
		}
		cart = '${sessionScope.cart}';
		localStorage.setItem('${sessionScope.user.email}', cart);
	</script>
</body>

</html>