<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>

<body>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-after.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<div class="mypage-main">
			<%@ include file="itemBar.jsp"%>
			<div class="item-info">
				<h2>상품 리스트</h2>
				<hr>
				<form class="order-period" method="post">
					<span>&nbsp;&nbsp;키워드 검색</span>
					<div class="dropdown">
						<button class="order-button dropdown-toggle" id="item-keyword"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">상품명</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li><a class="dropdown-item item-keyword-info" href="#">상품명</a></li>
							<li><a class="dropdown-item item-keyword-info" href="#">등록ID</a></li>
						</ul>
					</div>
					<input type="search" aria-label="Search">
					<button type="button" class="order-check" onclick="">검색</button>
				</form>

				<h3>상세 검색</h3>
				<div class="order-item-list" style="height: 134px;">
					<table style="width: 100%;">
						<colgroup>
							<col width="10%" />
							<col width="35%" />
							<col width="10%" />
							<col width="25%" />
						</colgroup>
						<tr>
							<td class="table-left black border-free">카테고리 선택</td>
							<td class="table-right border-free">
								<div class="dropdown">
									<button class="order-button dropdown-toggle"
										id="category-keyword" type="button" data-bs-toggle="dropdown"
										aria-expanded="false">카테고리 선택</button>
									<ul class="dropdown-menu" style="min-width: 50px;">
										<li><a class="dropdown-item category-keyword-info"
											href="#">문구</a></li>
										<li><a class="dropdown-item category-keyword-info"
											href="#">필기</a></li>
										<li><a class="dropdown-item category-keyword-info"
											href="#">소품</a></li>
									</ul>
								</div>
							</td>
							<td class="table-left black border-free">판매 가격</td>
							<td class="table-right border-free"><input type="text"
								name="price-start" style="width: 80px;" /> <span>원</span> <span>~</span>
								<input type="text" name="price-end" style="width: 80px;" /> <span>원</span>
							</td>
						</tr>
						<tr>
							<td class="table-left black border-free">상품 등록일</td>
							<td class="table-right border-free"><input type="date"
								name="period-start" /> <span>~</span> <input type="date"
								name="period-end" "/></td>
							<td class=" table-left black border-free">진열 여부</td>
							<td class="table-right border-free">
								<div class="product-exposure">
									<div>
										<input type="radio" id="display" name="exposure"> <label
											for="display">진열</label>
									</div>
									<div>
										<input type="radio" id="hide" name="exposure"> <label
											for="hide">숨김</label>
									</div>
									<div>
										<input type="radio" id="none" name="exposure"> <label
											for="none">품절</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="border-free" style="text-align: center;" colspan="4">
								<button class="order-check"
									style="width: auto; margin: 10px auto;">상세 검색</button>
							</td>
						</tr>
					</table>
				</div>
				<c:set var="totalCount" value="${fn:length(items)}" />
				<div class="text-right">
					<span>총 등록 상품: ${totalCount}개 / 검색된 상품: 0개</span>
				</div>
				<table class="order-info">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="25%" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<tr class="order-info-top">
						<th>선택</th>
						<th>번호</th>
						<th>카테고리</th>
						<th>상품명</th>
						<th>판매 가격</th>
						<th>상태</th>
						<th>등록일</th>
						<th>아이디</th>
						<th>수정</th>
					</tr>
					<c:forEach items="${items }" var = "item">
					<tr>
						<td><input type="checkbox" class="roundcheckbox"></td>
						<td>${item.item_number}</td>
						<td>${item.category}</td> 
						<td>
						<a href="${path}/itemDetail.do?item_number=${item.item_number}">
						${item.name} 
						</a>
						</td>
						<td>${item.sale_price}원</td>
						<td>${item.exposure}</td>
						<td>${item.regdate}</td>
						<td>${item.seller_id}</td>
						<td>
							<button type="button" class="order-button edit"
								style="font-size: 14px;" onclick="location.href='${path}/admin/item/edit.do?item_number=${item.item_number}'">수정</button>
						</td>
					</tr>
					</c:forEach>
				</table>
				<div class="items-title" style="font-size: 14px;">
					<div>
						<button type="button" class="order-check" style="width: auto;"
							onclick="submitForm()">삭제</button>
					</div>
				</div>
				
				<form id="itemActionForm" method="post" action="${path}/admin/item/delete.do">
					<input type="hidden" name="selectedItems" id="selectedItems" value="">
				</form>
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
	function toggling(toggle, item){
		const label = document.querySelector(toggle);
		const options = document.querySelectorAll(item);
		console.log(label);
		
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
	}
	toggling('#item-keyword', '.item-keyword-info');
	toggling('#category-keyword', '.category-keyword-info'); 
	
	</script>
	<script>
		function submitForm(){
			const selectedItems = [];
			document.querySelectorAll('.roundcheckbox:checked').forEach((checkbox) =>{
				const itemNumber = checkbox.closest('tr').querySelector('td:nth-child(2)').innerText.trim();
				selectedItems.push(itemNumber);
			})
			
			if(selectedItems.length == 0){
				alert('삭제할 항목을 선택하세요.');
				return;
			}
			
			document.getElementById('selectedItems').value=selectedItems.join(',');
			document.getElementById('itemActionForm').submit();
		}
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>