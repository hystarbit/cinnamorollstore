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
<link href="${path}/resources/css/bar.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <ul class="nav flex-column nav-border">
        <li class="nav-item">
            <a class="nav-link disabled" aria-disabled="true">마이페이지</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" aria-current="page" href="${path }/mypage/orderList.do">주문내역</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${path }/mypage/mycart.do">장바구니</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${path }/mypage/checkPassword.do">개인정보 수정</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${path }/mypage/changePassword.do">비밀번호 변경</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${path }/mypage/deleteAccount.do">회원탈퇴</a>
        </li>

    </ul>
</body>
</html>