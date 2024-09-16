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
				<h2>교환/환불 신청 리스트</h2>
				<hr>
				<form class="order-period" method="post">
					<span>신청일</span> <input type="date" name="period-start" /> <span>~</span>
					<input type="date" name="period-end" /> <span>&nbsp;&nbsp;키워드
						검색</span>
					<div class="dropdown">
						<button class="order-button dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">신청자</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li><a class="dropdown-item" href="#">주문번호</a></li>
							<li><a class="dropdown-item" href="#">신청자ID</a></li>
							<li><a class="dropdown-item" href="#">신청자명</a></li>
						</ul>
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
					<input type="search" aria-label="Search">
					<button type="button" class="order-check" onclick="">검색</button>
				</form>

				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button
							class="nav-link ${activeTab == 'beforeReturn' ? 'active' : ''}"
							id="before-tab" data-bs-toggle="tab"
							data-bs-target="#before-tab-pane" type="button" role="tab"
							aria-controls="before-tab-pane" aria-selected="true"
							onclick="location.href='${path}/admin/order/return/list.do?tab=beforeReturn&pageNum=1'">
							처리 전</button>
					</li>
					<li class="nav-item" role="presentation">
						<button
							class="nav-link ${activeTab == 'afterReturn' ? 'active' : ''}"
							id="after-tab" data-bs-toggle="tab"
							data-bs-target="#after-tab-pane" type="button" role="tab"
							aria-controls="after-tab-pane" aria-selected="false"
							onclick="location.href='${path}/admin/order/return/list.do?tab=afterReturn&pageNum=1'">
							처리 완료</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="before-tab-pane"
						role="tabpanel" aria-labelledby="before-tab" tabindex="0">
						<%-- 						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="30%" />
								<col width="15%" />
								<col width="12.5%" />
								<col width="12.5%" />
							</colgroup>
							<c:if test="${not empty orderReturns}">
								<tr class="order-info-top">
									<th>선택</th>
									<th>번호</th>
									<th>신청일</th>
									<th>접수 번호</th>
									<th>주문 상품</th>
									<th>신청자</th>
									<th>교환/환불</th>
									<th>처리 상태</th>
								</tr>
							</c:if>
							<c:set var="totalCount" value="${fn:length(orderReturns)}" />
							<c:forEach items="${orderReturns }" var="orderReturn"
								varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td><fmt:formatDate
											value="${orderReturn.application_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a
										href="${path }/admin/order/return/detail.do?application_number=${orderReturn.application_number}">
											${orderReturn.application_number} </a></td>
									<td><a
										href="${path }/itemDetail.do?item_number=${orderReturn.item_number}">
											${orderReturn.item_name} </a></td>
									<td>${orderReturn.user_name}<br>(${orderReturn.user_id})
									</td>
									<td>${orderReturn.return_type}</td>
									<td>${orderReturn.order_return_status}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="items-title" style="font-size: 14px;">
							<button type="button" class="order-check" style="width: auto;"
								onclick="submitForm()">선택 항목 처리 완료 리스트로 이동</button>
						</div> --%>
					</div>
					<div class="tab-pane fade" id="after-tab-pane" role="tabpanel"
						aria-labelledby="after-tab" tabindex="0">
						<%-- 						<table class="order-info">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="30%" />
								<col width="15%" />
								<col width="12.5%" />
								<col width="12.5%" />
							</colgroup>
							<c:if test="${not empty afterReturnOrders}">
								<tr class="order-info-top">
									<th>선택</th>
									<th>번호</th>
									<th>신청일</th>
									<th>접수 번호</th>
									<th>주문 상품</th>
									<th>신청자</th>
									<th>교환/환불</th>
									<th>처리 상태</th>
								</tr>
							</c:if>
							<c:set var="totalCount" value="${fn:length(afterReturnOrders)}" />
							<c:forEach items="${afterReturnOrders }" var="afterReturnOrder"
								varStatus="status">
								<tr>
									<td><input type="checkbox" class="roundcheckbox"></td>
									<td>${totalCount - status.index }</td>
									<td><fmt:formatDate
											value="${afterReturnOrder.application_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a
										href="${path }/admin/order/return/detail.do?application_number=${afterReturnOrder.application_number}">
											${afterReturnOrder.application_number} </a></td>
									<td><a
										href="${path }/itemDetail.do?item_number=${afterReturnOrder.item_number}">
											${afterReturnOrder.item_name} </a></td>
									<td>${afterReturnOrder.user_name}<br>(${afterReturnOrder.user_id})
									</td>
									<td>${afterReturnOrder.return_type}</td>
									<td>${afterReturnOrder.order_return_status}</td>
								</tr>
							</c:forEach>
						</table> --%>
					</div>
				</div>
				<table class="order-info">
					<colgroup>
						<col width="5%" />
						<col width="5%" />
						<col width="10%" />
						<col width="10%" />
						<col width="30%" />
						<col width="15%" />
						<col width="12.5%" />
						<col width="12.5%" />
					</colgroup>
					<c:if test="${not empty orderReturns}">
						<tr class="order-info-top">
							<th>선택</th>
							<th>번호</th>
							<th>신청일</th>
							<th>접수 번호</th>
							<th>주문 상품</th>
							<th>신청자</th>
							<th>교환/환불</th>
							<th>처리 상태</th>
						</tr>
					</c:if>
					<c:forEach items="${orderReturns }" var="orderReturn"
						varStatus="status">
						<tr>
							<td><input type="checkbox" class="roundcheckbox"></td>
							<td>${totalCount - (currentPage-1)*pageSize-status.index }</td>
							<td><fmt:formatDate
									value="${orderReturn.application_date}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><a
								href="${path }/admin/order/return/detail.do?application_number=${orderReturn.application_number}">
									${orderReturn.application_number} </a></td>
							<td><a
								href="${path }/itemDetail.do?item_number=${orderReturn.item_number}">
									${orderReturn.item_name} </a></td>
							<td>${orderReturn.user_name}<br>(${orderReturn.user_id})
							</td>
							<td>${orderReturn.return_type}</td>
							<td>${orderReturn.order_return_status}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="items-title" style="font-size: 14px;">
					<button type="button" class="order-check" style="width: auto;"
						onclick="submitForm()">선택 항목 처리 완료 리스트로 이동</button>
				</div>
				<form id="orderReturnActionForm" method="post"
					action="${path}/admin/order/return/list/edit.do">
					<input type="hidden" id="selectedOrderReturnStatus"
						name="order_return_status" value="처리 완료"> <input
						type="hidden" name="selectedOrderReturns"
						id="selectedOrderReturns" value="">
				</form>

				<hr>
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${currentPage > 1 }">
								<!-- 처음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/return/list.do?tab=${activeTab }&pageNum=1">
										처음 </a></li>

								<!-- 이전 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/return/list.do?tab=${activeTab }&pageNum=${currentPage-1}">
										이전 </a></li>
							</c:if>

							<!--  페이지 번호 -->
							<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
								<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
									<a class="page-link"
									href="${path }/admin/order/return/list.do?tab=${activeTab }&pageNum=${pageNum}">
										${pageNum } </a>
								</li>
							</c:forEach>


							<c:if test="${currentPage < totalPages}">
								<!-- 다음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/return/list.do?tab=${activeTab }&pageNum=${currentPage + 1}">
										다음 </a></li>


								<!-- 마지막 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/return/list.do?tab=${activeTab }&pageNum=${totalPages}">
										마지막 </a></li>
							</c:if>
						</ul>
					</nav>
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
		function submitForm(){
			const selectedOrderReturns = [];
			document.querySelectorAll('.roundcheckbox:checked').forEach((checkbox) =>{
				const applicationNumber = checkbox.closest('tr').querySelector('td:nth-child(4)').innerText.trim();
				selectedOrderReturns.push(applicationNumber);
			})
			
			if(selectedOrderReturns.length == 0){
				alert('처리 상태를 변경할 항목을 선택하세요.');
				return;
			}
			
			document.getElementById('selectedOrderReturns').value=selectedOrderReturns.join(',');
			document.getElementById('orderReturnActionForm').submit();
		}
		
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>