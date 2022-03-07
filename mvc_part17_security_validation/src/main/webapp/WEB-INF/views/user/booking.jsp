<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

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
	                    <h1 class="display-3 text-white mb-3 animated slideInDown">Booking</h1>
	                    <nav aria-label="breadcrumb">
	                        <ol class="breadcrumb justify-content-center text-uppercase">
	                            <li class="breadcrumb-item"><a href="#">Home</a></li>
	                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
	                            <li class="breadcrumb-item text-white active" aria-current="page">Booking</li>
	                        </ol>
	                    </nav>
	                </div>
	            </div>
	        </div>
	        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="video">
                        <button type="button" class="btn-play" data-bs-toggle="modal" data-src="https://www.youtube.com/embed/DWRcNpR6Kdc" data-bs-target="#videoModal">
                            <span></span>
                        </button>
                    </div>
                </div>
                
                <div class="col-md-6 bg-dark d-flex align-items-center">
                    <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">Reservation</h5>
                        <h1 class="text-white mb-4">Book A Table Online</h1>
                        <form id="bookingnow" >
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="u_name" name="u_name"placeholder="Your Name" value="${member.u_name}">
                                        <label for="name">Your Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="u_id" name="u_id" placeholder="Your Email" value="${member.u_id}">
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="bookdate" name="bookdate" placeholder="Date & Time" autocomplete="off" required />
                                        <label for="datetime">Date</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="people" name="people" required>
                                          <option value="1">People 1</option>
                                          <option value="2">People 2</option>
                                          <option value="3">People 3</option>
                                        </select>
                                        <label for="select1">No Of People</label>
                                      </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Special Request" id="request" name="request" style="height: 100px"></textarea>
                                        <label for="message">Special Request</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <input type="button" id="bookBtn" name="bookBtn" class="btn btn-primary w-100 py-3" value="Book Now">
                                </div>
                            </div>
					        <input type="hidden" name="u_no" id="u_no" value="${member.u_no}"/>
					        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            
                            
                        </form>
                    </div>
                </div>
                
            </div>
        </div>

        <div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- 16:9 aspect ratio -->
                        <div class="ratio ratio-16x9">
                            <iframe class="embed-responsive-item" src="" id="video" allowfullscreen allowscriptaccess="always"
                                allow="autoplay"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Reservation Start -->
        

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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <!-- 생일 켈린더 쓰기 위한 링크  -->	


		<script>
		$("#bookdate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yymmdd",
			dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
			dayNamesMin : ['월','화','수','목','금','토','일'],
			monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 	
		});
		
		var msg='${message}';
		if(msg !=''){
			alert(msg);	
		}
		
		var uno= ${!empty member.u_no};
		
		var formObj = $("#bookingnow");
		                 
		$("#bookBtn").click(function(){
			if(uno){
				formObj.attr("action","${path}/user/bookingnow").submit();
			}else{
				alert("로그인을 해주세요");
			}			
		});

		
		</script>	
	    <!-- Template Javascript -->
	    <script src="../resources/js/main.js"></script>
	</body>

</html>