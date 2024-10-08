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
	<div class="item-info">
		<br>
		<br>
        <h2 style="color:#71BFEC">시나모롤 스토어 소개</h2>
        <p>온갖 귀여운 시나모롤 제품을 살 수 있는 시나모롤 스토어~</p>
        <div class="logo">
            <img src="${path}/resources/images/Cinnamoroll.webp" weight="150px">
        </div>
        <br>
        <h2 style="color:#71BFEC">찾아오시는 길</h2>
        <p>주소: 서울특별시 강남구 선릉로 434</p>
        <p>대중교통: 2호선 선릉역 2번 출구 도보 1분</p>
        <br>
        <br>
    </div>
    <%@ include file =  "../fixedBar/footer.jsp"%>
    </div>
</body>
</html>