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
<title>BuyFy | Users Records</title>
<style>
    
</style>
</head>

<jsp:include page="navbar.jsp"/>

<body>
	<div class="container">
		<div class="mt-3">
			<nav aria-label="breadcrumb mt-3">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Users</li>
				</ol>
			</nav>
		</div>

		<span id="message"></span>

		<div class="text-center">
			<h1>
				<span class="badge badge-primary p-3 mt-3 text-4xl">
					All Users
				</span>
			<a class="btn btn-primary float-right" href="signup.jsp">New User +</a>
			</h1>
		</div>
		${requestScope.userCreatedMessage}
		<c:choose>
			<c:when test="${not empty sessionScope.usersList}">
				<form action="SearchUserAdminServ" method='GET' class="form-inline py-3">
					<div class="form-group mr-3 col-md-12">
						<input type="text" class="form-control col-md-4 col-sm-6 col-xs-6"
							style="border: none; border-bottom: groove;  border-radius: 0;" id="searchUser" name="username"
							placeholder="Search Product Records" required />
	
						<button type="submit" class="btn bg-green-400 ml-3 hover:bg-green-500 col-md-1 col-sm-2 col-xs-4">Search</button>
					</div>
				</form>
				<section class="text-gray-700 body-font">
					<div class="container px-5 py-24 mx-auto">
						<div class="flex flex-wrap -m-2">
							<c:forEach var="user" items="${sessionScope.usersList}">
								<div class="p-2 lg:w-1/3 md:w-1/2 w-full"
									id="outer-div-${user.id}">
									<div class="user-card" id="user-card-${user.id}">
										<div
											class="h-full flex items-center border-gray-200 border p-4 rounded-lg">
											<img alt="USER"
												class="w-16 h-16 bg-gray-100 object-cover object-center flex-shrink-0 rounded-full mr-4"
												src="images/users/${user.profilePic.name}">
											<div class="flex-grow">
												<h2 class="text-gray-900 title-font font-medium">
													<span id="username-${user.id}"> ${user.firstName}
														${user.lastName}</span> (${user.id})
												</h2>
												<p class="text-gray-500">${user.email}</p>
											</div>
										</div>
									</div>
									<div class="text-bottom text-right"
										id="delete-btn-div-${user.id}">
										<button type="button" class="btn btn-danger w-100"
											data-toggle="modal" data-target="#userModal${user.id}">
											Delete</button>
									</div>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="userModal${user.id}" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Delete
													Record</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">Are you confirm you want to
												delete ${user.firstName} ${user.lastName}?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>
												<button id="del-btn-${user.id}"
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
				<h1>
					<span class="badge badge-danger">
						No Users Found!
					</span>
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
	// For Deleting user
		$(document).ready(function() {
		$(".delete-button").click(function(e){
					messageTag = '';
					message = '';
					id = this.id;
					userid = parseInt(id.replace('del-btn-',''));
					username = $('#username-'+userid).text();
				    $.ajax(
				    {
				        type: 'GET',
				        url : 'DeleteUserServ',
				        data : {
				        	uid : userid
				        },
				        success:function(responseText) 
				        {
				        	// If the response is true the record is deleted
				        	if(responseText === 'true'){
				        		// removing user div
				        		$('#outer-div-'+ userid).remove();
				        		$('#userModal'+userid).remove();
				        		message = " deleted successfully";
				        	messageTag = 'success';
				        	}else{
				        		messageTag = 'warning';
				        		message = " not deleted!";
				        	}
						    message = `
						    	<div class="alert alert-\${messageTag} alert-dismissible fade show" role="alert">
						    	  <strong>\${username} </strong>\${message}
						    	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    	    <span aria-hidden="true">&times;</span>
						    	  </button>
						    	</div>
						    `;
						    $("#message").append(message);
				        }
				    });
				   // e.preventDefault(); 
				   $(".close").click();
				});
		});
		
	// For Shadow Effect on User Cards and Redirection
		$(document).ready(function() {
			// executes when HTML-Document is loaded and DOM is ready  
			$('.user-card').click(function () {
			     id = this.id;
			     userid = parseInt(id.replace('user-card-',''));
			     window.location.href = `DisplayUserServ?uid=\${userid}`;
			});
			$(".user-card").hover(function() {
				$(this).addClass('shadow-lg').css('cursor', 'pointer');
			}, function() {
				$(this).removeClass('shadow-lg');
			});
		});
	</script>
</body>

</html>