<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시나모롤 스토어</title>
<link href="${path}/resources/css/main.css" rel="stylesheet"/>
</head>
<body>
	<div id="wrap">
	<%@ include file =  "../fixedBar/nav-before.jsp"%>
	<c:if test="${param.error == 'exists'}">
		<script>
			alert('로그인에 실패하였습니다.');
		</script>
	</c:if>
	<c:if test="${param.error == 'notEqualUser'}">
		<script>
			alert('당신의 읽기권한이 존재하지 않습니다.');
		</script>
	</c:if>
	<div id="login" class="login">
        <h2 class="login-title">로그인</h2>
        <form action="${path}/login.do" method="post" id="loginForm" class="loginForm">
            <input type="text" id="user_id" name="user_id" placeholder="아이디" required>
            <br>
            <input type="password" id="password" name="password" placeholder="비밀번호" required>
            <br>
            <button type="submit" id="login-submit" class="login-submit">로그인</button>
            <br>
            <button class="join-button" onclick="location.href='${path}/TOS.do'">회원가입</button>
        </form>
        
    </div>
    <%@ include file =  "../fixedBar/footer.jsp"%>
    </div>
</body>
</html>