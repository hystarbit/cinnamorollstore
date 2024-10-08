<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<div class="mypage-main">
			<%@ include file="mypageBar.jsp"%>
			<div class="item-info">
				<c:choose>
					<c:when test="${empty order.order_cancel_date}">
						<h2>주문 내역</h2>
					</c:when>
					<c:otherwise>
						<h2>주문 취소 내역</h2>
					</c:otherwise>
				</c:choose>
				<div class="order-item-detail-top">
					<div class="order-item-detail-top-text">
						<div class="order-date">
							<span>주문일시: </span> <span><fmt:formatDate
									value="${order.order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
						</div>
						<c:if test="${not empty order.order_cancel_date}">
							<span>주문취소일시: </span>
							<span><fmt:formatDate value="${order.order_cancel_date}"
									pattern="yyyy-MM-dd HH:mm:ss" /></span>
						</c:if>
						<div class="order-number">
							<span>주문번호: </span> <span>${order.order_number}</span>
						</div>

					</div>
					<div class="order-buttons">
						<c:choose>
							<c:when test="${empty order.order_cancel_date}">
								<span>${order.order_status}</span>
							</c:when>
							<c:otherwise>
								<span>${order.order_cancel_status}</span>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
				<br>
				<div class="delivery-number">
					<h3>구매 리스트</h3>
					<table class="order-info">
						<colgroup>
							<col width="5%" />
							<col width="20%" />
							<col width="40%" />
							<col width="5%" />
							<col width="15%" />
							<col width="15%" />
						</colgroup>
						<tr class="order-info-top">
							<th>번호</th>
							<th colspan="2">상품 정보</th>
							<th>수량</th>
							<th>판매 가격</th>
							<th>배송비</th>
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
							</tr>
						</c:forEach>
					</table>
					<br>
				</div>
				<div class="order-delivery-info">
					<div class="order-info-title">
						<h3>배송 정보</h3>
						<c:if
							test="${(order.order_status eq '주문 확인 전' || order.order_status eq '주문 확인') &&(empty order.order_cancel_date)}">
							<button type="button" class="order-button" id="editAddressBtn"
								onclick="toggleEditMode()">수정</button>
						</c:if>
					</div>
					<form id="addressForm" action="${path }/saveAddress.do"
						method="post">
						<table class="order-info-table">
							<colgroup>
								<col width="20%" style="background-color: #71BFEC;" />
								<col width="80%" />
							</colgroup>
							<tr>
								<td class="table-left">이름</td>
								<td class="table-right">${sessionScope.user.name }</td>
							</tr>
							<tr>
								<td class="table-left">휴대폰</td>
								<td class="table-right">${sessionScope.user.phone}</td>
							</tr>
							<tr>
								<td class="table-left">주소</td>
								<td class="table-right"><c:choose>
										<c:when
											test="${(order.order_status eq '주문 확인 전' || order.order_status eq '주문 확인') &&(empty order.order_cancel_date)}">
											<input type="text" id="order_address" name="order_address"
												value="${order.order_address}" pattern = ".{10,100}" readonly>
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
				<script>
					let isEditMode = false;

					function toggleEditMode() {
						const addressField = document
								.getElementById('order_address');
						const editButton = document
								.getElementById('editAddressBtn');

						if (!isEditMode) {
							// 수정 버튼 누르기
							addressField.removeAttribute('readonly');
							editButton.innerText = '확인';
							isEditMode = true;
						} else {
							// 확인 버튼 누르기
							
							var addressPattern = /^[a-zA-Z가-힣\s]{10,100}$/;
							
							if(!addressPattern.test(addressField.value)){
								alert("주소는 10~100자로 입력해야 합니다.");
							}else{
								document.getElementById('addressForm').submit();
								editButton.innerText = '수정';
								isEditMode = false;
							}
						}
					}
				</script>
				<div class="order-payment-info">
					<h3>결제 정보</h3>
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
							<td class="table-right">${order.order_price}원</td>
						</tr>
					</table>
				</div>
				<div class="item-detail-btn"
					style="display: flex; justify-content: space-evenly;">
					<button class="buy"
						onclick="location.href='${path }/mypage/orderList.do'">
						확인</button>
					<c:choose>
						<c:when test="${not empty order.order_cancel_date}">
						</c:when>
						<c:when
							test="${order.order_status eq '주문 확인 전' || order.order_status eq '주문 확인'}">
							<form id=id= "orderCancelActionForm" method="post"
								action="${path }/mypage/orderCancel.do?order_number=${order.order_number }">
								<button type="button" class="buy"
									onclick="cancelForm()">주문 취소</button>
							</form>
						</c:when>
						<c:otherwise>
							<!-- <button class="buy">교환/환불</button> -->
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
		<script>
			function cancelForm() {
				if (confirm("주문취소시키겠습니까?")) {
					document.getElementById('orderCancelActionForm').submit();
				} else {
					return false;
				}
			}
		</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>