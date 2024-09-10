<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<%@ include file="../fixedBar/nav-after.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>

		<div class="mypage-main">

			<%@ include file="orderBar.jsp"%>

			<div class="item-info">
				<h2>주문 취소</h2>
				<hr>
				<form class="order-period" method="post">
					<span>주문일</span> <input type="date" name="period-start" /> <span>~</span>
					<input type="date" name="period-end" /> <span>&nbsp;&nbsp;키워드
						검색</span>
					<div class="dropdown">
						<button class="order-button dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">주문자</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li><a class="dropdown-item" href="#">주문자</a></li>
							<li><a class="dropdown-item" href="#">주문번호</a></li>
						</ul>
					</div>
					<input type="search" aria-label="Search">
					<button type="button" class="order-check" onclick="">검색</button>
				</form>

				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="before-tab"
							data-bs-toggle="tab" data-bs-target="#before-tab-pane"
							type="button" role="tab" aria-controls="before-tab-pane"
							aria-selected="true">결제 취소 전</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="after-tab" data-bs-toggle="tab"
							data-bs-target="#after-tab-pane" type="button" role="tab"
							aria-controls="after-tab-pane" aria-selected="false">결제
							취소 완료</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="before-tab-pane"
						role="tabpanel" aria-labelledby="before-tab" tabindex="0">
						
						<table class="order-info">
						<c:choose>
						<c:when test="${not empty beforeCancelOrders}">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>주문일</th>
								<th>주문 취소일</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 방법</th>
								<th>결재 금액</th>
							</tr>
							</c:when>
							<c:otherwise>
								<br>
								<p>해당 항목이 존재하지 않습니다.</p>
							</c:otherwise>
							</c:choose>
							<c:set var="totalCount" value="${fn:length(beforeCancelOrders)}" />
							<c:forEach items="${beforeCancelOrders }" var="beforeCancelOrder"
								varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td><fmt:formatDate value="${beforeCancelOrder.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${beforeCancelOrder.order_cancel_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a
										href="${path }/admin/order/detail.do?order_number=${beforeCancelOrder.order_number }">
											${beforeCancelOrder.order_number } </a></td>
									<td><a
										href="${path }/admin/order/detail.do?order_number=${beforeCancelOrder.order_number }">
											${beforeCancelOrder.order_items_name } <c:if
												test="${beforeCancelOrder.order_items_count > 1 }">
											외 ${beforeCancelOrder.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${beforeCancelOrder.user_name }<br>(${beforeCancelOrder.user_id })
									</td>
									<td>${beforeCancelOrder.order_price }원</td>
									<td>${beforeCancelOrder.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="after-tab-pane" role="tabpanel"
						aria-labelledby="after-tab" tabindex="0">
						<table class="order-info">
							<c:choose>
							<c:when test="${not empty afterCancelOrders}">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>주문일</th>
								<th>주문 취소일</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 방법</th>
								<th>결재 금액</th>
							</tr>
							</c:when>
							<c:otherwise>
								<br>
								<p>해당 항목이 존재하지 않습니다.</p>
							</c:otherwise>
							</c:choose>
							<c:set var="totalCount" value="${fn:length(afterCancelOrders)}" />
							<c:forEach items="${afterCancelOrders }" var="afterCancelOrder"
								varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td><fmt:formatDate value="${afterCancelOrder.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${afterCancelOrder.order_cancel_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a
										href="${path }/admin/order/detail.do?order_number=${afterCancelOrder.order_number }">
											${afterCancelOrder.order_number } </a></td>
									<td><a
										href="${path }/admin/order/detail.do?order_number=${afterCancelOrder.order_number }">
											${afterCancelOrder.order_items_name } <c:if
												test="${afterCancelOrder.order_items_count > 1 }">
											외 ${afterCancelOrder.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${afterCancelOrder.user_name }<br>(${afterCancelOrder.user_id })
									</td>
									<td>${afterCancelOrder.order_price }원</td>
									<td>${afterCancelOrder.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="items-title" style="font-size: 14px;">
					<button type="button" class="order-check" style="width: auto;"
						onclick="">결제 취소 완료 리스트로 이동</button>
					<button type="button" class="order-check" style="width: auto;"
						onclick="">리스트 다운로드</button>
				</div>

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