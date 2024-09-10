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
						<button class="nav-link active" id="before-tab"
							data-bs-toggle="tab" data-bs-target="#before-tab-pane"
							type="button" role="tab" aria-controls="before-tab-pane"
							aria-selected="true">처리 전</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="after-tab" data-bs-toggle="tab"
							data-bs-target="#after-tab-pane" type="button" role="tab"
							aria-controls="after-tab-pane" aria-selected="false">처리
							후</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="before-tab-pane"
						role="tabpanel" aria-labelledby="before-tab" tabindex="0"></div>
					<div class="tab-pane fade" id="after-tab-pane" role="tabpanel"
						aria-labelledby="after-tab" tabindex="0"></div>
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
					<tr>
						<td><input type="checkbox" id="roundcheckbox"></td>
						<td>5</td>
						<td>2024-08-21 12:10:35</td>
						<td><a href="orderReturnDetail.jsp"> 2408218973 </a></td>
						<td><a href="../../user/itemInfo/itemDetail.jsp"> 시나모롤 대형
								인형 100cm </a></td>
						<td>구로미<br>(mymelody)
						</td>
						<td>교환</td>
						<td>처리 전</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="roundcheckbox"></td>
						<td>4</td>
						<td>2024-08-19 17:24:18</td>
						<td><a href="orderReturnDetail.jsp"> 2408191327 </a></td>
						<td><a href="../../user/itemInfo/itemDetail.jsp"> 시나모롤 대형
								인형 70cm </a></td>
						<td>우하나<br>(cappuchino627)
						</td>
						<td>환불</td>
						<td>처리 전</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="roundcheckbox"></td>
						<td>3</td>
						<td>2024-08-18 21:43:33</td>
						<td><a href="orderReturnDetail.jsp"> 1234567833 </a></td>
						<td><a href="../../user/itemInfo/itemDetail.jsp"> 시나모롤 대형
								인형 90cm </a></td>
						<td>한교동<br>(milkwhite)
						</td>
						<td>환불</td>
						<td>처리 전</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="roundcheckbox"></td>
						<td>2</td>
						<td>2024-08-17 07:50:25</td>
						<td><a href="orderReturnDetail.jsp"> 1234567822 </a></td>
						<td><a href="../../user/itemInfo/itemDetail.jsp"> 시나모롤 대형
								인형 100cm </a></td>
						<td>강목하<br>(espresso11)
						</td>
						<td>교환</td>
						<td>처리 전</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="roundcheckbox"></td>
						<td>1</td>
						<td>2024-08-16 18:59:06</td>
						<td><a href="orderReturnDetail.jsp"> 1234567801 </a></td>
						<td><a href="../../user/itemInfo/itemDetail.jsp"> 시나모롤 대형
								인형 80cm </a></td>
						<td>이시본<br>(mocha77)
						</td>
						<td>환불</td>
						<td>처리 전</td>
					</tr>
				</table>
				<div class="items-title" style="font-size: 14px;">
					<button type="button" class="order-check" style="width: auto;"
						onclick="">선택 항목 처리 완료 리스트로 이동</button>
					<button type="button" class="order-check" style="width: auto;"
						onclick="">리스트 다운로드</button>
				</div>

				<hr>
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">처음</a></li>
							<li class="page-item"><a class="page-link" href="#">이전</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">다음</a></li>
							<li class="page-item"><a class="page-link" href="#">마지막</a></li>
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
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>