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
		<c:if test="${param.error == 'exists'}">
			<script>
				alert('기존에 같은 아이디를 가진 회원이 존재합니다.');
			</script>
		</c:if>
		<div id="join" class="login">
			<h2 id="join-title">시나모롤 스토어 회원가입</h2>
			<form action="${path}/join.do" method="post" id="joinForm"
				class="loginForm">
				<input type="text" id="user_id" name="user_id" placeholder="아이디"
					required> <br> <input type="password" class="password"
					id="password" name="password" placeholder="비밀번호" required>
				<br> <input type="password" class="password"
					id="password-check" placeholder="비밀번호 확인" required> <br>
				<input type="text" id="name" name="name" placeholder="이름" required>
				<br> <input type="text" id="address" name="address"
					placeholder="주소" required> <br> <input type="text"
					id="phone" name="phone" placeholder="휴대전화" required> <br>
				<input type="text" id="email" name="email" placeholder="이메일"
					required> <br>
				<button type="submit" id="join-submit" class="login-submit">회원가입</button>
				<br>
				<button type="reset" class="join-button">취소</button>
			</form>

		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
	<script>
		document.getElementById("joinForm").addEventListener(
				"submit",
				function(event) {
					var password = document.getElementById("password").value;
					var passwordCheck = document
							.getElementById("password-check").value;

					if (password != passwordCheck) {
						alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
						event.preventDefault();
					}
				})
	</script>
</body>
</html>