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
<link href="${path}/resources/css/nav.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <!--nav bar 만들기-->
    <section class="top-bar">
        <!--로그인 후-->
        <menu id="headerMenu">
            <li id="userName">${sessionScope.user.name }님 반갑습니다</li>
            <li id="userDisplay"><a href="${path }/main.do">이용자 화면 보기</a></li>
            <li id="logout"><a href="${path }/admin/logout.do">로그아웃</a></li>
        </menu>
    </section>
    <section class="middle-bar">
        <div class="logo">
        	<a href="${path}/admin/main.do">
        		<img src="${path}/resources/images/Cinnamoroll.webp" height="70px">
        	</a>
			<span><a href="${path}/admin/main.do">시나모롤 스토어</a></span>
        </div>
    </section>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            주문관리
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${path}/admin/order/list.do">주문</a></li>
                            <li><a class="dropdown-item" href="${path}/admin/order/cancel/list.do">주문 취소</a></li>
                            <li><a class="dropdown-item" href="${path}/admin/order/return/list.do">교환/환불 신청서</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            회원 관리
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${path}/admin/user/list.do">회원 리스트</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            상품 관리
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${path}/admin/item/regist.do">상품 등록</a></li>
                            <li><a class="dropdown-item" href="${path}/admin/item/list.do">상품 리스트</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판 관리
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${path}/admin/board/customer.do">고객 게시판</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>

</html>