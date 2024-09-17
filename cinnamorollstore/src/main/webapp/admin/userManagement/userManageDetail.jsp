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
<script>
	// 주소, 휴대전화, 이메일 정규식으로 확인하기 
	function validateForm(form){
		var addressPattern = /^[a-zA-Z가-힣\s]{10,100}$/;
		var phonePattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/ ;
		var emailPattern = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		
		if(!emailPattern.test(form.email.value)){
			alert("올바른 이메일 주소를 입력해주세요.");
			form.email.focus();
			return false;
		}
		
		if(!phonePattern.test(form.phone.value)){
			alert("올바른 휴대전화 형식을 입력해주세요.");
			form.phone.focus();
			return false;
		}
		
		if(!addressPattern.test(form.address.value)){
			alert("주소는 10~100자로 입력해야 합니다.");
			form.address.focus()
			return false;
		}
		return true;
	}
</script>
</head>

<body>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-after.jsp"%>
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
			<%@ include file="userBar.jsp"%>
			<div class="item-info">
				<h2>회원 정보 상세 보기</h2>
				<h3>가입 정보</h3>
				<form class="order-user-info" method="post"
					action="${path}/admin/user/detail.do"
					onsubmit="return validateForm(this)">
					<input type="hidden" id="user_id" name="user_id"
						value="${user.user_id }"> <input type="hidden"
						id="selectedGrade" name="grade" value="${user.grade }">

					<div class="order-user-info">
						<table class="order-info-table">
							<colgroup>
								<col width="20%" style="background-color: #71BFEC;" />
								<col width="80%" />
							</colgroup>
							<tr>
								<td class="table-left">이름</td>
								<td class="table-right">${user.name }</td>
							</tr>
							<tr>
								<td class="table-left">아이디</td>
								<td class="table-right">${user.user_id }</td>
							</tr>
							<tr>
								<td class="table-left">비밀번호</td>
								<td class="table-right">${user.password }</td>
							</tr>
							<tr>
								<td class="table-left">이메일</td>
								<td class="table-right"><input type="text" name="email"
									value="${user.email }" style="width: 300px;"></td>
							</tr>
							<tr>
								<td class="table-left">연락처</td>
								<td class="table-right"><input type="text" name="phone"
									value="${user.phone }" placeholder="- 없이 입력해주세요."
									style="width: 200px;"></td>
							</tr>
							<tr>
								<td class="table-left">주소</td>
								<td class="table-right"><input type="text" name="address"
									value="${user.address }" style="width: 300px;"></td>
							</tr>
							<tr>
								<td class="table-left">동의 내역</td>
								<td class="table-right"><span>서비스 이용 약관: </span> <span>동의</span>
									<br> <span>개인정보 처리방침: </span> <span>동의</span> <br> <span>개인정보
										위탁: </span> <span>동의</span> <br> <span>마케팅 정보 제공 동의: </span> <span>동의</span>
								</td>
							</tr>
						</table>
						<br>
					</div>

					<div class="order-payment-info">
						<h3>이용/운영 정보</h3>
						<div class="order-payment-method-amount">
							<table class="order-info-table">
								<colgroup>
									<col width="20%" style="background-color: #71BFEC;" />
									<col width="30%" />
									<col width="20%" style="background-color: #71BFEC;" />
									<col width="30%" />
								</colgroup>
								<tr>
									<td class="table-left">가입일</td>
									<td class="table-right"><fmt:formatDate
											value="${user.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="table-left border-all">회원등급</td>
									<td class="table-right">
										<button class="order-button dropdown-toggle" type="button"
											data-bs-toggle="dropdown" aria-expanded="false">${user.grade }
										</button>
										<ul class="dropdown-menu" style="min-width: 50px;">
											<li><a class="dropdown-item" href="#"
												onclick="selectGrade('일반회원')">일반회원</a></li>
											<li><a class="dropdown-item" href="#"
												onclick="selectGrade('관리자')">관리자</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="table-left">총 구매 금액</td>
									<td class="table-right" colspan="3">${user.total_order_price }원
										<button type="button" class="order-button"
											data-bs-toggle="modal" data-bs-target="#exampleModal2">구매
											내역 보기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="item-detail-btn"
						style="display: flex; justify-content: space-between;">
						<button type="button" class="buy" onclick="submitForm()">
							회원 탈퇴</button>
						<div>
							<button type="submit" class="buy">수정</button>
							<button type="reset" class="buy">취소</button>
						</div>
						<button class="buy"
							onclick="local.href='${path}/admin/user/list.do'">목록 보기
						</button>
					</div>
				</form>
				<form id="userActionForm" method="post"
					action="${path}/admin/user/delete1.do">
					<input type="hidden" name="selectedUser" id="selectedUser"
						value="${user.user_id }">
				</form>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal2" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">구매 내역</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<h4>계정: ${user.user_id }</h4>
							<div class="order-item-detail-tables">
								<table class="order-info" style="width: 450px; height: 50px;">
									<colgroup>
										<col width="10%" />
										<col width="30%" />
										<col width="40%" />
										<col width="20%" />
									</colgroup>
									<tr class="order-info-top">
										<th>번호</th>
										<th>주문일</th>
										<th>주문 상품</th>
										<th>결제 금액</th>
									</tr>
									<c:set var="totalCount" value="${fn:length(orders)}" />
									<c:forEach items="${orders }" var="order" varStatus="status">
										<tr>
											<td>${totalCount-status.index }</td>
											<td>${order.order_date }</td>
											<td>
												<a href="${path }/admin/order/detail.do?order_number=${order.order_number }">
													${order.order_items_name } 
												<c:if test="${order.order_items_count > 1 }">
													외 ${order.order_items_count - 1 }건 
												</c:if>
												</a>
											</td>
											<td>${order.order_price }원</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="order-button"
								data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
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
		function selectGrade(grade) {
        	document.getElementById('selectedGrade').value = grade;
    	}
	</script>
		<script>
		function submitForm(){
			if(confirm("탈퇴시키겠습니까?")){
				document.getElementById('userActionForm').submit();
			}
		}
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>