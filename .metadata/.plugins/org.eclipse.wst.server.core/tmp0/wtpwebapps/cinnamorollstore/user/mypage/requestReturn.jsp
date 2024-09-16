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
		<div class="mypage-main">
			<%@ include file="mypageBar.jsp"%>
			<div class="item-info">
				<h2>교환/환불 신청</h2>
				<hr>
				<form class="order-user-info" method="post" action="${path }/mypage/return/request.do">
					<input type="hidden" name="order_item_number" value="${orderItem.order_item_number }">
					<table class="order-info-table">
						<colgroup>
							<col width="20%" style="background-color: #71BFEC;" />
							<col width="80%" />
						</colgroup>
						<tr>
							<th class="table-left">교환/환불 상품</th>
							<td class="table-right">${orderItem.name}</td>
						</tr>
						<tr>
							<th class="table-left">교환/환불 선택</th>
							<td class="table-right">
								<input type="radio" id="exchange" name="return_type" value="교환" checked> 
								<label for="exchange">교환</label>
								<input type="radio" id="refund" name="return_type" value="환불"> 
								<label for="refund">환불</label>
							</td>
						</tr>
						<tr>
							<th class="table-left">사유 선택</th>
							<td class="table-right">
								<input type="radio" id="mind" name="select_reason" value="단순 변심" checked> 
								<label for="mind">단순 변심</label> 
								<input type="radio" id="damage" name="select_reason" value="제품 파손"> 
								<label for="damage">제품 파손</label> 
								<input type="radio" id="misdelivery" name="select_reason" value="오배송"> 
								<label for="misdelivery">오배송</label>
							</td>
						</tr>
						<tr>
							<th class="table-left">내용 작성</th>
							<td class="table-right">
								<textarea class="content" name="content" placeholder="구체적인 내용 입력 바랍니다"></textarea>
							</td>
						</tr>
						<tr class="method-payment">
							<td class="table-left">결제 방법</td>
							<td class="table-right">
								<input type="radio" id="card" name="payment_type" value="신용카드" checked>
								<label for="card">신용카드</label>
								<input type="radio" id="bank" name="payment_type" value="무통장입금"> 
								<label for="bank">무통장입금</label>
								<input type="radio" id="transfer" name="payment_type" value="계좌이체">
								<label for="transfer">계좌이체</label>
								<input type="radio" id="virtual" name="payment_type" value="가상계좌"> 
								<label for="virtual">가상계좌</label>
							</td>
						</tr>
						<tr>
							<th class="table-left">배송비 결제</th>
							<td class="table-right">
								<input type="text" id="delivery_price" name="delivery_price" value="0">
								<span>원</span>
							</td>
						</tr>
					</table>
					
					<br>
					<div class="item-detail-btn"
						style="display: flex; justify-content: center;">
						<button class="buy" type="submit">신청하기</button>
					</div>
				</form>
				<script>
				// 배송비 금액 
		    	function calculateDeliveryPrice(){
					const returnType = document.querySelector('input[name="return_type"]:checked').value; // 교환/환불 선택
					const reason = document.querySelector('input[name="select_reason"]:checked').value; // 선택 사유 
					const deliveryPrice = parseInt('${orderItem.delivery_price}'); // 기존 배송비 
					let finalDeliveryPrice = 0;
					
					if(reason == '단순 변심'){
						if (returnType == '교환'){
							finalDeliveryPrice = deliveryPrice * 2;
						}else if(returnType== '환불'){
							finalDeliveryPrice = deliveryPrice;
						}
					}
					
					document.getElementById('delivery_price').value = finalDeliveryPrice;
				}
				
		    	calculateDeliveryPrice();
		    	
		    	document.querySelectorAll('input[name="return_type"], input[name="select_reason"]').forEach(input => {
		    		input.addEventListener('change', calculateDeliveryPrice);
		    	});
				</script>

			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>