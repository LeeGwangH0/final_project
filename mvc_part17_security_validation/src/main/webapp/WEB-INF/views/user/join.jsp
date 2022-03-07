<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                   			<sec:authentication var="member" property="principal.member"/>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Join</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Join</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Join Start -->
		<form id="joinForm" action="${path}/user/joinPost" method="POST">
	        <div class="container-xxl py-5">
	            <div class="container">
	                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
	                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Join</h5>
	                    <h1 class="mb-5">회 원 가 입</h1>
	                </div>
	                <div class="row g-4">
	                  <!--  
	                    <div class="col-12">
	                        <div class="row gy-4">
	                            <div class="col-md-4">
	                                <h5 class="section-title ff-secondary fw-normal text-start text-primary">Booking</h5>
	                                <p><i class="fa fa-envelope-open text-primary me-2"></i>book@example.com</p>
	                            </div>
	                            <div class="col-md-4">
	                                <h5 class="section-title ff-secondary fw-normal text-start text-primary">General</h5>
	                                <p><i class="fa fa-envelope-open text-primary me-2"></i>info@example.com</p>
	                            </div>
	                            <div class="col-md-4">
	                                <h5 class="section-title ff-secondary fw-normal text-start text-primary">Technical</h5>
	                                <p><i class="fa fa-envelope-open text-primary me-2"></i>tech@example.com</p>
	                            </div>
	                        </div>
	                    </div>
	                    -->
	                    <!--  
	                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">
	                        <iframe class="position-relative rounded w-100 h-100"
	                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
	                            frameborder="0" style="min-height: 350px; border:0;" allowfullscreen="" aria-hidden="false"
	                            tabindex="0"></iframe>
	                    </div>
	                    -->
	                    <div class="col-md-12">
	                        <div class="wow fadeInUp" data-wow-delay="0.2s">
	                            
	                                <div class="row g-3">
	                                    <div class="col-md-9">
	                                        <div class="form-floating">
	                                            <input type="text" class="form-control" id="u_id" name="u_id" placeholder="Your Email" autocomplete="off">
	                                            <label for="email">Your Email</label>
	                                            <div class="result"></div>
	                                        </div>
	                                    </div>
	                                    
	                                    <div class="col-md-3" >
	                                     	<button type="button" id="acceptEmail" class="btn btn-primary w-100 py-3">이메일 인증</button>
	                                    </div>
	                                    
	                                    <div  class="col-md-9">
	                                    	<div class="form-floating">
	                                    		<input type="text" class="form-control" id="emailCode"  placeholder="Code" autocomplete="off"/>
	                                   			<label for="verificationCode">Code</label>
	                                   			<div class="result"></div>
	                                   		</div>
	                                   </div>
	                                   
	                                   <div id="emailCodWrap2" class="col-md-3">
	                                   		  <button type="button" id="emailAcceptBtn" class="btn btn-primary w-100 py-3">인증 완료</button>
	                                   	
	                                  </div>
	                                  
	                                  <!-- 비밀번호  -->
	                                  <div class="col-md-12">
	                                        <div class="form-floating">
	                                            <input type="password" class="form-control" id="u_pw" name="u_pw" placeholder="Password">
	                                            <label for="password">Password</label>
	                                            <div class="result"></div>
	                                        </div>
	                                  </div>     
	                                  
	                                  <!-- 비밀번호 확인  -->
	                                  <div class="col-md-12">
	                                        <div class="form-floating">
	                                            <input type="password" class="form-control" id="u_repw" name="u_repw" placeholder="Your Password">
	                                            <label for="yourPassword">Your Password</label>
	                                            <div class="result"></div>
	                                        </div>
	                                  </div>  
	                                  
	                                  <!-- 이름  -->
	                                  <div class="col-md-12">
	                                  		<div class="form-floating">
	                                            <input type="text" class="form-control" id="u_name" name="u_name" placeholder="Your name">
	                                            <div class="result"></div>
	                                            <label for="name">Your Name</label>
	                                            
	                                        </div>
	                                  </div>
	                                  
	                                  <!-- 생년월일 -->  
	                                  <div class="col-12">
	                                        <div class="form-floating">
	                                            <input type="text" class="form-control" id="u_birth" name="u_birth" placeholder="Birth">
	                                            <div class="result"></div>
	                                            <label for="birth">Your Birth</label>
	                                        </div>
	                                    </div>
	                                    
	                                  <!-- 주소 -->
	                                    <div class="col-9">
	                                        <div class="form-floating">
	                                            <input type="text" class="form-control addr" id="u_post" name="u_post" placeholder="우편번호" >
	                                            <label for="우편번호">우편번호</label>
	                                        </div>
	                                    </div>
	                                    <div class="col-3">
	                	                     <!-- 다음 주소 api 검색  -->
											<input type="button"  class="btn btn-primary w-100 py-3" value="주소찾기" onclick="sample6_execDaumPostcode();"/>
	                                    </div>
	                                    <div class="col-12">
	                                    	<div class="form-floating">
	                                        	<input type="text" class="form-control addr" id="u_addr" name="u_addr" placeholder="주소" >
	                                        	<label for="주소">주소</label>
	                                    	</div>
	                                    </div>
	                                    <div class="col-12">
	                                    	<div class="form-floating">
	                                        	<input type="text" class="form-control addr" id="u_addr_detail" name="u_addr_detail" placeholder="상세주소" >
	                                        	<label for="상세주소">상세주소</label>
	                                    	</div>
	                                    </div>
	                                    
	                                    <!-- 전화번호 -->
	                                    <div class="col-9" id="phoneWrap">
	                                    	<div class="form-floating">
	                                        	<input type="text" class="form-control" id="u_phone" name="u_phone" placeholder="Phone Number" >
	                                        	 <div class="result"></div>
	                                        	<label for="phonenumber">PhoneNumber</label>
	                                    	</div>
	                                    </div>
	                                    <div class="col-3" id="phoneWrap1">
	                                    	<div class="form-floating">
	                                        	 <input type="button" id="sendSMS" value="인증코드 전송" class="btn btn-primary w-100 py-3"/>
	                                        	 <div class="result"></div>
	                                    	</div>
	                                    </div>
	 
	                                     <div class="col-9" id="codeWrap">
	                                    	<div class="form-floating">
	                                        	<input type="text" class="form-control" id="code" placeholder="Phone Number" >
	                                        	<label for="code">Code</label>
	                                    	</div>
	                                    </div>
	                                    <div class="col-3" id="codeWrap1">
	                                    	<div class="form-floating">
	                                        	 <input type="button" id="acceptCode" value="인증" class="btn btn-primary w-100 py-3"/>
	                                        	 
	                                    	</div>
	                                    </div> 
	                                    
	                                    <div class="col-12">
	                                    	<div class="form-floating">
	                                        	<textarea  class="form-control" readonly>당신의 개인정보는 언제든지 회사에서 사용할수 있으며 10원에 중국에 팔아먹을수도 있어요.그래도 이 사이트를 이용하시겠습니까??</textarea>
                                        	
			                                 </div>
	                                    </div>    
	                                    <label>
											개인정보 이용동의		
											<input type="checkbox" name="u_info" id="u_info" value="y"/>
										</label>			                                                                                                    
	                                                                        
	                                    <div class="col-12">
	                                        <!-- <button class="btn btn-primary w-100 py-3"  id = "joinBtn">Sign In</button> -->
	                                        <input type="submit" id="joinBtn" value="회 원 가 입" class="btn btn-primary w-100 py-3"/>
	                                    </div>
	                                </div>
	                           
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	    </form>    
	    <!-- Join End -->
		
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <!-- 생일 켈린더 쓰기 위한 링크  -->	


<script>
	
	function sample6_execDaumPostcode(){
		new daum.Postcode({
			oncomplete : function(data){
				// 주소 검색 결과
				console.log(data);
				
				var fullAddr='';	// 최종 주소
				var extraAddr = ''; // 조합형 주소
				
				// 선택한 주소 타입에 따라 주소값을 가져온다
				if(data.userSelectedType === 'R'){ // 도로명 주소
					fullAddr = data.roadAddress;
				}else{
					// 지번 주소
					fullAddr = data.jibunAddress;
				}
				
				// 도로명 주소 타입 조합
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을때 법정동명 추가
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					
					// 건물명이 존재 한다면..건물명 추가
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ?','+data.buildingName : data.buildingName);
					}
					
					fullAddr += (extraAddr !== '' ? ' ('+extraAddr+')' : '');
				}
				// 우편번호 삽입
				$("#u_addr_post").val(data.zonecode);
				// 전체 주소 삽입
				$("#u_addr").val(fullAddr);
				// 상세주소 작성
				$("#u_addr_detail").focus();
			}
		}).open();
	}
	
	$("#u_birth").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : "yymmdd",
		dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		dayNamesMin : ['월','화','수','목','금','토','일'],
		monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 	
	});

	//  인증 메일에 발송된 코드 저장
	var eamilCode = "";
	
	// 인증 메일 발송
	$("#acceptEmail").click(function(){
		$.ajax({
			type : "GET",
			dataType : "text",
			url : "${path}/checkEmail",
			data : {
				u_id : $("#u_id").val()
			},
			success : function(code){
				console.log(code);
				if(code){
					emailCode = code;
					alert("메일 발송 완료!\n 메일을 확인해주세요.");
				
					$("#emailCodeWrap").show();
				}else{
					alert("메일 전송 실패 관리자에게 문의해 주세요.");
				}
				
			}
		});
	});
	
	// 인증 코드 완료 여부
	var boolEmailCode = false;
	
	// 인증 코드 검사
	$("#emailAcceptBtn").click(function(){
		var userCode = $("#emailCode").val();
		if(emailCode == userCode){
			console.log("일치함");
			boolEmailCode = true;
			alert("이메일 인증이 완료되었습니다.");
			
		}else{
			console.log("일치하지 않음");
			boolEmailCode = false;
			$("#emailCode").val('')
			alert("인증 코드를 다시 확인해 주세요");
		}
	});	
	
	// 규칙 추가
	$.validator.addMethod("regex",function(value,element,regexpr){
		// element : 검증 대상 요소
		// value : 검증 대상 요소가 가진 value 값
		// regexpr : 검증에 필요한 값 - 정규표현식
		return regexpr.test(value);
	});

	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;				// 특수문자 포함 비밀번호
	var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;						// mobile -표시 없이 숫자만

	// 한글 2~6글자 이내
	var regexName = /^[\uac00-\ud7a3]{2,6}$/;
	
	
	// 유효성 검사
	$("#joinForm").validate({
		rules : {
			u_id : {
				required : true,
				email : true,
				remote : {
					type : "POST",
					url : "${path}/user/uidCheck"
				}
			},
			u_pw : {
				required : true, 
				minlength : 8,
				maxlength : 16,
				regex : regexPass
			},
			u_repw : {
				required : true, 
				minlength : 8,
				maxlength : 16,
				equalTo : "#u_pw"
			},
			u_name : {
				required : true,
				rangelength : [2,6],
				regex : regexName
			},
			u_phone : {
				required : true,
				regex : regexMobile
			},
			u_birth : {
				required : true
			},
			u_post : {
				required : true
			},
			u_addr : {
				required : true
			},
			u_addr_detail : {
				required : true
			},
			u_info : {
				required : true
			}
		},
		messages : {
			u_id : {
				required : "이메일(아이디)를 작성해주세요.",
				email : "올바른 이메일 형식이 아닙니다.",
				remote : "이미 존재하는 ID입니다."
			},
			u_pw : {
				required : "비밀번호를 작성해주세요.",
				minlength : "비밀번호는 최소 8글자 이상입니다.",
				maxlength : "비밀번호는 최대 16글자만 가능합니다.",
				regex : "비밀번호는 특수문자와 숫자를 포함해야합니다."
			},
			u_repw : {
				required : "비밀번호를 작성해주세요.",
				minlength : "비밀번호는 최소 8글자 이상입니다.",
				maxlength : "비밀번호는 최대 16글자만 가능합니다.",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			u_name : {
				required : "이름을 작성해 주세요.",
				rangelength : $.validator.format(
					"문자 길이가 {0}에서 {1}사이의 값을 입력하세요."
				),
				regex : "한글 이름을 입력 해주세요."
			},
			u_phone : {
				required : "전화번호를 입력해주세요.",
				regex : "올바른 전화번호 형식이 아닙니다."
			},
			u_birth : {
				required : "생년월일을 작성해주세요."
			},
			u_post : {
				required : "우편번호를 확인해 주세요."
			},
			u_addr : {
				required : "주소를 확인해 주세요."
			},
			u_addr_detail : {
				required : "상세주소를 입력해주세요."
			},
			u_info : {
				required : "개인정보이용을 동의해 주세요."
			}
		},
//		debug : true,	// 확인 후 submit 실행하지 않음
		errorElement : "span",
		errorClass : "text-danger"
	});
	
	$.validator.setDefaults({
		submitHandler : function(){
			$("#joinForm").submit();
		}
	});
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(
				// "${_csrf.parameterName}",
				"${_csrf.headerName}",
				"${_csrf.token}");
	});
	
</script>
</body>
</html>





























