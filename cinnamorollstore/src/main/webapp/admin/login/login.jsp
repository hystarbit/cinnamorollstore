<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시나모롤 스토어</title>
<link href="${path}/resources/css/main.css" rel="stylesheet" />
</head>

<body>
	<c:if test="${param.error == 'nonAdmin' }">
		<script>
			alert('관리자에게만 권한이 있습니다. 고객님은 일반회원입니다.');
		</script>
	</c:if>
	<c:if test="${param.error == 'nonUser' }">
		<script>
			alert('당신은 회원이 아닙니다.');
		</script>
	</c:if>
	<div id="login" class="login">
		<h2 class="login-title">관리자 로그인</h2>
		<form action="${path }/admin/login.do" method="post" id="loginForm"
			class="loginForm">
			<input type="text" id="user_id" name="user_id" 
			placeholder="아이디" style="width:310px; height: 20px;" required>
			<br> 
			<input type="password" id="password" name="password"
				placeholder="비밀번호" style="width:310px; height: 20px;" required > 
			<br>
			<button type="submit" id="login-submit" class="login-submit" >로그인</button>
		</form>
	</div>
</body>

</html>