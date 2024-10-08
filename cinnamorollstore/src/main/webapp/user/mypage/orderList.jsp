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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<c:if test="${param.error == 'invalidPassword' }">
		<script>
			alert('비밀번호가 일치하지 않습니다.');
		</script>
	</c:if>
	<c:if test="${param.message == 'editComplete' }">
		<script>
			alert('개인정보 수정을 완료했습니다.');
		</script>
	</c:if>
	<c:if test="${param.message == 'changeComplete' }">
		<script>
			alert('비밀번호 변경을 완료했습니다.');
		</script>
	</c:if>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<script>
    		const myModal = document.getElementById('myModal')
    		const myInput = document.getElementById('myInput')

    		myModal.addEventListener('shown.bs.modal', () => {
        		myInput.focus()
    		})
    	</script>
		<div class="mypage-main">
			<%@ include file="mypageBar.jsp"%>
			<div class="item-info">
				<h2>주문 내역</h2>
				<hr>
				<form class="order-period" method="post" action="${path}/mypage/orderList.do">
					<span>주문 기간</span> <input type="date" name="period_start" value="${period_start}" /> <span>~</span>
					<input type="date" name="period_end" value="${period_end }" />
					<button type="submit" class="order-check">조회</button>
				</form>
				<hr>
				<ul class="order-item-list" style="border: 0;">
					<c:if test="${empty orderItems}">
						주문 내역이 없습니다.
					</c:if>
					<c:forEach items="${orderItems }" var="orderItem"
						varStatus="status">
						<li class="order-item-detail"
							style="border: 1px solid darkgrey; margin-top: 20px; padding: 10px;">
							<div class="order-item-detail-top">
								<div class="order-item-detail-top-text">
									<div class="order-seq">
										<span>${(currentPage - 1) * pageSize + status.count}. </span>
									</div>
									<div class="order-date">
										<span>주문일시: </span> <span>${orderItem.order_date}</span>
									</div>
									<div class="order-number">
										<span>주문번호: </span> <span>${orderItem.order_number}</span>
									</div>
								</div>
								<div class="order-buttons">
									<%-- <c:choose>
										<c:when test="${empty orderItem.order_cancel_date }">
											<button type="button" class="order-button"
												onclick="location.href='${path }/mypage/orderDetail.do?order_number=${orderItem.order_number}'">
												주문 상세 내역
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="order-button"
												onclick="location.href='${path }/mypage/orderDetail.do?order_number=${orderItem.order_number}'">
												주문 취소 내역
										</c:otherwise>
									</c:choose> --%>
									<button type="button" class="order-button"
												onclick="location.href='${path }/mypage/orderDetail.do?order_number=${orderItem.order_number}'">
										<c:choose>
											<c:when test="${empty orderItem.order_cancel_date }">
												주문 상세 내역
											</c:when>
											<c:otherwise>
												주문 취소 내역
											</c:otherwise>
										</c:choose>
									</button>
									<c:choose>
										<c:when test="${not empty orderItem.order_cancel_date }">
										</c:when>
										<c:when
											test="${orderItem.order_status eq '주문 확인 전' || orderItem.order_status eq '주문 확인'}">
											<form id="orderCancelActionForm" method="post" action="${path }/mypage/orderCancel.do?order_number=${orderItem.order_number }">
												<button type="button" class="order-button" onclick="cancelForm()">
													주문 취소
												</button>
											</form>
										</c:when>
										<c:when test="${not empty orderItem.application_number &&  orderItem.application_number != 0}">
											<button type="button" class="order-button"
											onclick="location.href='${path }/mypage/return/detail.do?application_number=${orderItem.application_number }'">교환/환불 내역</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="order-button"
											onclick="location.href='${path }/mypage/return/request.do?order_item_number=${orderItem.order_item_number }'">교환/환불</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<hr>
							<div class="order-item-detail-middle"
								style="display: flex; justify-content: space-between">
								<div style="display: flex; justify-content: left; gap: 10px;">
									<div class="item-img">
										<img src="${path}/imgLoad.do?fileName=${orderItem.image}"
											alt="Logo" width="150px">
									</div>
									<div class="order-item-detail-infos">
										<div class="order-item-detail-category">
											<span><a
												href="${path}/itemDetail.do?item_number=${orderItem.item_number}">시나모롤
													스토어 > ${orderItem.category}</a></span>
										</div>
										<div class="order-item-detail-title">
											<span><a
												href="${path}/itemDetail.do?item_number=${orderItem.item_number}">${orderItem.name}</a></span>
										</div>
										<div class="order-item-detail-price">
											<span class="price-title">판매 가격: </span> <span>${orderItem.item_price}</span>
											<span>원</span>
										</div>
									</div>
								</div>
								<div class="order-item-detail-tables">
									<table class="order-info" style="width: 330px; height: 100px;">
										<colgroup>
											<col width="110px" />
											<col width="110px" />
											<col width="110px" />
										</colgroup>
										<tr class="order-info-top">
											<th>금액</th>
											<c:choose>
												<c:when test="${orderItem.order_status eq '배송 완료'}">
													<th>상품수령</th>
												</c:when>
												<c:otherwise>
													<th>결제 상태</th>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty orderItem.order_cancel_date }">
													<th>주문 취소</th>
												</c:when>
												<c:when
													test="${orderItem.order_status eq '배송 중' || orderItem.order_status eq '배송 완료'}">
													<th data-bs-toggle="modal" data-bs-target="#exampleModal${status.count}">주문/배송</th>
												</c:when>
												<c:otherwise>
													<th>주문/배송</th>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>${orderItem.item_price * orderItem.quantity + orderItem.delivery_price}</td>
											<c:choose>
												<c:when test="${orderItem.order_status eq '배송 완료'}">
													<td>상품수령완료</td>
												</c:when>
												<c:otherwise>
													<td>${orderItem.payment_status}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty orderItem.order_cancel_date }">
													<td>${orderItem.order_cancel_status}</td>
												</c:when>
												<c:when
													test="${orderItem.order_status eq '배송 중' || orderItem.order_status eq '배송 완료'}">
													<td data-bs-toggle="modal" data-bs-target="#exampleModal${status.count}">${orderItem.order_status}</td>
												</c:when>
												<c:otherwise>
													<td>${orderItem.order_status}</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</table>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<hr>
				<div class="paging">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${currentPage > 1 }">
							<!-- 처음 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/mypage/orderList.do?pageNum=1"> 
									처음 
								</a>
							</li>
						
							<!-- 이전 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/mypage/orderList.do?pageNum=${currentPage-1}">
									이전
								</a>
							</li>
							</c:if>
						
						<!--  페이지 번호 -->
						<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
							<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
								<a class="page-link" href="${path }/mypage/orderList.do?pageNum=${pageNum}">
									${pageNum }
								</a>
							</li>
						</c:forEach>
						
						
						<c:if test="${currentPage < totalPages}">
							<!-- 다음 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/mypage/orderList.do?pageNum=${currentPage + 1}">
								다음
								</a>
							</li>
						
						
							<!-- 마지막 페이지 이동 -->
							<li class="page-item">
								<a class="page-link" href="${path }/mypage/orderList.do?pageNum=${totalPages}"> 
									마지막 
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
			</div>
			<c:forEach items="${orderItems }" var="orderItem"
						varStatus="status">
			<!-- Modal -->
			<div class="modal fade" id="exampleModal${status.count}" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">배송 조회</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="order-item-detail-tables">
								<table class="order-info" style="width: 450px; height: 50px;">
									<colgroup>
										<col width="40%" />
										<col width="60%" />
									</colgroup>
									<tr class="order-info-top">
										<th>택배사</th>
										<th>송정번호</th>
									</tr>
									<tr>
										<td>${orderItem.delivery_company}</td>
										<td>${orderItem.delivery_number}</td>
									</tr>
								</table>
							</div>
							<br>
							<%-- <h3 class="delivery-status-title">배송상황</h3>
                    <div class="order-item-detail-tables">
                        <table class="order-info" style="width:450px;">
                            <colgroup>
                                <col width="20%" />
                                <col width="20%" />
                                <col width="20%" />
                                <col width="20%" />
                                <col width="20%" />
                            </colgroup>
                            <tr class="order-info-top">
                                <th>날짜</th>
                                <th>위치</th>
                                <th>배송상태</th>
                                <th>연락처</th>
                                <th>기타정보</th>
                            </tr>
                            <tr>
                                <td>2024-08-18 22:22</td>
                                <td>경기터미널</td>
                                <td>집하</td>
                                <td>1234-5678</td>
                                <td></td>
                            </tr>
                        </table>
                    	</div> --%>
						</div>
						<div class="modal-footer">
							<button type="button" class="order-button"
								data-bs-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<script>
		function cancelForm(){
			if(confirm("주문취소시키겠습니까?")){
				document.getElementById('orderCancelActionForm').submit();
			}else{
				return false;
			}
		}
		</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>