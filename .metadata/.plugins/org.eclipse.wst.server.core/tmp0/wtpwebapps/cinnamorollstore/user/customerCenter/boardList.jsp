<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/main.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<c:if test="${param.error == 'nonEqual' }">
		<script>
			alert("해당 게시글을 작성한 사람만 볼 수 있습니다.");
		</script>
	</c:if>
	<c:if test="${param.message == 'write' }">
		<script>
			alert("게시글 등록되었습니다.");
		</script>
	</c:if>
	<c:if test="${param.message == 'edit' }">
		<script>
			alert("게시글 수정되었습니다.");
		</script>
	</c:if>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<div class="item-info">
			<h2>고객 게시판</h2>
			<hr>
			<form class="order-period" method="post">
				<span>&nbsp;&nbsp;키워드 검색</span> <input type="hidden"
					id="searchField" name="searchField" value="title" />

				<div class="dropdown">
					<button class="order-button dropdown-toggle" id="board-keyword"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<c:choose>
							<c:when test="${searchField == 'title' }">
									제목
								</c:when>
							<c:when test="${searchField == 'content' }">
									내용
								</c:when>
							<c:otherwise>
									제목
								</c:otherwise>
						</c:choose>
					</button>
					<ul class="dropdown-menu" style="min-width: 50px;">
						<li><a class="dropdown-item board-keyword-info" href="#"
							onclick="selectSearchField('title')"> 제목 </a></li>
						<li><a class="dropdown-item board-keyword-info" href="#"
							onclick="selectSearchField('content')"> 내용 </a></li>
					</ul>
				</div>
				<input type="search" aria-label="Search" name="searchWord"
					value="${searchWord }">
				<button type="submit" class="order-check">검색</button>
			</form>
			<div class="text-right">
				<span>검색된 게시물: ${totalCount}개</span>
			</div>
			<c:if test="${empty boards }">
				<span>검색된 게시글이 없습니다.</span>
			</c:if>
			<table class="order-info">
				<c:if test="${not empty boards }">
					<colgroup>
						<col width="10%" />
						<col width="50%" />
						<col width="15%" />
						<col width="15%" />
						<col width="10%" />
					</colgroup>
					<tr class="order-info-top">
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>방문수</th>
					</tr>
				</c:if>
				<c:forEach items="${boards }" var="board">
					<tr>
						<td>${board.board_number}</td>
						<td><c:choose>
								<c:when
									test="${sessionScope.user.grade == '관리자' || 
								sessionScope.user.user_id == board.user_id}">
									<a href="${path}/customer/board.do?board_number=${board.board_number}">
										${board.title}
									</a>
								</c:when>
								<c:otherwise>
									${board.title}🔒
								</c:otherwise>
							</c:choose></td>
						<td>${board.user_name}</td>
						<td>
							<fmt:formatDate value="${board.postdate}"
								pattern="yyyy-MM-dd" />
						</td>
						<td>${board.visitcount}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="item-detail-btn"
				style="display: flex; justify-content: right;">
				<button class="order-button"
					onclick="location.href='${path}/customer/board/write.do'">글 작성하기</button>
			</div>
			<hr>
			<div class="paging">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${currentPage > 1 }">
							<!-- 처음 페이지 이동 -->
							<li class="page-item"><a class="page-link"
								href="${path }/customer/boardList.do?pageNum=1
									&searchField=${searchField}&searchWord=${searchWord}">
									처음 </a></li>

							<!-- 이전 페이지 이동 -->
							<li class="page-item"><a class="page-link"
								href="${path }/customer/boardList.do?pageNum=${currentPage-1}
									&searchField=${searchField}&searchWord=${searchWord}">
									이전 </a></li>
						</c:if>

						<!--  페이지 번호 -->
						<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
							<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
								<a class="page-link"
								href="${path }/customer/boardList.do?pageNum=${pageNum}
									&searchField=${searchField}&searchWord=${searchWord}">
									${pageNum } </a>
							</li>
						</c:forEach>


						<c:if test="${currentPage < totalPages}">
							<!-- 다음 페이지 이동 -->
							<li class="page-item"><a class="page-link"
								href="${path }/customer/boardList.do?pageNum=${currentPage + 1}
									&searchField=${searchField}&searchWord=${searchWord}">
									다음 </a></li>


							<!-- 마지막 페이지 이동 -->
							<li class="page-item"><a class="page-link"
								href="${path }/customer/boardList.do?pageNum=${totalPages}
									&searchField=${searchField}&searchWord=${searchWord}">
									마지막 </a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous">
		</script>
		<script>
		function toggling(toggle, item){
			const label = document.querySelector(toggle);
			const options = document.querySelectorAll(item);
			
			const handleSelect = (item) => {
				label.parentNode.classList.remove('active');
				label.innerHTML = item.textContent;
			};
			// 옵션 클릭시 클릭한 옵션을 넘김
			options.forEach(option => {
				option.addEventListener('click', () => handleSelect(option));
			});

			// 라벨을 클릭시 옵션 목록이 열림/닫힘
			label.addEventListener('click', () => {
			  if(label.parentNode.classList.contains('active')) {
			  	label.parentNode.classList.remove('active');
			  } else {
			  	label.parentNode.classList.add('active');
			  }
			});
		}
		toggling('#board-keyword', '.board-keyword-info');
	
		</script>
		<script>
		
		function selectSearchField(field){
			document.getElementById('searchField').value = field;
		}
	</script>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>