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
<script>
	// 비밀번호 정규식으로 확인하기 
	// 비밀번호와 비밀번호 확인이 일치한지 확인하기
	function validateForm(form){
		var passwordPattern = /^[A-Za-z\d@$!%*?&]{8,20}$/;		

		if(!passwordPattern.test(form.newPassword.value)){
			alert("비밀번호는 8~20자, 대문자, 소문자, 숫자, 특수문자를 사용가능합니다.");
			form.newPassword.focus();
			return false;
		}
		
		if(form.newPassword.value != form.newPasswordCheck.value){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			form.newPasswordCheck.focus();
			return false;
		}
		return true;
	}
	
	function cancelChange(){
		if(confirm("개인 정보 수정을 취소하시겠습니까?")){
			window.location.href="${path}/mypage/orderList.do";
		}else{
			return false;
		}
	}
</script>
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
					id="checkPasswordForm" class="loginForm" onsubmit="return validateForm(this)">
					<input type="password" id="currentPassword" name="currentPassword"
						placeholder="현재 비밀번호" required> <br> <input
						type="password" id="newPassword" name="newPassword"
						placeholder="새로운 비밀번호" required> <br> <input
						type="password" id="newPasswordCheck" name="newPasswordCheck"
						placeholder="새로운 비밀번호 확인" required> <br>
					<button type="submit" id="login-submit" class="login-submit">변경</button>
					<br>
					<button type="reset" id="join-submit" class="join-button"
					onclick="cancelChange()">취소</button>
				</form>
			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>