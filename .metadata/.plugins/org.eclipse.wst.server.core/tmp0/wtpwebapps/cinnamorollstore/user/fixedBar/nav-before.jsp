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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!--nav bar 만들기-->
	<header class="header">
		<section class="top-bar">
			<menu id="headerMenu">
				<c:choose>
					<%-- 로그인 후 --%>
					<c:when test="${not empty sessionScope.user}">
						<li id="userName">${sessionScope.user.name}님 반갑습니다</li>
						<li id="logout"><a href="${path }/logout.do">로그아웃</a></li>
					</c:when>
					<%-- 로그인 전 --%>
					<c:otherwise>
						<li id="login-menu"><a href="${path}/login.do">로그인</a></li>
						<li id="join-menu"><a href="${path}/TOS.do">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				<li id="logout"><a href="${path }/customer/boardList.do">고객센터</a></li>
			</menu>

		</section>
		<section class="middle-bar">
			<div class="logo">
				<a href="${path}/main.do"><img
					src="${path}/resources/images/Cinnamoroll.webp" height="70px"></a>
				<span><a href="${path}/main.do">시나모롤 스토어</a></span>
			</div>
			<div class="search">
				<form id="searchForm" method="post" action="${path }/search.do">
					<input type="text" id="searchItem" name="searchItem" title="시나모롤 상품 검색"
						placeholder="찾고 싶은 상품 검색!" value="${searchItem }">
				</form>
			</div>
			<ul class="icon-menu">
				<li class="my-page"><a href="${path }/mypage/orderList.do"> <span
						class="my-page-icon"> <img
							src="${path}/resources/images/mypage.png" alt="mypage"
							height="45px">
					</span> <span class="my-page-text">마이페이지</span>
				</a></li>
				<li class="my-cart"><a href="${path }/mypage/mycart.do"> <span
						class="my-cart-icon"> <img
							src="${path}/resources/images/cart.png" alt="cart" height="45px">
					</span> <span class="my-cart-text">장바구니</span>
				</a></li>
			</ul>
		</section>
		<section id="menu">
			<ul id="categoryList">
				<li><a href="${path}/itemList.do?category=all">전체상품</a></li>
				<li><a href="${path}/itemList.do?category=stationary">문구</a></li>
				<li><a href="${path}/itemList.do?category=writing">필기</a></li>
				<li><a href="${path}/itemList.do?category=props">소품</a></li>
			</ul>
		</section>
		<hr>
	</header>
</body>
</html>