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
<link href="${path}/resources/css/bar.css" rel="stylesheet" />
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
				<h2>주문 관리</h2>
				<hr>
				<form class="order-period" method="post">
					<span>주문 기간</span> <input type="date" name="period-start" /> <span>~</span>
					<input type="date" name="period-end" /> <span>&nbsp;&nbsp;키워드
						검색</span>
					<div class="dropdown">
						<button class="order-button dropdown-toggle" id="keyword"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">주문번호</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li><a class="dropdown-item order" href="#">주문 번호</a></li>
							<li><a class="dropdown-item order" href="#">주문 상품</a></li>
							<li><a class="dropdown-item order" href="#">주문자 아이디</a></li>
							<li><a class="dropdown-item order" href="#">주문자 이름</a></li>
						</ul>
					</div>
					<input type="search" aria-label="Search">
					<button type="button" class="order-check" onclick="">검색</button>
				</form>

				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="order-check-before-tab"
							data-bs-toggle="tab"
							data-bs-target="#order-check-before-tab-pane" type="button"
							role="tab" aria-controls="order-check-before-tab-pane"
							aria-selected="true">주문 확인 전</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="order-check-tab" data-bs-toggle="tab"
							data-bs-target="#order-check-tab-pane" type="button" role="tab"
							aria-controls="order-check-tab-pane" aria-selected="true">주문
							확인</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="delivery-prepare-tab"
							data-bs-toggle="tab" data-bs-target="#delivery-prepare-tab-pane"
							type="button" role="tab"
							aria-controls="delivery-prepare-tab-pane" aria-selected="false">배송
							준비 중</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="delivery-in-tab" data-bs-toggle="tab"
							data-bs-target="#delivery-in-tab-pane" type="button" role="tab"
							aria-controls="delivery-in-tab-pane" aria-selected="false">배송
							중</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="delivery-complete-tab"
							data-bs-toggle="tab" data-bs-target="#delivery-complete-tab-pane"
							type="button" role="tab"
							aria-controls="delivery-complete-tab-pane" aria-selected="false">배송
							완료</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="all-tab" data-bs-toggle="tab"
							data-bs-target="#all-tab-pane" type="button" role="tab"
							aria-controls="all-tab-pane" aria-selected="false">모든 주문
							보기</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active"
						id="order-check-before-tab-pane" role="tabpanel"
						aria-labelledby="order-check-before-tab" tabindex="0">
						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>유형</th>
								<th>주문 일시</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 금액</th>
								<th>결재 상태</th>
							</tr>
							<c:set var="totalCount" value="${fn:length(beforeCheckOrders)}" />
							<c:forEach items="${beforeCheckOrders }" var="beforeCheckOrder" varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td>${beforeCheckOrder.order_type }</td>
									<td><fmt:formatDate value="${beforeCheckOrder.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${beforeCheckOrder.order_number }">
											${beforeCheckOrder.order_number } </a></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${beforeCheckOrder.order_number }">
											${beforeCheckOrder.order_items_name } 
										<c:if test="${beforeCheckOrder.order_items_count > 1 }">
											외 ${beforeCheckOrder.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${beforeCheckOrder.user_name }<br>(${beforeCheckOrder.user_id })
									</td>
									<td>${beforeCheckOrder.order_price }원</td>
									<td>${beforeCheckOrder.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="order-check-tab-pane"
						role="tabpanel" aria-labelledby="order-check-tab" tabindex="0">
						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>유형</th>
								<th>주문 일시</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 금액</th>
								<th>결재 상태</th>
							</tr>
							<c:set var="totalCount" value="${fn:length(checkOrders)}" />
							<c:forEach items="${checkOrders }" var="checkOrder" varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td>${checkOrder.order_type }</td>
									<td><fmt:formatDate value="${checkOrder.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${checkOrder.order_number }">
											${checkOrder.order_number } </a></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${checkOrder.order_number }">
											${checkOrder.order_items_name } 
										<c:if test="${checkOrder.order_items_count > 1 }">
											외 ${checkOrder.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${checkOrder.user_name }<br>(${checkOrder.user_id })
									</td>
									<td>${checkOrder.order_price }원</td>
									<td>${checkOrder.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="delivery-prepare-tab-pane"
						role="tabpanel" aria-labelledby="delivery-prepare-tab"
						tabindex="0">
						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>유형</th>
								<th>주문 일시</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 금액</th>
								<th>결재 상태</th>
							</tr>
							<c:set var="totalCount" value="${fn:length(preparingDeliveryOrders)}" />
							<c:forEach items="${preparingDeliveryOrders }" var="preparingDeliveryOrder" varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td>${preparingDeliveryOrder.order_type }</td>
									<td><fmt:formatDate value="${preparingDeliveryOrder.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${preparingDeliveryOrder.order_number }">
											${preparingDeliveryOrder.order_number } </a></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${preparingDeliveryOrder.order_number }">
											${preparingDeliveryOrder.order_items_name } 
										<c:if test="${preparingDeliveryOrder.order_items_count > 1 }">
											외 ${preparingDeliveryOrder.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${preparingDeliveryOrder.user_name }<br>(${preparingDeliveryOrder.user_id })
									</td>
									<td>${preparingDeliveryOrder.order_price }원</td>
									<td>${preparingDeliveryOrder.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="delivery-in-tab-pane"
						role="tabpanel" aria-labelledby="delivery-in-tab" tabindex="0">
						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>유형</th>
								<th>주문 일시</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 금액</th>
								<th>결재 상태</th>
							</tr>
							<c:set var="totalCount" value="${fn:length(deliveringOrders)}" />
							<c:forEach items="${deliveringOrders }" var="deliveringOrder" varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td>${deliveringOrder.order_type }</td>
									<td><fmt:formatDate value="${deliveringOrder.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${deliveringOrder.order_number }">
											${deliveringOrder.order_number } </a></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${deliveringOrder.order_number }">
											${deliveringOrder.order_items_name } 
										<c:if test="${deliveringOrder.order_items_count > 1 }">
											외 ${deliveringOrder.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${deliveringOrder.user_name }<br>(${deliveringOrder.user_id })
									</td>
									<td>${deliveringOrder.order_price }원</td>
									<td>${deliveringOrder.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="delivery-complete-tab-pane"
						role="tabpanel" aria-labelledby="delivery-complete-tab"
						tabindex="0">
						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>유형</th>
								<th>주문 일시</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 금액</th>
								<th>결재 상태</th>
							</tr>
							<c:set var="totalCount" value="${fn:length(deliveryCompleteOrders)}" />
							<c:forEach items="${deliveryCompleteOrders}" var="deliveryCompleteOrder" varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td>${deliveryCompleteOrder.order_type }</td>
									<td><fmt:formatDate value="${deliveryCompleteOrder.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${deliveryCompleteOrder.order_number }">
											${deliveryCompleteOrder.order_number } </a></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${deliveryCompleteOrder.order_number }">
											${deliveryCompleteOrder.order_items_name } 
										<c:if test="${deliveryCompleteOrder.order_items_count > 1 }">
											외 ${deliveryCompleteOrder.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${deliveryCompleteOrder.user_name }<br>(${deliveryCompleteOrder.user_id })
									</td>
									<td>${deliveryCompleteOrder.order_price }원</td>
									<td>${deliveryCompleteOrder.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="all-tab-pane" role="tabpanel"
						aria-labelledby="all-tab" tabindex="0">
						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>유형</th>
								<th>주문 일시</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 금액</th>
								<th>결재 상태</th>
							</tr>
							<c:set var="totalCount" value="${fn:length(orders)}" />
							<c:forEach items="${orders }" var="order" varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td>${order.order_type }</td>
									<td><fmt:formatDate value="${order.order_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${order.order_number }">
											${order.order_number } </a></td>
									<td><a href="${path }/admin/order/detail.do?order_number=${order.order_number }">
											${order.order_items_name } 
										<c:if test="${order.order_items_count > 1 }">
											외 ${order.order_items_count - 1 }건 
										</c:if>
									</a></td>
									<td>${order.user_name }<br>(${order.user_id })
									</td>
									<td>${order.order_price }원</td>
									<td>${order.payment_status }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<br>
				<div class="items-title" style="font-size: 14px;">
					<div class="dropdown">
						<span>선택한 항목</span>
						<button class="order-button dropdown-toggle" id="move"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							주문 확인
							</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li><a class="dropdown-item down" href="#" 
							onclick="selectValue('주문 확인 전')">주문 확인 전</a></li>
							<li><a class="dropdown-item down" href="#" 
							onclick="selectValue('주문 확인')">주문 확인</a></li>
							<li><a class="dropdown-item down" href="#"
							onclick="selectValue('배송 준비 중')">배송 준비 중</a></li>
							<li><a class="dropdown-item down" href="#"
							onclick="selectValue('배송 중')">배송 중</a></li>
							<li><a class="dropdown-item down" href="#"
							onclick="selectValue('배송 완료')">배송 완료</a></li>
						</ul>
						<button type="button" class="order-check" style="width: auto;"
							onclick="submitForm()">리스트로 이동</button>
					</div>
					<button type="button" class="order-check" style="width: auto;"
						onclick="">리스트 다운로드</button>
				</div>
				<form id="orderActionForm" method="post" action="${path}/admin/order/list/edit.do">
					<input type="hidden" id="selectedOrderStatus" name="order_status"
						value="주문 확인">
					<input type="hidden" name="selectedOrders" id="selectedOrders" value="">
				</form>
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
	function toggling(toggle, item){
		//const label = document.querySelector('.dropdown-toggle');
		//const options = document.querySelectorAll('.dropdown-item');
		const label = document.querySelector(toggle);
		const options = document.querySelectorAll(item);
		console.log(label);
		
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
	}
	toggling('#keyword', '.order');
	toggling('#move', '.down'); 
	
	
	</script>
	<script>
		function submitForm(){
			const selectedOrders = [];
			document.querySelectorAll('.roundcheckbox:checked').forEach((checkbox) =>{
				const orderNumber = checkbox.closest('tr').querySelector('td:nth-child(5)').innerText.trim();
				selectedOrders.push(orderNumber);
			})
			
			if(selectedOrders.length == 0){
				alert('주문 상태를 변경할 항목을 선택하세요.');
				return;
			}
			
			document.getElementById('selectedOrders').value=selectedOrders.join(',');
			document.getElementById('orderActionForm').submit();
		}
		
		function selectValue(status){
			document.getElementById('selectedOrderStatus').value = status;
		} 
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>