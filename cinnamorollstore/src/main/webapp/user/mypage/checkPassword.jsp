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
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<div class="mypage-main">
			<%@ include file="mypageBar.jsp"%>
			<div class="login">
				<h2 class="login-title">비밀번호 확인</h2>
				<form action="${path }/mypage/checkPassword.do" method="post" id="checkPasswordForm"
					class="loginForm">
					<p>사용자 확인을 위해 비밀번호를 다시 한 번 입력 부탁드립니다!</p>
					<input type="password" id="password" name="password"
						placeholder="비밀번호" required> <br>
					<button type="submit" id="login-submit" class="login-submit">확인</button>
				</form>
			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>