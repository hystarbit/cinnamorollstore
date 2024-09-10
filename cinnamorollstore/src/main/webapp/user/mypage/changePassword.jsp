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
		<c:if test="${param.error == 'invalidUser'}">
			<script>
				alert('사용자 정보 찾을 수 없습니다.');
			</script>
		</c:if>
		<c:if test="${param.error == 'invalidCurrentPassword'}">
			<script>
				alert('비밀번호 일치하지 않습니다.');
			</script>
		</c:if>
		<div class="mypage-main">
			<%@ include file="mypageBar.jsp"%>
			<div class="login">
				<h2 class="login-title">비밀번호 변경</h2>
				<form action="${path }/mypage/changePassword.do" method="post"
					id="checkPasswordForm" class="loginForm">
					<input type="password" id="currentPassword" name="currentPassword"
						placeholder="현재 비밀번호" required> <br> <input
						type="password" id="newPassword" name="newPassword"
						placeholder="새로운 비밀번호" required> <br> <input
						type="password" id="newPasswordCheck" name="newPasswordCheck"
						placeholder="새로운 비밀번호 확인" required> <br>
					<button type="submit" id="login-submit" class="login-submit">변경</button>
					<br>
					<button type="reset" id="join-submit" class="join-button">취소</button>
				</form>
			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
	<script>
		document.getElementById("checkPasswordForm").addEventListener("submit",function(event) {
			var newPassword = document.getElementById('newPassword').value;
			var newPasswordCheck = document.getElementById('newPasswordCheck').value;
			if (newPassword !== newPasswordCheck) {
				alert('새로운 비밀번호와 새로운 비밀번호이 일치하지 않습니다.');
				event.preventDefault();
			}
		})
	</script>
</body>
</html>