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
		<%@ include file="../fixedBar/nav-after.jsp"%>
		<div class="login" style="text-align: center;">
			<section class="frequent">
				<h3>자주 이용하는 메뉴</h3>
				<button class="buy"
					onclick="location.href='${path}/admin/item/regist.do'">상품
					등록</button>
				<button class="buy"
					onclick="location.href='${path}/admin/order/return/list.do'">교환/환불
					신청</button>
			</section>
			<section class="today">
				<br>
				<h3>오늘의 통계</h3>
				<button class="buy">회원 가입 수: ${todayUser }명</button>
				<button class="buy">상품 등록 수: ${todayItem }건</button>
				<br>
				<button class="buy">주문 수: ${todayOrder }건</button>
				<button class="buy">주문 취소 수: ${todayOrderCancel }건</button>
			</section>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>