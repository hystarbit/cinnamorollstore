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
				<h2 class="login-title">회원 탈퇴</h2>
				<form action="${path }/mypage/deleteAccount.do" method="post"
					id="deleteAccountForm" class="loginForm">
					<p>${sessionScope.user.name}회원님, 그동안 시나모롤 스토어를 이용해주셔서 감사합니다.</p>
					<p>- 회원탈퇴시 모든 이용기록이 삭제됩니다.</p>
					<br>
					<h3>비밀번호 입력</h3>
					<input type="password" id="password" name="password"
						placeholder="현재 비밀번호" required> <br>
					<button type="submit" id="login-submit" class="login-submit">확인</button>
				</form>
			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>