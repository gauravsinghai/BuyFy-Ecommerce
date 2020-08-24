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
    <title>Contact Us</title>
</head>

<jsp:include page="navbar.jsp"/>
<body class="bg-grey-200">
<div class="content-center flex-wrap mx-auto col-md-5 m-3 text-xl">
<c:choose>
	<c:when test="${requestScope.feedbackSent == true}">
		<div class="alert alert-success alert-dismissible fade show" role="alert">
	  		<strong>Feedback Sent!</strong> Thank You For Giving Us Your Precious Time
	  		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:when>
	<c:when test="${requestScope.feedbackSent == false}">
		<div class="alert alert-warning alert-dismissible fade show" role="alert">
	  		<strong>Feedback Not Sent!</strong> Sorry We Could Not Sent Your Feedback
	  		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:when>
</c:choose>
</div>

    <section class="text-gray-700 body-font relative">
        <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-col text-center content-center flex-wrap w-full mb-12">
                <h1 class="sm:text-3xl text-4xl bg-purple-400 p-2 mb-4 text-gray-900">Contact Us</h1>
                <p class="lg:w-2/3 mx-auto leading-relaxed text-base"><b>Don't be a stranger.
					<font color="red"> JUST SAY HELLO!</font> <br>
					Feel free to get in touch with us for experiencing the most cared services. <br>
					We have a well established network of providing services.<br>
					<font size="3" color ="red">Need a hand? Or a high five?<br>
					Here's how to reach us...</font></b>
               </p>
            </div>
            <div class="lg:w-1/2 md:w-2/3 mx-auto">
                <div class="">
                <form action="ContactUsServ" class="flex flex-wrap -m-2" method="POST">
                    <div class="p-2 w-1/2">
                        <input
                            class="w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2"
                            placeholder="Name" type="text" name="name">
                    </div>
                    <div class="p-2 w-1/2">
                        <input
                            class="w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2"
                            placeholder="Email" type="email" name="email">
                    </div>
                    <div class="p-2 w-full">
                        <textarea
                            class="w-full bg-gray-100 rounded border border-gray-400 focus:outline-none h-48 focus:border-indigo-500 text-base px-4 py-2 resize-none block"
                            placeholder="Message" name="description"></textarea>
                    </div>
                    <div class="p-2 w-full">
                        <button
                        	type="submit"
                            class="flex mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Submit</button>
                    </div>
                    </form>
                    
                    <div class="p-2 w-full pt-8 mt-8 border-t border-gray-200 text-center">
                        <a class="text-indigo-500">buyfy.cart@gmail.com</a>
                        <p class="leading-normal my-5">
                        	1 hacker street, melon park
							Silicon valley CA-95025
                        </p>
                        <span class="inline-flex">
                            <a class="text-gray-500">
                                <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    class="w-5 h-5" viewBox="0 0 24 24">
                                    <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"></path>
                                </svg>
                            </a>
                            <a class="ml-4 text-gray-500">
                                <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    class="w-5 h-5" viewBox="0 0 24 24">
                                    <path
                                        d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z">
                                    </path>
                                </svg>
                            </a>
                            <a class="ml-4 text-gray-500">
                                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2" class="w-5 h-5" viewBox="0 0 24 24">
                                    <rect width="20" height="20" x="2" y="2" rx="5" ry="5"></rect>
                                    <path d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37zm1.5-4.87h.01"></path>
                                </svg>
                            </a>
                            <a class="ml-4 text-gray-500">
                                <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    class="w-5 h-5" viewBox="0 0 24 24">
                                    <path
                                        d="M21 11.5a8.38 8.38 0 01-.9 3.8 8.5 8.5 0 01-7.6 4.7 8.38 8.38 0 01-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 01-.9-3.8 8.5 8.5 0 014.7-7.6 8.38 8.38 0 013.8-.9h.5a8.48 8.48 0 018 8v.5z">
                                    </path>
                                </svg>
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
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
</body>

</html>