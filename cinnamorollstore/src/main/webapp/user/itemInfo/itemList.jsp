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
</head>
<body>
	<div id="wrap">
	<%@ include file="../fixedBar/nav-before.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
	<div class="item-info">
		<h2>시나모롤 스토어 > ${category}</h2>
		<!-- <ul class="itemCategoryCount">
			<li class="itemCount">등록제품: 10개</li>
			<li class="itemCount">신상: 1개</li>
			<li class="itemCount">베스트: 1개</li>
			<li class="itemCount">세일: 1개</li>
		</ul> -->

		<!-- <div class="itemSelect">
			<ul class="itemOrders">
				<li class="itemOrder">최신순</li>
				<li class="itemOrder">낮은 가격순</li>
				<li class="itemOrder">높은 가격순</li>
			</ul>
			<div class="dropdown">
				<button class="order-button dropdown-toggle" type="button"
					id="label" data-bs-toggle="dropdown" aria-expanded="false">모아보기</button>
				<ul class="dropdown-menu" style="min-width: 100px">
					<li><a class="dropdown-item" href="#">신상</a></li>
					<li><a class="dropdown-item" href="#">베스트</a></li>
					<li><a class="dropdown-item" href="#">세일</a></li>
				</ul>
			</div>

		</div> -->
		

		<hr>
		<%-- <% for(int i=0; i < 5; i++) {%> --%>
		<div class="item-list">
			<c:forEach items="${items }" var = "item" begin="0" end="3">
			<div class="item-detail-infos">
				<div class="item-img" style="height:280px; display: flex; align-items:center;">
				<a href="${path}/itemDetail.do?item_number=${item.item_number }"><img src="${path}/resources/images/${item.image}" alt="Logo"
					width="220px"></a>
				</div>
				<div class="item-detail-buttons">
					<button type="button"
						style="background: #71BFEC; border: 1px solid #71BFEC; color: white; height: 20px; line-height: 100%; font-size: 14px;">신상</button>
					<button type="button"
						style="background: #efd45e; border: 1px solid #efd45e; color: white; height: 20px; line-height: 100%; font-size: 14px;">베스트</button>
					<button type="button"
						style="background: #ff7bb0; border: 1px solid #ff7bb0; color: white; height: 20px; line-height: 100%; font-size: 14px; ">세일</button>
				</div>
				<h5 class="item-detail-title" style="font-size:16px;">
					<a href="itemDetail.jsp">${item.name}</a>
				</h5>
				<div class="item-detail-original-price" style="font-size:14px; text-decoration-line: line-through;">
					기존 가격:${item.original_price}원
				</div>
				<div class="item-detail-price" style="font-size:14px;">
					판매 가격:${item.sale_price}원
				</div>
			</div>
			</c:forEach>
		</div>
		<%-- <% }%> --%>
		<hr>
		<div class="paging">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">처음</a></li>
					<li class="page-item"><a class="page-link" href="#">이전</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
					<li class="page-item"><a class="page-link" href="#">마지막</a></li>
				</ul>
			</nav>
		</div>
		
	</div>
	<script>
			const label = document.querySelector('.dropdown-toggle');
			const options = document.querySelectorAll('.dropdown-item');
			
			const handleSelect = (item) => {
				label.parentNode.classList.remove('active')
				label.innerHTML = item.textContent;
			}
			// 옵션 클릭시 클릭한 옵션을 넘김
			options.forEach(option => {
				option.addEventListener('click', () => handleSelect(option))
			})

			// 라벨을 클릭시 옵션 목록이 열림/닫힘
			label.addEventListener('click', () => {
			  if(label.parentNode.classList.contains('active')) {
			  	label.parentNode.classList.remove('active');
			  } else {
			  	label.parentNode.classList.add('active');
			  }
			})
	</script>
	<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>