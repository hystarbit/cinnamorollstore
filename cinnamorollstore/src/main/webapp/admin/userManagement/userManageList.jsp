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
</head>

<body>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-after.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<div class="mypage-main">
			<%@ include file="userBar.jsp"%>
			<div class="item-info">
				<h2>회원 리스트</h2>
				<hr>
				<form class="order-period" method="post" action="">
					<span>&nbsp;&nbsp;키워드 검색</span> 
					<input type="hidden" id="searchField" name="searchField"
						value="name" />
					<div class="dropdown">
						<button class="order-button dropdown-toggle" id="user-keyword"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<c:choose>
								<c:when test="${searchField == 'name' }">
									이름
								</c:when>
								<c:when test="${searchField == 'user_id' }">
									아이디
								</c:when>
								<c:otherwise>
									이름
								</c:otherwise>
							</c:choose>
						</button>
						<ul class="dropdown-menu" style="min-width: 50px;">
							<li><a class="dropdown-item order user-info" href="#"
								onclick="selectSearchField('name')">이름</a></li>
							<li><a class="dropdown-item order user-info" href="#"
								onclick="selectSearchField('user_id')">아이디</a></li>
						</ul>
					</div>
					<input type="search" aria-label="Search" name="searchWord" value="${searchWord }">
					<button type="submit" class="order-check">검색</button>
				</form>
				
				<div class="text-right">
					<span>${totalCount}건의 검색 걸과가 있습니다.</span>
				</div>
				<table class="order-info">
					<colgroup>
						<col width="7%" />
						<col width="7%" />
						<col width="21%" />
						<col width="10%" />
						<col width="25%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<tr class="order-info-top">
						<th>선택</th>
						<th>번호</th>
						<th>가입일</th>
						<th>이름</th>
						<th>아이디</th>
						<th>회원 등급</th>
						<th>구매 금액</th>
					</tr>
					<c:forEach items="${users }" var = "user" varStatus="status">
					<tr>

						<td><input type="checkbox" class="roundcheckbox"></td>
						<td>${totalCount - (currentPage-1)*pageSize- status.index}</td>
						<td>${user.regdate }</td>
						<td><a href="${path }/admin/user/detail.do?user_id=${user.user_id}">${user.name }</a></td>
						<td><a href="${path }/admin/user/detail.do?user_id=${user.user_id}">${user.user_id }</a></td>
						<td>${user.grade }</td>
						<td>${user.total_order_price}원</td>

					</tr>
					</c:forEach>
					
				</table>
				<div class="items-title" style="font-size: 14px;">
					<button type="button" class="order-check" style="width: auto;"
						onclick="submitForm()">선택 탈퇴</button>
				</div>
				<form id="userActionForm" method="post" action="${path}/admin/user/delete2.do">
					<input type="hidden" name="selectedUsers" id="selectedUsers" value="">
				</form>
				<hr>
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${currentPage > 1 }">
								<!-- 처음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/user/list.do?pageNum=1
									&searchField=${searchField}&searchWord=${searchWord}"> 처음 </a></li>

								<!-- 이전 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/user/list.do?pageNum=${currentPage-1}
									&searchField=${searchField}&searchWord=${searchWord}">
										이전 </a></li>
							</c:if>

							<!--  페이지 번호 -->
							<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
								<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
									<a class="page-link"
									href="${path }/admin/user/list.do?pageNum=${pageNum}
									&searchField=${searchField}&searchWord=${searchWord}">
										${pageNum } </a>
								</li>
							</c:forEach>


							<c:if test="${currentPage < totalPages}">
								<!-- 다음 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/user/list.do?pageNum=${currentPage + 1}
									&searchField=${searchField}&searchWord=${searchWord}">
										다음 </a></li>


								<!-- 마지막 페이지 이동 -->
								<li class="page-item"><a class="page-link"
									href="${path }/admin/user/list.do?pageNum=${totalPages}
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
		toggling('#user-keyword', '.user-info');
	
	</script>
	<script>
		function submitForm(){
			const selectedUsers = [];
			document.querySelectorAll('.roundcheckbox:checked').forEach((checkbox) =>{
				const userID = checkbox.closest('tr').querySelector('td:nth-child(5)').innerText.trim();
				selectedUsers.push(userID);
			})
			
			if(selectedUsers.length == 0){
				alert('탈퇴시킬 회원을 선택하세요.');
				return;
			}
			
			if(confirm("탈퇴시키겠습니까?")){
				document.getElementById('selectedUsers').value=selectedUsers.join(',');
				document.getElementById('userActionForm').submit();
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