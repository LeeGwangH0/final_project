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
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="member" property="principal.member"/>
</sec:authorize>
	
    <meta charset="utf-8">
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

<style>
	span.text-danger{
		display:block;
		color:red;
		font-size: 10px;
		padding:5px;
	}
	textarea{
		resize:none;
		cols : 30;
	
	}
</style>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Restoran</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="${path}" class="nav-item nav-link">Home</a>
                        <a href="about" class="nav-item nav-link">About</a>
                        <a href="service" class="nav-item nav-link">Service</a>
                        <a href="menu" class="nav-item nav-link">Menu</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="booking" class="dropdown-item">Booking</a>
                                <a href="${path}/board/listPage" class="dropdown-item">Board</a>
                                <a href="testimonial" class="dropdown-item">Testimonial</a>
                            </div>
                        </div>
                        <!-- 인가가 완료된 사용자 -->
                        <sec:authorize access="isAuthenticated()">
                   			
		                	<a href="#" class="nav-item nav-link" >${member.u_name}님</a>
                        	<a href="${path}/user/logout" class="nav-item nav-link">LogOut</a>
                   		</sec:authorize>
                   		<!-- 익명 사용자 -->
                   		<sec:authorize access="isAnonymous()">
                        	<a href="${path}/user/join" class="nav-item nav-link">Join</a>
                        	<a href="${path}/user/login" class="nav-item nav-link">Login</a>
                   		</sec:authorize>
                    </div>
                    <a href="" class="btn btn-primary py-2 px-4">Book A Table</a>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Board</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Board</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->




       <!-- Login Start -->
		<form id="readForm" >
	        <div class="container-xxl py-5">
	            <div class="container">
	                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
	                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Board</h5>
	                    <h1 class="mb-5">게 시 판 작 성</h1>
	                </div>
	                <div class="row g-4">

	                    <div class="col-md-12">
	                        <div class="wow fadeInUp" data-wow-delay="0.2s">
	                           <div class="box-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<td width="100">제목</td>
												<td>${board.title}</td>
											</tr>
										</thead>
										<tr>
											<td>작성자</td>
											
											<td>
												${board.writer}
												
											</td>
											
										</tr>
										<tr>
											<td>내용</td>
											<td>
												${board.content }
											</td>
										</tr>
										<tr>
											<td colspan="2">
						                        <!-- 인가가 완료된 사용자 -->
						                        <sec:authorize access="isAuthenticated()">
						                        	<c:if test="${member.u_no eq board.u_no}">
						                        	<input type="button" id="modifyBtn" value="MODIFY" class="btn btn-primary  py-3" style="WIDTH: 100pt;" />
						                        	<input type="button" id="deleteBtn" value="DELETE" class="btn btn-warning  py-3" style="WIDTH: 100pt;"/>
						                        	</c:if>
						                        	<input type="button" id="replyBtn" value="REPLY" class="btn btn-primary  py-3" style="WIDTH: 100pt;"/>
						                   		</sec:authorize>												
												<input type="button" id="listBtn" value="LIST" class="btn btn-warning  py-3" style="WIDTH: 100pt;"/>
												<!-- <input type="button" id="saveBtn" value="등록" class="btn btn-primary w-100 py-3" /> -->
											</td>
										</tr>
	                                 </table>
	                           </div>
	                            	
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        
	        
	        <input type="hidden" name="u_no" id="u_no" value="${member.u_no}"/>
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
 			<input type="hidden" name="bno" value="${board.bno}"/>
			<input type="hidden" name="page" value="${cri.page}"/>
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
<!--  
			<input type="hidden" name="searchType" value="${cri.searchType}"/>
			<input type="hidden" name="keyword" value="${cri.keyword}"/>
--> 
	    
	    </form>    
		<!-- footer  -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />



        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdn.tiny.cloud/1/82ubugvq9p4ukktpdfxo6tc3oglykfj5kh7u4xi5uh1sw4s3/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<script>
	var formObj = $("#readForm");
	
	// 게시글 목록
	$("#listBtn").click(function(){
		formObj.attr("action","listPage").submit();
	});
	
	// 답변글 작성
	$("#replyBtn").click(function(){
		formObj.attr("action","replyRegister").submit();
	});
	
	// 게시글 수정
	$("#modifyBtn").click(function(){
		formObj.attr("action","modifyPage").submit();
	});
	
	
	// 삭제 요청
	$("#deleteBtn").click(function(){
		var isDelete = confirm("게시글을 삭제하시겠습니까?");
		
		if(isDelete){
			
			formObj.attr("action","remove");
			formObj.attr("method","post");
			formObj.submit();
			
		}else{
			alert("삭제 요청이 취소 되었습니다.");
		}
	});
</script>


</body>
</html>
