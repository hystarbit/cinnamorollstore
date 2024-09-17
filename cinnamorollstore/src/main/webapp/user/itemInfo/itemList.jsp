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
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<div class="item-info">
			<h2>시나모롤 스토어 > ${categoryName}</h2>
			<hr>
			<c:forEach var="index" begin="0" end="4">
				<div class="item-list">
					<c:forEach items="${items }" var="item" begin="${index*4}"
						end="${index*4+3 }">
						<div class="item-detail-infos" style="width: 220px;">
							<a href="${path}/itemDetail.do?item_number=${item.item_number }">
								<div class="item-img" style="height: 280px; display: flex; justify-content: left; align-items: center;">
									<img src="${path}/imgLoad.do?fileName=${item.image}" alt="${item.name }" width="200px" height="200px">
								</div>
								<div class="item-detail-buttons">
									<button type="button"
										style="background: #71BFEC; border: 1px solid #71BFEC; color: white; height: 20px; line-height: 100%; font-size: 14px;">신상</button>
									<button type="button"
										style="background: #efd45e; border: 1px solid #efd45e; color: white; height: 20px; line-height: 100%; font-size: 14px;">베스트</button>
									<c:if test="${item.original_price > item.sale_price}">		
									<button type="button"
										style="background: #ff7bb0; border: 1px solid #ff7bb0; color: white; 
										height: 20px; line-height: 100%; font-size: 14px;">세일</button>
									</c:if>
								</div>
								<h5 class="item-detail-title" style="font-size: 16px;">
									${item.name}
								</h5>
								<c:if test="${item.original_price != item.sale_price}">
								<div class="item-detail-original-price"
									style="font-size: 14px; text-decoration-line: line-through;">
									기존 가격:${item.original_price}원</div>
								</c:if>
								<div class="item-detail-price" style="font-size: 14px;">
									판매 가격:${item.sale_price}원</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
			<hr>
			<div class="paging">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${currentPage > 1 }">
							<!-- 처음 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/itemList.do?category=${category}&pageNum=1"> 
									처음 
								</a>
							</li>
						
							<!-- 이전 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/itemList.do?category=${category}&pageNum=${currentPage-1}">
									이전
								</a>
							</li>
							</c:if>
						
						<!--  페이지 번호 -->
						<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
							<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
								<a class="page-link" href="${path }/itemList.do?category=${category}&pageNum=${pageNum}">
									${pageNum }
								</a>
							</li>
						</c:forEach>
						
						
						<c:if test="${currentPage < totalPages}">
							<!-- 다음 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/itemList.do?category=${category}&pageNum=${currentPage + 1}">
								다음
								</a>
							</li>
						
						
							<!-- 마지막 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/itemList.do?category=${category}&pageNum=${totalPages}"> 
									마지막 
								</a>
							</li>
						</c:if>
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