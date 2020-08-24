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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<title>BuyFy | Products Records</title>
</head>

<jsp:include page="navbar.jsp"/>
<body>
	<div class="container">
		<div class="mt-3">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Products</li>
				</ol>
			</nav>
		</div>
		<span id="message"></span>

		<div class="text-center">
			<h1>
				<span class="badge badge-primary p-3 mt-3 text-4xl"> 
					Search results for ${requestScope.query}
				</span>
			</h1>
		</div>

		<c:choose>
			<c:when test="${not empty requestScope.adminsearchproducts}">
				<form action="SearchProdAdminServ" method='GET' class="form-inline py-3">
					<div class="form-group mr-3 col-md-12">
						<input type="text" class="form-control col-md-4 col-sm-6 col-xs-6"
							style="border: none; border-bottom: groove;  border-radius: 0;" id="searchbox" name="search"
							placeholder="Search Product Records" required />
	
						<button type="submit" class="btn bg-green-400 ml-3 hover:bg-green-500 col-md-1 col-sm-2 col-xs-4">Search</button>
					</div>
				</form>
				<section class="text-gray-700 body-font bg-light">
					<div class="container px-5 py-24 mx-auto">
						<div class="flex flex-wrap -m-2">
							<c:forEach var="product" items="${requestScope.adminsearchproducts}">
								<div class="p-2 lg:w-1/3 md:w-1/2 w-full"
									id="outer-div-${product.id}">
									<div class="prod-card" id="prod-card-${product.id}">
										<div
											class="h-full flex items-center border-gray-200 border p-4 rounded-lg">
											<c:forEach var="prodImage" items="${product.images}" varStatus="loop">
												<c:if test="${loop.first}">
													<img class="w-16 h-16 bg-gray-100 object-cover object-center flex-shrink-0 mr-4"
													src="images/products/${prodImage.name}" alt="NO IMG"/>
       											</c:if>
											</c:forEach>
											<div class="flex-grow">
												<h2 class="text-gray-900 title-font font-medium">
													<span id="prodname-${product.id}"> ${product.name} </span>
													(${product.id})
												</h2>
												<p class="text-gray-500">${product.vendor.email}</p>
											</div>
										</div>
									</div>
									<div class="text-bottom text-right"
										id="delete-btn-div-${product.id}">
										<button type="button" class="btn btn-danger w-100"
											data-toggle="modal" data-target="#userModal${product.id}">
											Delete</button>
									</div>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="userModal${product.id}"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Delete
													Product</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												Are you confirm you want to delete <b>${product.name}</b> ?
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>
												<button id="del-btn-${product.id}"
													class="delete-button btn btn-danger">Delete</button>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>

					</div>
				</section>
			</c:when>
			<c:otherwise>
				<h1 class="text-center">
					<span class="badge badge-danger text-4xl">No Products Found!</span>
				</h1>
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
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"
		type="text/javascript"></script>

	<script type="text/javascript">
	// populating search user input with search query
	$("#searchbox").val(`${requestScope.query}`);
	// Deleting a product
		$(document).ready(function() {
		$(".delete-button").click(function(e){
					messageTag = '';
					message = '';
					id = this.id;
					productId = parseInt(id.replace('del-btn-',''));
					productName = $('#prodname-'+productId).text();
				    $.ajax(
				    {
				        type: 'GET',
				        url : 'DeleteProductServ',
				        data : {
				        	id : productId
				        },
				        success:function(responseText) 
				        {
				        	// If the response is true the record is deleted
				        	if(responseText === 'true'){
				        		// removing user div
				        		$('#outer-div-'+ productId).remove();
				        		$('#userModal'+productId).remove();
				        		message = " deleted successfully";
				        	messageTag = 'success';
				        	}else{
				        		alert("false");
				        		messageTag = 'warning';
				        		message = " not deleted!";
				        	}
						    message = `
						    	<div class="alert alert-\${messageTag} alert-dismissible fade show" role="alert">
						    	  <strong>\${productName} </strong>\${message}
						    	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    	    <span aria-hidden="true">&times;</span>
						    	  </button>
						    	</div>
						    `;
						    $("#message").append(message);
				        }
				    });
				   e.preventDefault();
				   $(".close").click();
				});
		});
		
		$(document).ready(function() {
			// executes when HTML-Document is loaded and DOM is ready  
			$('.prod-card').click(function () {
			     id = this.id;
			     prodId = parseInt(id.replace('prod-card-',''));
			     window.location.href = `DisplayProductServ?id=\${prodId}`;
			});
			$(".prod-card").hover(function() {
				$(this).addClass('shadow-lg').css('cursor', 'pointer');
			}, function() {
				$(this).removeClass('shadow-lg');
			});
		});
	</script>
</body>

</html>