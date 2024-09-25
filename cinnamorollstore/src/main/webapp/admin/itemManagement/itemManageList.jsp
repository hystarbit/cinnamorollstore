<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<c:if test="${param.message == 'regist' }">
		<script>
			alert("상품 등록되었습니다.");
		</script>
	</c:if>
	<c:if test="${param.message == 'edit' }">
		<script>
			alert("상품 수정되었습니다.");
		</script>
	</c:if>
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
					<input type="hidden" id="searchField" name="searchField"
						value="name" />
					<div class="dropdown">
						<button class="order-button dropdown-toggle" id="item-keyword"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<c:choose>
								<c:when test="${searchField == 'name' }">
									상품명
								</c:when>
								<c:when test="${searchField == 'item_number' }">
									등록ID
								</c:when>
								<c:otherwise>
									상품명
								</c:otherwise>
							</c:choose>
						</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li>
								<a class="dropdown-item item-keyword-info" href="#"
								onclick="selectSearchField('name')">
									상품명
								</a>
							</li>
							<li>
								<a class="dropdown-item item-keyword-info" href="#"
								onclick="selectSearchField('item_number')">
									등록ID
								</a>
							</li>
						</ul>
					</div>
					<input type="search" aria-label="Search" name="searchWord" value="${searchWord }">
					<button type="submit" class="order-check">검색</button>
				</form>
				<div class="text-right">
					<span>검색된 상품: ${totalCount}개</span>
				</div>
				<c:if test="${empty items }">
					<span>검색된 상품이 없습니다.</span>
				</c:if>
				<table class="order-info">
					<c:if test="${not empty items }">
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
					</c:if>
					<c:forEach items="${items }" var="item">
						<tr>
							<td><input type="checkbox" class="roundcheckbox"></td>
							<td>${item.item_number}</td>
							<td>${item.category}</td>
							<td><a
								href="${path}/itemDetail.do?item_number=${item.item_number}">
									${item.name} </a></td>
							<td>${item.sale_price}원</td>
							<td>${item.exposure}</td>
							<td>${item.regdate}</td>
							<td>${item.seller_id}</td>
							<td>
								<button type="button" class="order-button edit"
									style="font-size: 14px;"
									onclick="location.href='${path}/admin/item/edit.do?item_number=${item.item_number}'">수정</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${not empty items }">
				<div class="items-title" style="font-size: 14px;">
					<div>
						<button type="button" class="order-check" style="width: auto;"
							onclick="submitForm()">삭제</button>
					</div>
				</div>
				</c:if>

				<form id="itemActionForm" method="post"
					action="${path}/admin/item/delete.do">
					<input type="hidden" name="selectedItems" id="selectedItems"
						value="">
				</form>
				<hr>
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${currentPage > 1 }">
								<!-- 처음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/item/list.do?pageNum=1
									&searchField=${searchField}&searchWord=${searchWord}"> 
									처음 </a></li>

								<!-- 이전 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/item/list.do?pageNum=${currentPage-1}
									&searchField=${searchField}&searchWord=${searchWord}">
										이전 </a></li>
							</c:if>

							<!--  페이지 번호 -->
							<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
								<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
									<a class="page-link"
									href="${path }/admin/item/list.do?pageNum=${pageNum}
									&searchField=${searchField}&searchWord=${searchWord}">
										${pageNum } </a>
								</li>
							</c:forEach>


							<c:if test="${currentPage < totalPages}">
								<!-- 다음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/item/list.do?pageNum=${currentPage + 1}
									&searchField=${searchField}&searchWord=${searchWord}">
										다음 </a></li>


								<!-- 마지막 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/item/list.do?pageNum=${totalPages}
									&searchField=${searchField}&searchWord=${searchWord}">
										마지막 </a></li>
							</c:if>
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
				alert('삭제할 상품을 선택하세요.');
				return;
			}
			
			if(confirm("삭제하시겠습니까?")){
				document.getElementById('selectedItems').value=selectedItems.join(',');
				document.getElementById('itemActionForm').submit();
			}
			
		}
		
		function selectSearchField(field){
			document.getElementById('searchField').value = field;
		}
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>