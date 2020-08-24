<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Carousel Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
    <!-- Bootstrap CSS -->
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .carousel-inner {
            width: 100%;
            max-height: 800px !important;
        }

        .carousel-image {
            max-height: 660px;
        }
    </style>
    <!-- Custom styles for this template -->
</head>

<body>
<jsp:include page="navbar.jsp"/>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images\ecommerce\aboutcarousel1.jpg" class="d-block w-100 carousel-image" alt="...">
            </div>
            <div class="carousel-item">
                <img src="images\ecommerce\aboutcarousel2.jpg" class="d-block w-100 carousel-image" alt="...">
            </div>
            <div class="carousel-item">
                <img src="images\ecommerce\aboutcarousel3.jpg" class="d-block w-100 carousel-image" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


    <!-- Marketing messaging and featurettes
  ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <section class="text-gray-700 body-font bg-blue-100 m-5">
            <div class="container px-5 py-24 mx-auto">
                <div class="flex flex-col text-center w-full mb-20">
                    <h1 class="text-2xl font-medium title-font mb-4 text-gray-900">OUR TEAM</h1>
                    <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Executive Board Of Directors<br>
                        We have an excellent support and experienced members in our team.
                    </p>
                </div>
                <div class="flex flex-wrap -m-4">
                    <div class="p-4 lg:w-1/4 md:w-1/2">
                        <div class="h-full flex flex-col items-center text-center">
                            <img alt="team" class="flex-shrink-0 rounded-lg w-full h-56 object-cover object-center mb-4"
                                src="https://png.pngtree.com/png-clipart/20190924/original/pngtree-vector-user-young-boy-avatar-icon-png-image_4827810.jpg">
                            <div class="w-full">
                                <h2 class="title-font font-medium text-lg text-gray-900">Akshat Singh</h2>
                                <h3 class="text-gray-500 mb-3">Chairman</h3>
                                <p class="mb-4">Devoted himself for the public's happiness.
                                </p>
                                <span class="inline-flex">
                                    <a class="text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path
                                                d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
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
                    <div class="p-4 lg:w-1/4 md:w-1/2">
                        <div class="h-full flex flex-col items-center text-center">
                            <img alt="team" class="flex-shrink-0 rounded-lg w-full h-56 object-cover object-center mb-4"
                                src="https://img2.pngio.com/user-profile-computer-icons-user-interface-mystique-transparent-user-avatars-png-512_512.png">
                            <div class="w-full">
                                <h2 class="title-font font-medium text-lg text-gray-900">Rishabh Kumar Singh</h2>
                                <h3 class="text-gray-500 mb-3">Vice President</h3>
                                <p class="mb-4">A great analyst, manager, and passionate.
                                </p>
                                <span class="inline-flex">
                                    <a class="text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path
                                                d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
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
                    <div class="p-4 lg:w-1/4 md:w-1/2">
                        <div class="h-full flex flex-col items-center text-center">
                            <img alt="team" class="flex-shrink-0 rounded-lg w-full h-56 object-cover object-center mb-4"
                                src="https://cdn1.iconfinder.com/data/icons/user-avatars-2/300/04-512.png">
                            <div class="w-full">
                                <h2 class="title-font font-medium text-lg text-gray-900">Raghavendra Singh Bhati</h2>
                                <h3 class="text-gray-500 mb-3">Director</h3>
                                <p class="mb-4">Managing and analysing the teams is his passion.
                                </p>
                                <span class="inline-flex">
                                    <a class="text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path
                                                d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
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
                    <div class="p-4 lg:w-1/4 md:w-1/2">
                        <div class="h-full flex flex-col items-center text-center">
                            <img alt="team" class="flex-shrink-0 rounded-lg w-full h-56 object-cover object-center mb-4"
                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRBKLcyZjKhteHZq3ICrF6zP4m20ZiFXIBNKQ&usqp=CAU">
                            <div class="w-full">
                                <h2 class="title-font font-medium text-lg text-gray-900">Devyanshu Arora</h2>
                                <h3 class="text-gray-500 mb-3">Director</h3>
                                <p class="mb-4">A dynamic leader, cares for the public and society.
                                </p>
                                <span class="inline-flex">
                                    <a class="text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            class="w-5 h-5" viewBox="0 0 24 24">
                                            <path
                                                d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z">
                                            </path>
                                        </svg>
                                    </a>
                                    <a class="ml-2 text-gray-500">
                                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
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
            </div>
        </section>


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette mb-10">
            <div class="col-md-7">
                <h2 class="featurette-heading text-4xl">About our application<span class="text-muted"><br>A new era of online
                        shopping has begun.</span></h2>
                <p class="lead">Our application is a next-generation global resource that helps us
                    to grant some privileges to our customers. Our technology products, services and
                    engineering are built on a decade of innovation, with a world-reowned management.<br>
                    We offer an integrated portfolio of products, services, and IP through our strategy built
                    around Digital, IoT, Cloud, Automation, Cybersecurity, Analytics, Infrastructure
                    Management and Engineering Services, amongst others, to help customers reimagine
                    their serivices for the digital age.</p>
            </div>
            <div class="col-md-5">
                <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image mx-auto"
                    src="images\ecommerce\aboutus.jpg" width="450" height="450" preserveAspectRatio="xMidYMid slice"
                    focusable="false" role="img" aria-label="Placeholder: 500x500">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette mb-10">
            <div class="col-md-5">
                <img class="" src="images\ecommerce\alliancepillars.jpg" width="450" height="450"
                    preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500">
                <title>Placeholder</title>
                </svg>
            </div>
            <div class="col-md-7">
                <h2 class="featurette-heading text-4xl">Alliances<span class="text-muted"><br>Pillars of Strength</span></h2>
                <p class="lead">Since our inception, our alliances have played a critical role in our
                    drive for ecosystem-based innovation. Our ecosystem of alliances allow us to provide
                    best-in-class solutions that meet our customer's requirements and helps them to:
                <ol>Reduce wastage of time.</ol>
                <ol>Accelerate the services of market.</ol>
                <ol>Experience quality products and services.</ol>
                </p>
            </div>

        </div>

        <hr class="featurette-divider">

        <div class="row featurette mb-10">
            <div class="col-md-7">
                <h2 class="featurette-heading text-4xl">Our Approach<span class="text-muted"><br>Easy and Logical</span></h2>
                <p class="lead">We have an easy and logical strategy to help our customers. Our management
                    has individual departments for every field. In total we have 67+ departments with over 6000
                    employees. <br>
                    We only want to provide pleasure, ease and happiness to everyone. </p>
            </div>
            <div class="col-md-5">
                <img class="" src="images\ecommerce\approach.jpg" width="450" height="450"
                    preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500">
                <title>Placeholder</title>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">



        <hr class="featurette-divider">



        <div class="row featurette mb-10">
            <div class="col-md-5">
                <img class="" src="images\ecommerce\covidcontri.jpg" width="450" height="450"
                    preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500">
                <title>Placeholder</title>
                </svg>
            </div>
            <div class="col-md-7">
                <h2 class="featurette-heading text-4xl">COVID Contributions<span class="text-muted"><br>Just a barrier</span>
                </h2>
                <p class="lead">COVID-19 is the most influencing virus of the century. The COVID-19 pandemic has
                    disrupted life and businesses across the globe.
                    Amid this crisis, we are working hard and revamp our strategy to provide you with safe and secure
                    products. <br>
                    Our services has not been stopped in this deadly situation. Sanitation and hygiene is the most
                    important aspect of our company. </p>
            </div>

        </div>
        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->
        <a href="#" class="btn btn-primary float-right m-3">Back to top</a>

    </div><!-- /.container -->
<jsp:include page="footer.jsp"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

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