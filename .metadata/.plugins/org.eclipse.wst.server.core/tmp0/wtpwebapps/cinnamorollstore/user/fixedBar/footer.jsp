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
	<footer class="footer">
        <hr>
        <ul class="footer-menu">
            <li><a href="${path}/info.do">회사소개</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보 처리방침</a></li>
        </ul>
        <hr>
        <div class="footer-info">
            <div class="footer-logo">
                <p><a href="${path}/main.do">시나모롤 스토어</a></p>
                <p><a href="${path}/main.do">Cinnamoroll Store</a></p>
                <img src="${path}/resources/images/Cinnamoroll.webp" alt="Logo" width="150px">
            </div>
            <div class="footer-info-detail">
                <p>상호명: 시나모롤 스토어</p>
                <p>사업자등록번호: 111-11-1111</p>
                <p>대표자: 유화정</p>
                <p>통신판매 신고번호: 1111-서울강남-1111</p>
                <p>개인정보관리책임업자: 신리오</p>
                <p>호스팅 제공 사업자: 에스프레소</p>
            </div>
            <div class="footer-info-connect">
                <p>주소: 서울특별시 강남구 선릉로 434</p>
                <p>TEL: 070-5678-1234 </p>
                <p>FAX: 02-567-8123</p>
                <p>EMAIL: cinnamon@cinnamoroll.co.kr</p>
                <p>Copyright © 2024 My WebSite. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>