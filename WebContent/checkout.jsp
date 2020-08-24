<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>BuyFy | CheckOut</title>
</head>

<jsp:include page="navbar.jsp"/>
<body>
    <body class="bg-light">
        <div class="container mb-10">
            <div class="py-5 text-center">
                <h2 class="text-4xl bg-purple-400 inline p-2">Checkout form</h2>
                <p class="text-xl bg-pink-300 mt-3">Please Enter Your Details Regarding order delivery place and your personnel details.
                 You can also fill details of another person in case you want to send this order as a gift.</p>
            </div>

            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between text-xl align-items-center mb-3">
                        <span class="">Your cart</span>
                        <span class="badge badge-secondary badge-pill" id="totalProds">0</span>
                    </h4>
                    <ul class="list-group mb-3" id="bill">
                    
                    </ul>

                    <form class="card p-2" action="" method="POST">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Promo code">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary">Redeem</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3 text-xl bg-blue-300 inline p-2">Billing address</h4>
                    <form class="needs-validation" action="CheckoutServ" method="POST">
                    
                    	<input type="hidden" name="orders-list" id="orders-list"/>
                    	<input type="hidden" name="user-id" id="user-id" value="${sessionScope.id}"/>
                    	
                        <div class="row mt-2">
                            <div class="col-md-6 mb-3">
                                <label for="firstName">First name</label>
                                <input type="text" class="form-control" name="first-name" id="firstName" placeholder="Enter First Name" value=""
                                    required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName">Last name</label>
                                <input type="text" class="form-control" name="last-name" id="lastName" placeholder="Enter Last Name" value=""
                                    required>
                                <div class="invalid-feedback">
                                    Valid last name is required.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address-line1" placeholder="1234 Main St" required="">
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>

						<div class="row">
	                        <div class="col-md-6 mb-3">
	                            <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
	                            <input type="text" class="form-control" id="address2" name="address-line2" placeholder="Apartment or suite">
	                        </div>
	                        <div class="col-md-6 mb-3">
	                                <label for="lastName">Mobile no</label>
	                                <input type="tel" class="form-control" id="phone" name="phone" placeholder="" value=""
	                                    required>
	                                <div class="invalid-feedback">
	                                    Valid Mobile no is required.
	                                </div>
	                        </div>
						</div>
						
						
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="country">Country</label>
                                <input class="form-control" name="country" id="country" required/>
                                    
                                <div class="invalid-feedback">
                                    Please Provide a valid country.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="state">State</label>
                                <input class="form-control" name="state" id="state" required/>
                                   
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="state">City</label>
                                <input class="form-control" name="city" id="city" required/>
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>
                            <div class="col-md-2 mb-3">
                                <label for="zip">Zip</label>
                                <input type="number" class="form-control" name="postalcode" id="zip" placeholder="" required="">
                                <div class="invalid-feedback">
                                    Zip code required.
                                </div>
                            </div>
                        </div>
                        <hr class="mb-4">

                        <button class="btn btn-success btn-lg btn-block mb-10" type="submit">Continue to checkout</button>
                    </form>
                </div>
            </div>
        </div>
<jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="/docs/4.5/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>



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
            cart = JSON.parse(localStorage.getItem('${sessionScope.user.email}'));
            $("#orders-list").val(localStorage.getItem('${sessionScope.user.email}'));
            let totalPrice  = 0;
            let totalProducts = 0;
            var format = new Intl.NumberFormat('en-IN', { 
                style: 'currency', 
                currency: 'INR', 
                minimumFractionDigits: 2, 
            }); 
            for (item in cart) {
                qty = cart[item][0];
                name = cart[item][1];
                price = cart[item][2] * qty;
                totalPrice += price;
                price = format.format(price);
                totalProducts += qty;
                bills = `
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">\${name}</h6>
                        <small class="text-muted">Qty : \${qty}</small>
                    </div>
                    <span class="text-muted">\${price}</span>
                </li >
                `;
                $("#bill").append(bills);
            }
            totalPrice = format.format(totalPrice);
            totalbill =`
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (INR)</span>
                    <strong>\${totalPrice}</strong>
                </li>
            `;
            $("#bill").append(totalbill);
            $("#totalProds").text(totalProducts);
        </script>
    </body>

</html>