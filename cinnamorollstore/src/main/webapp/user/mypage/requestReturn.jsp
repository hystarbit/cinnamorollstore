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
				<form class="order-user-info" method="post">
					<table class="order-info-table">
						<colgroup>
							<col width="20%" style="background-color: #71BFEC;" />
							<col width="80%" />
						</colgroup>
						<tr>
							<th class="table-left">교환/환불 상품</th>
							<td class="table-right">{상품명}</td>
						</tr>
						<tr>
							<th class="table-left">교환/환불 선택</th>
							<td class="table-right"><input type="radio" id="exchange"
								name="exchange" checked> <label for="exchange">교환</label>
								<input type="radio" id="refund" name="refund"> <label
								for="refund">환불</label></td>
						</tr>
						<tr>
							<th class="table-left">사유 선택</th>
							<td class="table-right"><input type="radio" id="colorSize"
								name="colorSize" checked> <label for="colorSize">색상/사이즈
									변경</label> <input type="radio" id="mind" name="mind"> <label
								for="mind">단순 변심</label> <input type="radio" id="damage"
								name="damage"> <label for="damage">제품 파손</label> <input
								type="radio" id="misdelivery" name="misdelivery"> <label
								for="misdelivery">오배송</label></td>
						</tr>
						<tr>
							<th class="table-left">내용 작성</th>
							<td class="table-right"><textarea class="content"
									name="content" placeholder="구체적인 내용 입력 바랍니다"></textarea></td>
						</tr>
						<tr>
							<th class="table-left">이미지 업로드</th>
							<td class="table-right"><input type="file"></td>
						</tr>
						<tr>
							<th class="table-left">배송비 결제</th>
							<td class="table-right">{배송비}원</td>
						</tr>
					</table>
					<br>
					<div class="item-detail-btn"
						style="display: flex; justify-content: center;">
						<button class="buy" type="submit">
							<a href="orderList.jsp">신청하기</a>
						</button>
					</div>
				</form>


			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>