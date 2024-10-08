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
<script>
	// 주소 정규식으로 확인하기 
	function validateForm(form){
		var addressPattern = /^[a-zA-Z가-힣\s]{10,100}$/;
		
		/* if(!addressPattern.test(form.address.value)){
			alert("주소는 10~100자로 입력해야 합니다.");
			form.address.focus()
			return false;
		} */
		
		return true;
	}
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<div class="item-info">
			<h2>주문하기</h2>
			<form method="get" action="myOrderComplete.do" 
			onsubmit="return validateForm(this)">
				<input type="hidden" id="order_price" name="order_price" value="">
				<div class="delivery-place">
					<h3>배송지</h3>
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
							<td class="table-left">연락처</td>
							<td class="table-right">${sessionScope.user.phone }</td>
						</tr>
						<tr>
							<td class="table-left">주소</td>
							<td class="table-right"><input type="text" id="address" name="address"
								value="${sessionScope.user.address }" style="width: 300px;"
								pattern = ".{10,100}" ></td>
						</tr>
					</table>
					<br>
				</div>
				<br>
				<h3>주문상품</h3>
				<div class="item-order-list">
					<table class="order-info">
						<colgroup>
							<col width="10%" />
							<col width="15%" />
							<col width="35%" />
							<col width="0%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
						</colgroup>
						<tr class="order-info-top">
							<th>번호</th>
							<th colspan="2">상품 정보</th>
							<th></th>
							<th>수량</th>
							<th>판매 가격</th>
							<th>배송비</th>
							<th>합계금액</th>
						</tr>
						<c:if test="${not empty carts}">
						<c:forEach items="${carts }" var="cart" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a
									href="${path}/itemDetail.do?item_number=${cart.item_number}">
										<img src="${path}/imgLoad.do?fileName=${cart.image}" alt="${cart.name }"
										height="70px">
								</a></td>
								<td><a
									href="${path}/itemDetail.do?item_number=${cart.item_number}">
										${cart.name } </a></td>
								<td><input type="hidden" name="cart_number" class="cart_number"
										value="${cart.cart_number }"></td>
								<td class="cnt">${cart.quantity}</td>
								<td class="sale-price">${cart.sale_price}</td>
								<td class="delivery-price">${cart.delivery_price}</td>
								<td class="item-all-price"></td>
							</tr>
						</c:forEach>
						</c:if>
					</table>
					<br>
				</div>
				<hr>
				<div class="total-price">
					<span class="left">총 결제 금액: </span> <span class="total-all-price"
						style="font-weight: bold"></span> <span>원</span>
				</div>
				<br>
				<h3>결제 방법</h3>
				<tr class="method-payment">
					<td><input type="radio" id="card" name="payment_type" value="신용카드" checked>
						<label for="card">신용카드</label></td>
					<td><input type="radio" id="bank" name="payment_type" value="무통장입금"> <label
						for="bank">무통장입금</label></td>
					<td><input type="radio" id="transfer" name="payment_type" value="계좌이체">
						<label for="transfer">계좌이체</label></td>
					<td><input type="radio" id="virtual" name="payment_type" value="가상계좌"> <label
						for="virtual">가상계좌</label></td>
				</tr>
				<div class="item-detail-btn"
					style="display: flex; justify-content: center;">
					<button class="buy" type="submit">주문하기</button>
				</div>
			</form>
			
		</div>
		<script>
	    // 모든 개별 상품의 총 금액
    	function calculateItemAllPrice(row){
    		const salePrice = parseInt(row.querySelector('.sale-price').innerHTML)
    		const cnt = parseInt(row.querySelector('.cnt').innerHTML)
    		const deliveryPrice = parseInt(row.querySelector('.delivery-price').innerHTML)
    		itemAllPrice = salePrice * cnt + deliveryPrice
    		row.querySelector('.item-all-price').innerHTML = itemAllPrice
    		return itemAllPrice;
    	}
    	// 모든 상품의 총 합계 금액 
    	function calculateTotalAllPrice(){
    		const rows = document.querySelectorAll('.order-info tr:not(.order-info-top)');
    		let totalAllPrice = 0;
    		rows.forEach((row) => {
    			totalAllPrice += calculateItemAllPrice(row);
    		});
    		document.querySelector('.total-all-price').innerHTML = totalAllPrice;
    		document.querySelector('#order_price').value = totalAllPrice;
    	}

    	// 페이지 로드 시 초기 총 금액 계산
    	calculateTotalAllPrice();
    </script>
    <script>
		function submitForm(){
			const Carts = [];
			document.querySelectorAll('.cart_number').forEach((cartNum) =>{
				const cartNumber = cartNum.value();
				Carts.push(cartNumber);
			})
			
			document.getElementById('selectedItems').value=Carts.join(',');
			document.getElementById('itemActionForm').submit();
		}
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>