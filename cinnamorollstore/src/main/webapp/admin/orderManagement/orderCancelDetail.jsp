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
				<h2>주문 취소 상세 보기</h2>
				<h3>주문서 관리</h3>
				<form class="order-user-info" method="post" id="statusForm"
					action="${path}/admin/order/cancel/detail/edit.do">
					<input type="hidden" name="order_number" value="${order.order_number }">
					<input type="hidden" id="selectedPaymentStatus"
						name="payment_status" value="${order.payment_status }"> 
					<input type="hidden" id="selecedOrderCancelStatus" name="order_cancel_status"
						value="${order.order_cancel_status }">
				</form>
					<div class="order-item-list" style="border:1px solid #333;">
						<table style="width: 100%;">
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="15%" />
								<col width="25%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<tr>
								<th class="table-left black border-free">주문일</th>
								<td class="table-right border-free"><fmt:formatDate
										value="${order.order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="table-left black border-free">주문 고객</td>
								<td class="table-right border-free">${order.user_name}
									(${order.user_id })</td>
								<td class="table-left black border-free">주문 번호</td>
								<td class="table-right border-free">${order.order_number}</td>
							</tr>
							<tr>
								<th class="table-left black border-free">주문 취소일</th>
								<td class="table-right border-free"><fmt:formatDate
										value="${order.order_cancel_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="table-left black border-free">결제 상태</td>
								<td class="table-right border-free">
									<button class="order-button dropdown-toggle" id="payment"
										type="button" data-bs-toggle="dropdown" aria-expanded="false">${order.payment_status }</button>
									<ul class="dropdown-menu" style="min-width: 50px;">
										<li><a class="dropdown-item p" href="#"
											onclick="selectValue('selectedPaymentStatus','입금 전')">입금
												전</a></li>
										<li><a class="dropdown-item p" href="#"
											onclick="selectValue('selectedPaymentStatus','결제 완료')">결제
												완료</a></li>
									</ul>
								</td>
								<td class="table-left black border-free">
									취소 처리 상태
								</td>
								<td class="table-right border-free">
									<button class="order-button dropdown-toggle" id="order"
										type="button" data-bs-toggle="dropdown" aria-expanded="false">${order.order_cancel_status}
									</button>
									<ul class="dropdown-menu" style="min-width: 50px;">
										<li><a class="dropdown-item o" href="#"
											onclick="selectValue('selecedOrderCancelStatus','결제 취소 전')">결제 취소 전</a></li>
										<li><a class="dropdown-item o" href="#"
											onclick="selectValue('selecedOrderCancelStatus','결제 취소 완료')">결제 취소 완료</a></li>
									</ul>
								</td>
							</tr>
						
						</table>
				
			</div>
			<h3>주문 상품</h3>
			<div class="delivery-number">

				<table class="order-info">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="40%" />
						<col width="5%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<tr class="order-info-top">
						<th>번호</th>
						<th colspan="2">상품 정보</th>
						<th>수량</th>
						<th>판매 가격</th>
						<th>배송비</th>
						<th>합계가격</th>
					</tr>
					<c:forEach items="${orderItems }" var="orderItem"
						varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><a
								href="${path }/itemDetail.do?item_number=${orderItem.item_number}">
									<img src="${path}/imgLoad.do?fileName=${orderItem.image}"
									alt="Logo" height="70px">
							</a></td>
							<td><a
								href="${path }/itemDetail.do?item_number=${orderItem.item_number}">
									${orderItem.name} </a></td>
							<td>${orderItem.quantity }</td>
							<td>${orderItem.item_price }</td>
							<td>${orderItem.delivery_price}</td>
							<td>${orderItem.quantity * orderItem.item_price + orderItem.delivery_price}</td>
						</tr>
					</c:forEach>
				</table>

				<br>
			</div>

			<div class="order-delivery-info">
				<div class="order-info-title">
					<h3>배송 정보</h3>
				</div>
				<form id="addressForm" action="${path }/saveAddress2.do"
					method="post">
					<table class="order-info-table">
						<colgroup>
							<col width="20%" style="background-color: #71BFEC;" />
							<col width="80%" />
						</colgroup>
						<tr>
							<td class="table-left">이름</td>
							<td class="table-right">${order.user_name }</td>
						</tr>
						<tr>
							<td class="table-left">휴대폰</td>
							<td class="table-right">${order.phone }</td>
						</tr>
						<tr>
							<td class="table-left">주소</td>
							<!-- <td class="table-right">서울시 강남구</td> -->
							<td class="table-right"><c:choose>
									<c:when
										test="${order.order_status eq '주문 확인 전' || order.order_status eq '주문 확인'}">
										<input type="text" id="order_address" name="order_address"
											value="${order.order_address}" readonly>
									</c:when>
									<c:otherwise>
										${order.order_address}
									</c:otherwise>
								</c:choose></td>
						</tr>

					</table>
					<input type="hidden" name="order_number"
						value="${order.order_number}">
				</form>
				<br>
			</div>
			<div class="order-payment-info">
				<h3>결제 정보</h3>
				<div class="order-payment-method-amount">
					<table class="order-info-table">
						<colgroup>
							<col width="20%" style="background-color: #71BFEC;" />
							<col width="80%" />
						</colgroup>
						<tr>
							<td class="table-left">결제 방법</td>
							<td class="table-right">${order.payment_type }</td>
						</tr>
						<tr>
							<td class="table-left">결제 금액</td>
							<td class="table-right">${order.order_price }원</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="item-detail-btn"
				style="display: flex; justify-content: center;">
				<button class="buy" onclick="submitForm()">
					저장
				</button>
				<button class="buy" 
					onclick="location.href='${path }/admin/order/cancel/list.do'">
					취소
				</button>
			</div>
		</div>

	</div>
	<script>
	function toggling(toggle, item){
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
	toggling('#payment', '.p');
	toggling('#order', '.o'); 
	toggling('#company', '.c'); 
	
	</script>
	<script> 
		function selectValue(selected, status){
			document.getElementById(selected).value = status;
		} 
		
		function submitForm(){
			alert("저장되었습니다.");
			document.getElementById('statusForm').submit();
		}
		
		function resetForm(){
			document.getElementById('statusForm').reset();
		}
	</script>
	<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>