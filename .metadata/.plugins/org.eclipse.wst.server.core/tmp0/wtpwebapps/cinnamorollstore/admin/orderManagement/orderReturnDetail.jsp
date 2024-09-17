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
				<h2>교환/환불 신청 상세 보기</h2>

				<hr>
				<form class="order-user-info" id = "statusForm" method="post"
					action="${path}/admin/order/return/detail/edit.do">
					<input type="hidden" name="application_number" value="${orderReturn.application_number }">
					<input type="hidden" id="selectedOrderReturnStatus" name="order_return_status"
						value="${orderReturn.order_return_status }">
						
						
				<div class="order-item-detail-top">
					<div class="order-item-detail-top-text">
						<div class="order-date">
							<span>접수일: </span> 
							<span><fmt:formatDate value="${orderReturn.application_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></span>
						</div>
						<div class="order-number">
							<span>처리 완료일: </span> 
							<c:choose>
								<c:when test="${not empty orderReturn.complete_date}">
									<span><fmt:formatDate value="${orderReturn.complete_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></span>
								</c:when>
								<c:otherwise>
									<span>-</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="order-buttons">
						<span>처리 상태: </span> <span>
							<c:choose>
							<c:when test="${orderReturn.order_return_status ==  '처리 전'}">
							<div class="dropdown">
								<button class="order-button dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									${orderReturn.order_return_status}
								</button>
								<ul class="dropdown-menu" style="min-width: 50px;">
									<li><a class="dropdown-item" href="#"
									onclick="selectValue('selectedOrderReturnStatus','처리 전')">처리 전</a></li>
									<li><a class="dropdown-item" href="#"
									onclick="selectValue('selectedOrderReturnStatus','처리 완료')">처리 완료</a></li>
								</ul>
							</div>
							</c:when>
							<c:otherwise>
								<button class="order-button" type="button">
									${orderReturn.order_return_status}
								</button>
							</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>

				
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
							<th class="table-left">신청자</th>
							<td class="table-right"><span>${orderReturn.user_name}</span> <span>(${orderReturn.user_id})</span>
							</td>
						</tr>
						<tr>
							<th class="table-left">휴대폰 번호</th>
							<td class="table-right">${orderReturn.phone}</td>
						</tr>
						<tr>
							<th class="table-left">상품</th>
							<td class="table-right">${orderReturn.item_name}</td>
						</tr>
						<tr>
							<th class="table-left">교환/환불 선택</th>
							<td class="table-right">${orderReturn.return_type}</td>
						</tr>
						<tr>
							<th class="table-left">사유 선택</th>
							<td class="table-right">${orderReturn.select_reason}</td>
						</tr>
						<tr>
							<th class="table-left">내용 작성</th>
							<td class="table-right">${orderReturn.content}</td>
						</tr>
						<tr>
							<td class="table-left">결제 방법</td>
							<td class="table-right">${orderReturn.payment_type}</td>
						</tr>
						<tr>
							<th class="table-left">배송비 결제 금액</th>
							<td class="table-right">${orderReturn.delivery_price}원</td>
						</tr>
					</table>
					<br>
					<table class="order-info-table">
						<colgroup>
							<col width="20%" style="background-color: #71BFEC;" />
							<col width="80%" />
						</colgroup>
						<tr>
							<th class="table-left">처리 사항 메모</th>
							<td class="table-right">
								<textarea class="content" name="processing_memo" 
								placeholder="처리 사항을 작성하세요(100자 이내)" maxlength="100"
								required>${orderReturn.processing_memo}</textarea>
							</td>
						</tr>
					</table>
				
				</form>
				
				<div class="item-detail-btn"
					style="display: flex; justify-content: center;">
					<button class="buy" onclick="submitForm()">저장</button>
					<button class="buy" 
					onclick="location.href='${path }/admin/order/return/list.do'">
						취소
					</button>
					<form id="deleteForm" method="post" action="${path}/admin/order/return/detail/delete.do">
						<input type="hidden" name="application_number" value="${orderReturn.application_number }">
						<button class="buy" type="button" onclick="submitDeleteForm()">삭제</button>
					</form>
				</div>
				
			</div>
		</div>
		<script>
			const label = document.querySelector('.dropdown-toggle');
			const options = document.querySelectorAll('.dropdown-item');
			
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
	</script>
	<script> 
		function selectValue(selected, status){
			document.getElementById(selected).value = status;
		}
		
		function submitForm(){
			document.getElementById('statusForm').submit();
		}
		
		function resetForm(){
			document.getElementById('statusForm').reset();
		}
		
		function submitDeleteForm(){
			if(confirm("삭제시키겠습니까?")){
				document.getElementById('deleteForm').submit();
			}else{
				return false;
			}
		}
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>