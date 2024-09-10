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

				<div class="order-item-detail-top">
					<div class="order-item-detail-top-text">
						<div class="order-date">
							<span>접수일: </span> <span>2024-08-18 22:22:22</span>
						</div>
						<div class="order-number">
							<span>처리 완료일: </span> <span>-</span>
						</div>
					</div>
					<div class="order-buttons">
						<span>처리 상태: </span> <span>
							<div class="dropdown">
								<button class="order-button dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">처리 전</button>
								<ul class="dropdown-menu" style="min-width: 50px;">
									<li><a class="dropdown-item" href="#">처리 전</a></li>
									<li><a class="dropdown-item" href="#">처리 완료</a></li>
								</ul>
							</div>
						</span>
					</div>
				</div>

				<form class="order-user-info" method="post">
					<table class="order-info-table">
						<colgroup>
							<col width="20%" style="background-color: #71BFEC;" />
							<col width="80%" />
						</colgroup>
						<tr>
							<th class="table-left">접수 번호</th>
							<td class="table-right">{접수 번호}</td>
						</tr>
						<tr>
							<th class="table-left">신청자</th>
							<td class="table-right"><span>{이름}</span> <span>({아이디}})</span>
							</td>
						</tr>
						<tr>
							<th class="table-left">휴대폰 번호</th>
							<td class="table-right">{휴대폰 번호}</td>
						</tr>
						<tr>
							<th class="table-left">상품</th>
							<td class="table-right">{상품명}</td>
						</tr>
						<tr>
							<th class="table-left">교환/환불 선택</th>
							<td class="table-right">{선택 사항 표기}</td>
						</tr>
						<tr>
							<th class="table-left">사유 선택</th>
							<td class="table-right">{사유 표기}</td>
						</tr>
						<tr>
							<th class="table-left">내용 작성</th>
							<td class="table-right"><textarea class="content"
									name="content">{입력한 내용 표기}</textarea></td>
						</tr>
						<tr>
							<th class="table-left">이미지</th>
							<td class="table-right">- 20240817_145033.png <br>
								<button type="button" class="order-button" style="width: auto;"
									onclick="">다운로드</button>
							</td>
						</tr>
						<tr>
							<th class="table-left">배송비 결제 금액</th>
							<td class="table-right">{배송비 결제 금액}원</td>
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
							<td class="table-right"><textarea class="content"
									name="content" placeholder="처리 사항을 작성하세요"></textarea></td>
						</tr>
					</table>
				</form>

				<div class="item-detail-btn"
					style="display: flex; justify-content: center;">
					<button class="buy">
						<a href="orderReturnList.html">저장</a>
					</button>
					<button class="buy">
						<a href="#">취소</a>
					</button>
					<button class="buy">
						<a href="orderReturnList.html">삭제</a>
					</button>
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
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>