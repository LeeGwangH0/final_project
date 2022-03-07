<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<%@page import = "net.koreate.booking.vo.BookingVO" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%
	List<BookingVO> list = (ArrayList<BookingVO>)request.getAttribute("list");
%>

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
		
		<!-- 켈린더  -->
		
  		<link href='../resources/lib/main.css' rel='stylesheet' />
   		<script src='../resources/lib/main.js'></script>
		<script>
		  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		      },
		      
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: true, // display business hours
		      editable: true,
		      selectable: true,
		      events: [
		    	  <% 
		      	  for (int i = 0; i < list.size(); i++) {
		      	  	BookingVO vo = (BookingVO)list.get(i);
		    %>	
		      	  {
		      	   title : '<%= vo.getU_id() %>',
		      	   start : '<%= vo.getBookdate() %>'
		      	   
		      	   },
		    <%
		    	}
		    %>	    	  


		      ]
		    });
		
		    calendar.render();
		  });
		</script> 
		<style>
			  #calendar {
   				 max-width: 1100px;
   				 margin: 0 auto;
 			 }
		</style>
		
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
	                    <h1 class="display-3 text-white mb-3 animated slideInDown">Service</h1>
	                    <nav aria-label="breadcrumb">
	                        <ol class="breadcrumb justify-content-center text-uppercase">
	                            <li class="breadcrumb-item"><a href="#">Home</a></li>
	                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
	                            <li class="breadcrumb-item text-white active" aria-current="page">service</li>
	                        </ol>
	                    </nav>
	                </div>
	            </div>
	        </div>
	        <!-- Navbar & Hero End -->

                 <div id='calendar' style="position : relative;">
                 		<div>
                 			<button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
                 		</div>
                 </div>

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