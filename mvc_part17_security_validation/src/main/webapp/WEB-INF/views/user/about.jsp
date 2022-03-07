<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
	   
	    <title>Restoran - Bootstrap Restaurant Template</title>
	    <meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">
	
	    <!-- Favicon -->
	    <link href="../resources/img/favicon.ico" rel="icon">
	
	    <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">
	
	    <!-- Icon Font Stylesheet -->
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
	    <!-- Libraries Stylesheet -->
	    <link href="../resources/lib/animate/animate.min.css" rel="stylesheet">
	    <link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	    <link href="../resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
	
	    <!-- Customized Bootstrap Stylesheet -->
	    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Template Stylesheet -->
	    <link href="../resources/css/style.css" rel="stylesheet">
	</head>
	
	<body>
	    <div class="container-xxl bg-white p-0">
	        <!-- Spinner Start -->
	        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
	                <span class="sr-only">Loading...</span>
	            </div>
	        </div>
	        <!-- Spinner End -->
		<h1>${member.u_name}</h1>
	
	        <!-- Navbar & Hero Start -->
	        <div class="container-xxl position-relative p-0">
	            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
	                <a href="" class="navbar-brand p-0">
	                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Restoran</h1>
	                    <!-- <img src="../resources/img/logo.png" alt="Logo"> -->
	                </a>
	                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	                    <span class="fa fa-bars"></span>
	                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="${path}" class="nav-item nav-link active">Home</a>
                        <a href="${path}/user/about" class="nav-item nav-link">About</a>
                        <a href="${path}/user/service" class="nav-item nav-link">Service</a>
                        <a href="${path}/user/menu" class="nav-item nav-link">Menu</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="${path}/user/booking" class="dropdown-item">Booking</a>
                                <a href="${path}/board/listPage" class="dropdown-item">Board</a>
                                <a href="${path}/user/testimonial" class="dropdown-item">Testimonial</a>
                            </div>
                        </div>
                        <!-- 인가가 완료된 사용자 -->
                        <sec:authorize access="isAuthenticated()">
                   			<sec:authentication var="member" property="principal.member"/>
		                	<a href="#" class="nav-item nav-link" >${member.u_name}님</a>
                        	<a href="${path}/user/logout" class="nav-item nav-link">LogOut</a>
                   		</sec:authorize>
                   		<!-- 익명 사용자 -->
                   		<sec:authorize access="isAnonymous()">
                        	<a href="${path}/user/join" class="nav-item nav-link">Join</a>
                        	<a href="${path}/user/login" class="nav-item nav-link">Login</a>
                   		</sec:authorize>                    </div>
                    <a href="booking" class="btn btn-primary py-2 px-4">Book A Table</a>
                </div>
	            </nav>
	
	            <div class="container-xxl py-5 bg-dark hero-header mb-5">
	                <div class="container text-center my-5 pt-5 pb-4">
	                    <h1 class="display-3 text-white mb-3 animated slideInDown">About Us</h1>
	                    <nav aria-label="breadcrumb">
	                        <ol class="breadcrumb justify-content-center text-uppercase">
	                            <li class="breadcrumb-item"><a href="#">Home</a></li>
	                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
	                            <li class="breadcrumb-item text-white active" aria-current="page">About</li>
	                        </ol>
	                    </nav>
	                </div>
	            </div>
	        </div>
	        <!-- Navbar & Hero End -->
	
	
	        <!-- About Start -->
	        <div class="container-xxl py-5">
	            <div class="container">
	                <div class="row g-5 align-items-center">
	                    <div class="col-lg-6">
	                        <div class="row g-3">
	                            <div class="col-6 text-start">
	                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="../resources/img/about-1.jpg">
	                            </div>
	                            <div class="col-6 text-start">
	                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="../resources/img/about-2.jpg" style="margin-top: 25%;">
	                            </div>
	                            <div class="col-6 text-end">
	                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="../resources/img/about-3.jpg">
	                            </div>
	                            <div class="col-6 text-end">
	                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="../resources/img/about-4.jpg">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-6">
	                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">About Us</h5>
	                        <h1 class="mb-4">Welcome to <i class="fa fa-utensils text-primary me-2"></i>Restoran</h1>
	                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos erat ipsum et lorem et sit, sed stet lorem sit.</p>
	                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
	                        <div class="row g-4 mb-4">
	                            <div class="col-sm-6">
	                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
	                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">15</h1>
	                                    <div class="ps-4">
	                                        <p class="mb-0">Years of</p>
	                                        <h6 class="text-uppercase mb-0">Experience</h6>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-sm-6">
	                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
	                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">50</h1>
	                                    <div class="ps-4">
	                                        <p class="mb-0">Popular</p>
	                                        <h6 class="text-uppercase mb-0">Master Chefs</h6>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- About End -->
	
	
	        <!-- Team Start -->
	        <div class="container-xxl pt-5 pb-3">
	            <div class="container">
	                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
	                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Team Members</h5>
	                    <h1 class="mb-5">Our Master Chefs</h1>
	                </div>
	                <div class="row g-4">
	                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
	                        <div class="team-item text-center rounded overflow-hidden">
	                            <div class="rounded-circle overflow-hidden m-4">
	                                <img class="img-fluid" src="../resources/img/team-1.jpg" alt="">
	                            </div>
	                            <h5 class="mb-0">Full Name</h5>
	                            <small>Designation</small>
	                            <div class="d-flex justify-content-center mt-3">
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
	                        <div class="team-item text-center rounded overflow-hidden">
	                            <div class="rounded-circle overflow-hidden m-4">
	                                <img class="img-fluid" src="../resources/img/team-2.jpg" alt="">
	                            </div>
	                            <h5 class="mb-0">Full Name</h5>
	                            <small>Designation</small>
	                            <div class="d-flex justify-content-center mt-3">
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
	                        <div class="team-item text-center rounded overflow-hidden">
	                            <div class="rounded-circle overflow-hidden m-4">
	                                <img class="img-fluid" src="../resources/img/team-3.jpg" alt="">
	                            </div>
	                            <h5 class="mb-0">Full Name</h5>
	                            <small>Designation</small>
	                            <div class="d-flex justify-content-center mt-3">
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
	                        <div class="team-item text-center rounded overflow-hidden">
	                            <div class="rounded-circle overflow-hidden m-4">
	                                <img class="img-fluid" src="../resources/img/team-4.jpg" alt="">
	                            </div>
	                            <h5 class="mb-0">Full Name</h5>
	                            <small>Designation</small>
	                            <div class="d-flex justify-content-center mt-3">
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
	                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Team End -->
	        
	        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	 
	    </div>
	
	    <!-- JavaScript Libraries -->
	    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	    <script src="../resources/lib/wow/wow.min.js"></script>
	    <script src="../resources/lib/easing/easing.min.js"></script>
	    <script src="../resources/lib/waypoints/waypoints.min.js"></script>
	    <script src="../resources/lib/counterup/counterup.min.js"></script>
	    <script src="../resources/lib/owlcarousel/owl.carousel.min.js"></script>
	    <script src="../resources/lib/tempusdominus/js/moment.min.js"></script>
	    <script src="../resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
	    <script src="../resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
	
	    <!-- Template Javascript -->
	    <script src="../resources/js/main.js"></script>
	</body>

</html>