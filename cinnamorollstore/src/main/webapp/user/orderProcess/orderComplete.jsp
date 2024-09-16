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
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<div class="item-info">
			<h2>주문완료</h2>
			<p style="font-size: 14px;">주문이 완료되었습니다. 시나모롤 스토어 이용해주셔서 감사합니다~</p>
			<p style="font-size: 14px;">주문 내역은 [마이페이지> 주문 내역]에서 다시 확인 가능합니다.</p>
			<br>
			<div class="delivery-number">
				<h3>
					주문번호 : <span>${order.order_number}</span>
				</h3>
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
					<c:forEach items="${orderItems }" var = "orderItem" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="${path}/itemDetail.do?item_number=${orderItem.item_number}"> <img
								src="${path}/imgLoad.do?fileName=${orderItem.image}" alt="${orderItem.name}"
								height="70px">
						</a></td>
						<td><a href="${path}/itemDetail.do?item_number=${orderItem.item_number}"> 
							시나모롤 대형 인형 100cm </a>
						</td>
						<td>${orderItem.quantity}</td>
						<td>${orderItem.item_price}</td>
						<td>${orderItem.delivery_price}</td>
					</tr>
					</c:forEach>
				</table>
				<br>
			</div>
			<div class="order-delivery-info">
				<h3>배송 정보</h3>
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
						<td class="table-right">${sessionScope.user.phone }</td>
					</tr>
					<tr>
						<td class="table-left">주소</td>
						<td class="table-right">${order.order_address }</td>
					</tr>
				</table>
				<br>
			</div>
			<div class="order-payment-info">
				<h3>결제 정보</h3>
				<table class="order-info-table">
					<colgroup>
						<col width="20%" style="background-color: #71BFEC;" />
						<col width="80%" />
					</colgroup>
					<tr>
						<td class="table-left">결제 방법</td>
						<td class="table-right">${order.payment_type}</td>
					</tr>
					<tr>
						<td class="table-left">결제 금액</td>
						<td class="table-right">${order.order_price}원</td>
					</tr>
				</table>
			</div>
			<div class="item-detail-btn"
				style="display: flex; justify-content: space-evenly;">
				<button class="buy">
					<a href="${path}/mypage/orderList.do">주문 내역 확인</a>
				</button>
				<button class="buy">
					<a href="${path}/itemList.do?category=all">쇼핑 계속하기</a>
				</button>
				<button class="buy">
					<a href="${path}/main.do">메인으로 가기</a>
				</button>
				<button class="buy">
					<a href="${path}/logout.do">로그아웃</a>
				</button>
			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>