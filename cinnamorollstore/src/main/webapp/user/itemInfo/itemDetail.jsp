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
			<h2>상품 소개</h2>
			<hr>
			<div class="item-detail">
				<div class="item-img">
					<img src="imgLoad.do?fileName=${item.image}" alt="Logo"
						width="400px" height="400px">
				</div>
				<div class="item-detail-infos">
					<div class="item-detail-title" style="font-size: 24px; width: 400px;">
						<span>${item.name }</span>
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
						<c:if test="${item.exposure == '품절'}">
							<button type="button"
								style="background: #1C0000; border: 1px solid #1C0000; color: white; height: 20px; line-height: 100%; font-size: 14px;">품절</button>
						</c:if>
					</div>
					<c:if test="${item.original_price != item.sale_price}">
					<div class="item-detail-original-price"
						style="text-decoration-line: line-through;">
						<span class="left linethrough">기존 가격: </span> <span class="original-price">${item.original_price}</span>
						<span>원</span>
					</div>
					</c:if>
					<div class="item-detail-price" style="font-size: 18px;">
						<span class="left">판매 가격: </span> <span class="sale-price">${item.sale_price}</span>
						<span>원</span>
					</div>
					<div class="item-detail-count">
						<span class="left">수량: </span> <input type='number' id="cnt"
							value='1' min='1' max='99' step='1'
							style="width: 50px"> <span>개</span>
					</div>
					<div class="item-detail-delivery-price">
						<span class="left">배송비: </span> <span class="delivery-price">${item.delivery_price}</span>
						<span>원</span>
					</div>
					<div class="item-detail-all-price">
						<span class="left">총 결제금액: </span> <span class="all-price"></span>
						<span>원</span>
					</div>

					<div class="item-detail-btn">
						<form action="${path}/mypage/addMyCart.do" method="post">
							<input type="hidden" name="item_number" value="${item.item_number }">
							<input type="hidden" id = "quantityValue1" name="quantity" value="1">
							<button type="submit" class="cart">장바구니</button>
						</form>
						<form action="${path}/myOrderProcess.do" method="post">
							<input type="hidden" name="item_number" value="${item.item_number }">
							<input type="hidden" id = "quantityValue2"name="quantity" value="1">
							<button type="submit" class="buy">주문하기</button>
						</form>
					</div>

				</div>
			</div>
		</div>
		<script>
			function calculateAllPrice() {
				const salePrice = parseInt(document
						.querySelector('.sale-price').innerHTML)
				const cnt = parseInt(document.querySelector('#cnt').value)
				const deliveryPrice = parseInt(document
						.querySelector('.delivery-price').innerHTML)
				allPrice = salePrice * cnt + deliveryPrice
				document.querySelector('.all-price').innerHTML = allPrice
			}
			document.querySelector("#cnt").addEventListener('input',calculateAllPrice);
			
			calculateAllPrice();
			document.getElementById("cnt").addEventListener('input',function(){
				document.getElementById("quantityValue1").value = this.value;
				document.getElementById("quantityValue2").value = this.value;
			});
		</script>
		
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>