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
				<h2>주문 취소</h2>
				<hr>
				<form class="order-period" method="post" action="">
					<span>주문 기간</span> 
					<input type="date" name="period_start" value="${period_start }"/> 
					<span>~</span>
					<input type="date" name="period_end" value="${period_end }"/> 
					<span>&nbsp;&nbsp;키워드 검색</span>
					<input type="hidden" id="searchField" name="searchField" value="order_number"/>
					<div class="dropdown">
						<button class="order-button dropdown-toggle" id="keyword"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<c:choose>
								<c:when test="${searchField == 'order_number' }">
									주문 번호
								</c:when>
								<c:when test="${searchField == 'user_id' }">
									주문자 아이디
								</c:when>
								<c:when test="${searchField == 'name' }">
									주문자 이름
								</c:when>
								<c:otherwise>
									주문 번호
								</c:otherwise>
							</c:choose>
						</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li>
								<a class="dropdown-item order" href="#"
								onclick="selectSearchField('order_number')">
									주문 번호
								</a>
							</li>
							<li>
								<a class="dropdown-item order" href="#"
								onclick="selectSearchField('user_id')">
									주문자 아이디
								</a>
							</li>
							<li>
								<a class="dropdown-item order" href="#"
								onclick="selectSearchField('user_name')">
									주문자 이름
								</a>
							</li>
						</ul>
					</div>
					<input type="search" aria-label="Search" name="searchWord" value="${searchWord }">
					<button type="submit" class="order-check">검색</button>
				</form>

				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link ${activeTab == 'beforeCancel' ? 'active' : ''}" id="before-tab"
							data-bs-toggle="tab" data-bs-target="#before-tab-pane"
							type="button" role="tab" aria-controls="before-tab-pane"
							aria-selected="true"
							onclick="location.href='${path}/admin/order/cancel/list.do?tab=beforeCancel&pageNum=1'">
							결제 취소 전
						</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link ${activeTab == 'afterCancel' ? 'active' : ''}" id="after-tab" data-bs-toggle="tab"
							data-bs-target="#after-tab-pane" type="button" role="tab"
							aria-controls="after-tab-pane" aria-selected="false"
							onclick="location.href='${path}/admin/order/cancel/list.do?tab=afterCancel&pageNum=1'">
							결제 취소 완료
						</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="before-tab-pane"
						role="tabpanel" aria-labelledby="before-tab" tabindex="0">
					</div>
					<div class="tab-pane fade" id="after-tab-pane" role="tabpanel"
						aria-labelledby="after-tab" tabindex="0">
					</div>
				</div>
				<table class="order-info">
					<c:choose>
						<c:when test="${not empty orders}">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<tr class="order-info-top">
								<th>선택</th>
								<th>번호</th>
								<th>주문일</th>
								<th>주문 취소일</th>
								<th>주문 번호</th>
								<th>주문 상품</th>
								<th>주문자</th>
								<th>결재 방법</th>
								<th>결재 금액</th>
							</tr>
						</c:when>
						<c:otherwise>
							<br>
							<p>해당 항목이 존재하지 않습니다.</p>
						</c:otherwise>
					</c:choose>
					<c:forEach items="${orders }" var="order"
						varStatus="status">
						<tr>
							<td><input type="checkbox" class="roundcheckbox"></td>
							<td>${totalCount - (currentPage - 1)*pageSize - status.index }</td>
							<td><fmt:formatDate value="${order.order_date}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><fmt:formatDate
									value="${order.order_cancel_date}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><a
								href="${path }/admin/order/cancel/detail.do?order_number=${order.order_number }">
									${order.order_number } </a></td>
							<td><a
								href="${path }/admin/order/cancel/detail.do?order_number=${order.order_number }">
									${order.order_items_name } <c:if
										test="${order.order_items_count > 1 }">
											외 ${order.order_items_count - 1 }건 
										</c:if>
							</a></td>
							<td>${order.user_name }<br>(${order.user_id })
							</td>
							<td>${order.order_price }원</td>
							<td>${order.payment_status }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="items-title" style="font-size: 14px;">
					<button type="button" class="order-check" style="width: auto;"
						onclick="submitForm()">결제 취소 완료 리스트로 이동</button>
				</div>
				<form id="orderCancelActionForm" method="post"
					action="${path}/admin/order/cancel/list/edit.do">
					<input type="hidden" id="selectedOrderCancelStatus"
						name="order_cancel_status" value="결제 취소 완료"> <input
						type="hidden" name="selectedOrderCancels"
						id="selectedOrderCancels" value="">
				</form>

				<hr>
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${currentPage > 1 }">
								<!-- 처음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/cancel/list.do?tab=${activeTab }&pageNum=1
									&period_start=${period_start}&period_end=${period_end}
									&searchField=${searchField}&searchWord=${searchWord}">
										처음 </a></li>

								<!-- 이전 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/cancel/list.do?tab=${activeTab }&pageNum=${currentPage-1}
									&period_start=${period_start}&period_end=${period_end}
									&searchField=${searchField}&searchWord=${searchWord}">
										이전 </a></li>
							</c:if>

							<!--  페이지 번호 -->
							<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
								<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
									<a class="page-link"
									href="${path }/admin/order/cancel/list.do?tab=${activeTab }&pageNum=${pageNum}
									&period_start=${period_start}&period_end=${period_end}
									&searchField=${searchField}&searchWord=${searchWord}">
										${pageNum } </a>
								</li>
							</c:forEach>


							<c:if test="${currentPage < totalPages}">
								<!-- 다음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/cancel/list.do?tab=${activeTab }&pageNum=${currentPage + 1}
									&period_start=${period_start}&period_end=${period_end}
									&searchField=${searchField}&searchWord=${searchWord}">
										다음 </a></li>


								<!-- 마지막 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/order/cancel/list.do?tab=${activeTab }&pageNum=${totalPages}
									&period_start=${period_start}&period_end=${period_end}
									&searchField=${searchField}&searchWord=${searchWord}">
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
			const selectedOrderCancels = [];
			document.querySelectorAll('.roundcheckbox:checked').forEach((checkbox) =>{
				const orderNumber = checkbox.closest('tr').querySelector('td:nth-child(5)').innerText.trim();
				selectedOrderCancels.push(orderNumber);
			})
			
			if(selectedOrderCancels.length == 0){
				alert('주문 취소 상태를 변경할 항목을 선택하세요.');
				return;
			}
			
			document.getElementById('selectedOrderCancels').value=selectedOrderCancels.join(',');
			document.getElementById('orderCancelActionForm').submit();
		}
		
		function selectValue(status){
			document.getElementById('selectedOrderCancelStatus').value = status;
		}
		
		function selectSearchField(field){
			document.getElementById('searchField').value = field;
		} 
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>