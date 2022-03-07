<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

	<form id="logoutForm" action ="${path}/user/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>
		window.onload = function(){
			$("#logoutForm").submit();
		}
	</script>

</body>
</html>