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
<script>
	// 이름, 주소, 휴대전화, 이메일 정규식으로 확인하기 
	function validateForm(form){
		var namePattern =  /^[a-zA-Z가-힣\s]{1,10}$/;
		var addressPattern = /^[a-zA-Z가-힣\s]{10,100}$/;
		var phonePattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/ ;
		var emailPattern = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		
		if(!namePattern.test(form.name.value)){
			alert("이름은 1~10자로 입력해야 합니다.");
			form.name.focus();
			return false;
		}
		
		/* if(!addressPattern.test(form.address.value)){
			alert("주소는 10~100자로 입력해야 합니다.");
			form.address.focus()
			return false;
		} */
		
		if(!phonePattern.test(form.phone.value)){
			alert("올바른 휴대전화 형식을 입력해주세요.");
			form.phone.focus();
			return false;
		}
		
		if(!emailPattern.test(form.email.value)){
			alert("올바른 이메일 주소를 입력해주세요.");
			form.email.focus();
			return false;
		}
		return true;
	}
	
	function cancelEdit(){
		if(confirm("개인 정보 수정을 취소하시겠습니까?")){
			window.location.href="${path}/mypage/orderList.do";
		}else{
			return false;
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<div class="mypage-main">
			<%@ include file="mypageBar.jsp"%>
			<div id="join" class="login">
				<h2 id="join-title">개인정보 수정</h2>
				<form action="${path }/mypage/editMyInfo.do" method="post" id="joinForm"
					class="loginForm" onsubmit="return validateForm(this)">
					<input type="text" id="user_id" name="user_id" placeholder="아이디"
						value="${sessionScope.user.user_id }" readonly> <br> 
					<input type="text" id="name" name="name" maxlength="10"
					placeholder="이름(한문 또는 영문 1~10자 입력가능)"
					value="${sessionScope.user.name }"required><br> 
					<input type="text" id="address" name="address" maxlength="100"
					placeholder="주소(10~100자 입력가능)" 
					value="${sessionScope.user.address }" required> <br> 
					<input type="text" id="phone" name="phone" 
					placeholder="휴대전화(- 상관없음)" 
					value="${sessionScope.user.phone }"required> <br>
					<input type="text" id="email" name="email" pattern = ".{10,100}" 
					placeholder="이메일(유효한 이메일주소 입력가능)"
					value="${sessionScope.user.email }" required>
					<br>
					<button type="submit" id="join-submit" class="login-submit">수정</button>
					<br>
					<button type="button" id="join-submit" class="join-button"
					onclick="cancelEdit()">취소</button>
				</form>
				
			</div>
			
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>