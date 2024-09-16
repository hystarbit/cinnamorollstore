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
				<h2>교환/환불 신청 내역</h2>
				<hr>
					<table class="order-info-table">
						<colgroup>
							<col width="20%" style="background-color: #71BFEC;" />
							<col width="80%" />
						</colgroup>
						<tr>
							<th class="table-left">접수 번호</th>
							<td class="table-right">${orderReturn.application_number}</td>
						</tr>
						<tr>
							<th class="table-left">처리 상태</th>
							<td class="table-right">${orderReturn.order_return_status}</td>
						</tr>
						<tr>
							<th class="table-left">신청자</th>
							<td class="table-right">${sessionScope.user.name}(${sessionScope.user.user_id})</td>
						</tr>
						<tr>
							<th class="table-left">휴대전화</th>
							<td class="table-right">${sessionScope.user.phone}</td>
						</tr>
						<tr>
							<th class="table-left">교환/환불 상품</th>
							<td class="table-right">${orderItem.name}</td>
						</tr>
						<tr>
							<th class="table-left">교환/환불 선택</th>
							<td class="table-right">
								${orderReturn.return_type}
							</td>
						</tr>
						<tr>
							<th class="table-left">사유 선택</th>
							<td class="table-right">
								${orderReturn.select_reason}
							</td>
						</tr>
						<tr>
							<th class="table-left">내용 작성</th>
							<td class="table-right">
								${orderReturn.content}
							</td>
						</tr>
						<tr>
							<td class="table-left">결제 방법</td>
							<td class="table-right">${orderReturn.payment_type}</td>
						</tr>
						<tr>
							<th class="table-left">배송비 결제</th>
							<td class="table-right">
								${orderReturn.delivery_price}
								<span>원</span>
							</td>
						</tr>
					</table>
					
					<br>
					<div class="item-detail-btn"
						style="display: flex; justify-content: center;">
						<button class="buy"
						onclick="location.href='${path }/mypage/orderList.do'">
							확인
						</button>
					</div>

			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>