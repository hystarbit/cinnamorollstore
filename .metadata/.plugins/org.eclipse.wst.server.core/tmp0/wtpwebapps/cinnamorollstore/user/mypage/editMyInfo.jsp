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
			<div id="join" class="login">
				<h2 id="join-title">개인정보 수정</h2>
				<form action="${path }/mypage/editMyInfo.do" method="post" id="joinForm"
					class="loginForm">
					<input type="text" id="user_id" name="user_id" placeholder="아이디"
						value="${sessionScope.user.user_id }" readonly> <br> 
					<input type="text" id="name" name="name" placeholder="이름" 
					value="${sessionScope.user.name }"required><br> 
					<input type="text" id="address" name="address" placeholder="주소" 
					value="${sessionScope.user.address }" required> <br> 
					<input type="text" id="phone" name="phone" placeholder="휴대전화" 
					value="${sessionScope.user.phone }"required> <br>
					<input type="text" id="email" name="email" placeholder="이메일"
					value="${sessionScope.user.email }" required>
					<br>
					<button type="submit" id="join-submit" class="login-submit">수정</button>
					<br>
					<button type="reset" id="join-submit" class="join-button">취소</button>
				</form>
				
			</div>
			
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>