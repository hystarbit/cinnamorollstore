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
				<h2>장바구니</h2>
				<hr>
				<div class="delivery-number">
					<c:if test="${empty carts }">
						장바구니 내역이 존재하지 않습니다.
					</c:if>
					<table class="order-info">
						<c:if test="${not empty carts}">
						<colgroup>
							<col width="5%" />
							<col width="10%" />
							<col width="15%" />
							<col width="35%" />
							<col width="0%" />
							<col width="5%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
						</colgroup>
						<tr class="order-info-top">
							<th><input type="checkbox" id="all" name="cart-num"></th>
							<th>번호</th>
							<th colspan="2">상품 정보</th>
							<th></th>
							<th>수량</th>
							<th>판매 가격</th>
							<th>배송비</th>
							<th>합계금액</th>
						</tr>
						</c:if>
						<c:forEach items="${carts }" var = "cart" varStatus="status">
						<tr>
							<td><input type="checkbox" id="checkbox" class="normal"
								name="cart-num"></td>
							<td>${status.count}</td>
							<td>
							<a href="${path}/itemDetail.do?item_number=${cart.item_number}"> 
							<img src="${path}/imgLoad.do?fileName=${cart.image}" alt="Logo" height="70px">
							</a>
							</td>
							<td><a href="${path}/itemDetail.do?item_number=${cart.item_number}"> ${cart.name } </a></td>
							<form action = "${path }/mypage/updateMyCart.do" method="post">
							<td>
								<input type="hidden" name="cart_number" value = "${cart.cart_number }">
							</td>
							<td>
								<input type='number' name = "quantity" min='1' max='99' step='1' 
								value="${cart.quantity}" style="width: 50px" class="cnt" 
								onchange="this.form.submit()"> 
							</td>
							</form>
							<td class="sale-price">${cart.sale_price}</td>
							<td class="delivery-price">${cart.delivery_price}</td>
							<td class="item-all-price"></td>
						</tr>
						</c:forEach>
					</table>
					<br>
				</div>
				<hr>
				<c:if test="${not empty carts}">
				<div class="item-detail-btn"
					style="display: flex; justify-content: space-between;">
					<button class="order-button" onclick="submitForm('selectedCarts1','cartActionForm1')">
						선택 삭제하기
					</button>
					<div class="total-price">
						<span class="left">상품 총 금액: </span> <span class="total-all-price"
							style="font-weight: bold"></span> <span>원</span>
					</div>
				</div>
				</c:if>
				<form id= "cartActionForm1" method="post" action="${path}/mypage/deleteMyCart.do">
					<input type="hidden" name="selectedCarts" id="selectedCarts1" value="">
				</form>
				<div class="item-detail-btn"
					style="display: flex; justify-content: center;">
					<button class="buy" onclick="location.href='${path}/itemList.do?category=all'">
						계속 쇼핑하기
					</button>
					<button class="buy" onclick="submitForm('selectedCarts2','cartActionForm2')">
						선택 구매
					</button>
				</div>
				<form id= "cartActionForm2" method="post" action="${path}/myOrderProcess.do">
					<input type="hidden" name="selectedCarts" id="selectedCarts2" value="">
				</form>
			</div>
		</div>
		<script>
    const checkAll = document.querySelector('#all');
    const checkBoxesNormal = document.querySelectorAll('.normal');
    const checkBoxChecked = Array.from(checkBoxesNormal, (checkbox) => checkbox);
    function paintCheckAll(y) {
        checkBoxChecked.map((e) => e.checked = y);
    }
    function onCheckAllClick() {
        checkAll.checked ? paintCheckAll(true) : paintCheckAll(false);
    }
    function onBoxClick() {
        let is_checked = true;
        checkBoxChecked.forEach((box) => {
            is_checked = box.checked && is_checked;
        });
        checkAll.checked = is_checked;
    }
    checkAll.addEventListener('click', onCheckAllClick);
    checkBoxesNormal.forEach((checkbox) => checkbox.addEventListener('click', onBoxClick));
	</script>
		<script>
	    // 모든 개별 상품의 총 금액
    	function calculateItemAllPrice(row){
    		const salePrice = parseInt(row.querySelector('.sale-price').innerHTML)
    		const cnt = parseInt(row.querySelector('.cnt').value)
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
    	}
    	// 수량 입력 필드에서 이벤트 리스너 추가 
    	document.querySelectorAll('.cnt').forEach((input)=>{
    		input.addEventListener('input', calculateTotalAllPrice);
    	});
    	// 페이지 로드 시 초기 총 금액 계산
    	calculateTotalAllPrice();
    </script>
    <script>
    	function submitForm(selectedCartsType, cartActionForm){
    		const selectedCarts = [];
    		document.querySelectorAll('.normal:checked').forEach((checkbox)=>{
    			const cartNumber = checkbox.closest('tr').querySelector('input[name="cart_number"]').value;
    			selectedCarts.push(cartNumber);
    		})
    		
    		if(selectedCarts.length == 0){
    			if(cartActionForm == 'cartActionForm1'){
    				alert('삭제할 항목을 선택하세요.');
    				return;
    			}
    			if(cartActionForm == 'cartActionForm2'){
    				alert('주문할 항목을 선택하세요.');
    				return;
    			}
    		}
    		
    		document.getElementById(selectedCartsType).value = selectedCarts.join(',');
    		document.getElementById(cartActionForm).submit();
    		
    	}
    </script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>