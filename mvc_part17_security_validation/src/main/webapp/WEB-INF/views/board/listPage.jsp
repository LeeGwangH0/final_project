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
                                <a href="${path}/user/booking" class="dropdown-item">Booking</a>
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
		<form id="loginForm" action="${path}/user/login" method="POST" >
	        <div class="container-xxl py-5">
	            <div class="container">
	                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
	                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Board</h5>
	                    <h1 class="mb-5">게 시 판</h1>
	                </div>
	                <div class="row g-4">

	                    <div class="col-md-12">
	                        <div class="wow fadeInUp" data-wow-delay="0.2s">
	                           
	                                <div class="row g-3">
	                                    <div class="col-md-2">
	                                       	<!-- 검색 옵션 선택 -->
	                                        <select class="form-control" name="searchType">
												<option value="title" ${pm.cri.searchType == 'title' ? 'selected' :''}>TITLE</option>
												<option value="content" ${pm.cri.searchType == 'content' ? 'selected' :''}>CONTENT</option>
												<option value="writer" ${pm.cri.searchType == 'writer' ? 'selected' :''}>WRITER</option>
												<option value="tc" ${pm.cri.searchType == 'tc' ? 'selected' :''}>TITLE &amp; CONTENT</option>
												<option value="cw" ${pm.cri.searchType == 'cw' ? 'selected' :''}>WRITER &amp; CONTENT</option>
												<option value="tcw" ${pm.cri.searchType == 'tcw' ? 'selected' :''}>TITLE &amp; CONTENT &amp; WRITER</option>
	            					
	                                        </select>
	                                    </div>	                                  
	                                  	
	                                  	<div class="col-md-4">
	                                   	     <div class="form-floating">
	                                   	        <input type="text" class="form-control" name="keyword" value="${pm.cri.keyword}"  style="height:20px;">
	                                            	                                            
	                                   	     </div>
	                                  	</div>   
										
										<div class="col-md-2">
											<input type="submit" class=" btn btn-primary w-100" value="SEARCH"/>
										</div>
										
										<div class="col-md-2">
											<input id="newBtn" class=" btn btn-warning w-100" type="button" value="NEW BOARD"/>
										</div>
										<div class="col-md-2">
											<select id="pageNumSelect"
											 class="form-control"
											  name="perPageNum">
											  	<option value="${pm.cri.perPageNum}">${pm.cri.perPageNum}개씩 보기</option>
												<option value="10">10개씩 보기</option>
												<option value="15">15개씩 보기</option>
												<option value="20">20개씩 보기</option>
											</select>
										</div>		
										<div class="box-body">
											<table class="table table-bordered">
												<tr>
													<th>BNO</th>
													<th>TITLE</th>
													<th>WRITER</th>
													<th>REGDATE</th>
													<th>VIEWCNT</th>		
												</tr>
												<!-- 게시글 리스트 목록  ${list} -->
												<c:choose>
													<c:when test="${!empty list}">
														<c:forEach var="board" items="${list}">
															<c:choose>
																<c:when test="${board.showboard eq 'Y'}">
																	<tr>
																		<td>${board.bno}</td>
																		<td> <!-- & 앞에 pagemaker 를 통해 ? 가 들어가 있어야 매핑 에러 안뜸 고치기  -->
																			<a href="readPage${pm.search(pm.cri.page)}&bno=${board.bno}">
																				<c:forEach var="i" begin="1" end="${board.depth}">
																					&nbsp;&nbsp;&nbsp;&nbsp;
																				</c:forEach>
																				<!-- ㅂ 한자키 + 6 -->
																				<c:if test="${board.depth != 0}">
																				└
																				</c:if>
																				<c:out value="${board.title}" escapeXml="true" />
																				[${board.commentCnts}]
																			</a>
																		</td>
																		<td>${board.writer}</td>
																		<td>
																			<f:formatDate value="${board.regdate}" pattern="yyyy-MM-dd (E) hh:mm"/>
																		</td>
																		<td>${board.viewcnt}</td>
																	</tr>						
																</c:when>
																<c:otherwise>
																	<tr>
																		<td></td>
																		<td>삭제된 게시물 입니다.</td>
																		<td></td>
																		<td></td>
																		<td></td>
																	</tr>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<th colspan="5">등록된 게시물이 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
												<!-- 페이징 블럭 -->
												<tr>
													<th colspan="5">
														<c:forEach var="i" begin="${pm.startPage}" 
																		   end="${pm.endPage}">
														   <a href="listReply${pm.search(i)}">[${i}]</a>
														</c:forEach>
													</th>
												</tr>
	                                    	</table>
 	                                    <div class="col-12">
	                                       <!-- <input type="submit" value="LogIn" id="loginBtn" class="btn btn-primary w-100 py-3"/> -->
	                                    </div>
	                                </div>
	                            
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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

<script>

	var result ='${result}';
	if(result !='') alert(result);

	$(function(){
		$("#newBtn").click(function(){
			if('${member.u_name}' ==  ''){
				alert('로그인을 해주세요');
				
			}else{
				location.href="register";	
			}
			
			
		});
		
		$("#pageNumSelect").on("change",function(){
			$("#searchForm").submit();
		});	
	});
</script>

</body>
</html>