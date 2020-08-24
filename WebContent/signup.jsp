<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>BuyFy | Signin</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
		integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
	<style>
	body{
	    background-color: mediumpurple;
	}
	</style>
</head>
<%
	session.setAttribute("auth-token", "03c77a7ed94e11fb00d61913f743f7e09c0abf4df5c1080f51e17895542d77c5");
%>
<body id="body">

	<div class="container">
		<div class="content-centerflex-wrap mx-auto col-md-6 m-3 text-xl" id="message-box">

		</div>

		<a href="index.jsp">
			<img class="mb-4 mx-auto d-block" src="images/ecommerce/logo.png" alt="" width="250" height="150">
		</a>

		<div class="rounded-lg p-2 row" id="create-new-div">
			<div class="mx-auto bg-purple-200 p-2">
				<h1 class="text-4xl bg-red-300 p-3">Create New Account</h1>
				<form action="AddUserServ" method="POST" enctype="multipart/form-data" id="myForm" >
					
					<div class="avatar-upload">
						<div class="avatar-edit">
							<input type='file' id="imageUpload" name="profile-pic" accept=".png, .jpg, .jpeg" />
							<label for="imageUpload"></label>
						</div>
						<div class="avatar-preview">
							<div id="imagePreview" style="background-image: url(images/ecommerce/avatar.jpg);">
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">First Name</label>
							<input class="form-control" type="text" name="first-name" id="first-name" required placeholder="First Name">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Last Name</label>
							<input class="form-control" type="text" name="last-name" id="last-name" required placeholder="Last Name">
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label>
							<input type="email" class="form-control" name="email" required id="email" placeholder="Email">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Mobile Number</label>
							<input class="form-control" type="number" name="phone" id="phone" required placeholder="Mobile Number">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6 p-0">
							<input type="date" class=" px-12 py-2 ml-10" id="dob" name="dob" required>
						</div>
						<div class="form-group col-md-6 p-0 text-xl">
							<div class="custom-control custom-switch ">
								<input type="radio" id="customRadioInline1" checked name="gender" value="male"
									class="custom-control-input">
								<label class="custom-control-label" for="customRadioInline1">Male</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="radio" id="customRadioInline2" name="gender" value="female"
									class="custom-control-input">
								<label class="custom-control-label" for="customRadioInline2">Female</label>
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="password">Password</label>
							<input type="password" class="form-control" id="password" placeholder="Password"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required name="password"
								title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
						</div>
						<div class="form-group col-md-6">
							<label for="cpassword">Confirm Password</label>
							<input type="password" class="form-control" id="cpassword" placeholder="Confirm Password"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required
								title="Confirm passsword must be same as given password">
						</div>
					</div>

					<div class="form-group">
						<label for="inputAddress">Address</label>
						<input type="text" class="form-control" name="address-line1" required id="address-line1"
							placeholder="1234 Main St">
					</div>
					<div class="form-group">
						<label for="inputAddress2">Address 2</label>
						<input class="form-control" type="text" name="address-line2" required id="address-line2"
							placeholder="Apartment, studio, or floor">
					</div>
					<div class="form-row">
						<div class="form-group col-md-3">
							<label for="inputCity">City</label>
							<input type="text" class="form-control" id="city" name="city" required>
						</div>

						<div class="form-group col-md-4">
							<label for="inputState">State</label>
							<input type="text" class="form-control" type="text" id="state" name="state" required>
						</div>
						<div class="form-group col-md-3">
							<label for="inputCity">Country</label>
							<input type="text" class="form-control" name="country" id="country" required>
						</div>
						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label>
							<input class="form-control" type="number" id="postalcode" name="postalcode" required>
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group col-md-6">
							<c:choose>
							<c:when test="${sessionScope.user.accountType eq 'admin'}">
								<label>User Type</label>
								<div class="custom-control custom-switch">
									<input type="radio" id="customRadioUser3" 
										name="account-type" value="user" class="custom-control-input"
										checked
										>
									<label class="custom-control-label"
										for="customRadioUser3">user</label>
								</div>
								<div class="custom-control custom-switch">
									<input type="radio" id="customRadioMerchant3" 
										name="account-type" value="merchant" class="custom-control-input"
										> 
									<label class="custom-control-label"
										for="customRadioMerchant3">Merchant</label>
								</div>
								<div class="custom-control custom-switch">
									<input type="radio" id="customRadioAdmin3"
										name="account-type" value="admin" class="custom-control-input"
										> 
									<label class="custom-control-label"
										for="customRadioAdmin3">Admin</label>
								</div>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="account-type" value="user"/>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<div class="p-t-15 text-center">
						<button class="btn  btn-success btn-lg" id="submit-btn">Create Account</button>
						<button class="btn btn-primary btn-lg" type="reset">Reset All</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--//main-->

	<!-- partial -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script src="./js/script.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#submit-btn').click(function (e) {
				e.preventDefault();
				if(checkAllFilled()){
				password = $("#password").val();
				cpassword = $("#cpassword").val();
				if (password === cpassword) {
					email = $('#email').val();
					$.ajax(
						{
							type: 'GET',
							url: 'CheckUserExistServ',
							data: {
								email: email
							},
							success: function (responseText) {
								// If the response is true the record is deleted
								if (responseText === 'true') {
									$("#message-box").empty();
									message = `
							    	<div class="alert alert-danger alert-dismissible fade show" role="alert">
							    	  <strong>Error : </strong>\${email} Already Exist!
							    	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    	    <span aria-hidden="true">&times;</span>
							    	  </button>
							    	</div>
							    `;
									$("#message-box").append(message);
								} else {
									// submitting form
									$("#myForm").submit();
								}
							}
						});// end Ajax
				}//endif
				else {
					$("#message-box").empty();
					message = `
				    	<div class="alert alert-danger alert-dismissible fade show" role="alert">
				    	  <strong>Error : </strong>Password and Confirm Password are not Same
				    	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    	    <span aria-hidden="true">&times;</span>
				    	  </button>
				    	</div>
				    `;
					$("#create-new-div").scrollTop();
					$("#message-box").append(message);
				}
				}
			});// function end
		});
		
		function checkAllFilled(e){
			let firstName = $("#first-name").val();
			let lastName = $("#last-name").val();
			let email = $("#email").val();
			let phone = $("#phone").val();
			let dob = $("#dob").val();
			let address1 = $("#address-line1").val();
			let address2 = $("#address-line2").val();
			let city = $("#city").val();
			let state = $("#state").val();
			let country = $("#country").val();
			let postalcode = $("#postalcode").val();
			let password = $("#password").val();
			let cpassword = $("#cpassword").val();
			let msg = '';
			var decimal=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,40}$/;
			
			if(firstName === ""){
				msg += '$ Please provide your first Name';
			}
			if(password === "" || password.match(decimal)==null){
				msg += '\n'+'$ Password is not provided or passoword does not contains one lowercase letter, one uppercase letter, one numeric digit, and one special character and length should be greater than 8';
			}
			if(cpassword === "" || cpassword.match(decimal)==null){
				msg += '\n'+'$ Confirm Password is not provided or it is not same as provided password';
			}
			if(lastName  === ""){
				msg += '\n'+'Please provide your last Name'
			}
			if(email === ""){
				msg += '\n'+'Please provide your email'
			}
			if(phone === ""){
				msg += '\n'+'Please provide your Phone number'
			}
			if(dob === ""){
				msg += '\n'+'Please provide your date of birth'
			}
			if(address1 === ""){
				msg += '\n'+'Please provide your address line1'
			}
			if(address2 === ""){
				msg += '\n'+'Please provide your address line2'
			}
			if(city === ""){
				msg += '\n'+'Please provide your city'
			}
			if(state === ""){
				msg += '\n'+'Please provide your state'
			}
			if(country === ""){
				msg += '\n'+'Please provide your country'
			}
			if(postalcode === ""){
				msg += '\n'+'Please provide your postalcode'
			}
			
			if(msg.length > 0){
				alert(msg);
				return false;
			}else{
				return true;
			}
		}
	</script>


</body>

</html>