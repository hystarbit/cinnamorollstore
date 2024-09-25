<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<form id="writeBoardForm" class="order-user-info" method="post"
					action="${path}/customer/board/edit.do">
		<input type="hidden" name="board_number" value="${board.board_number }">
		<div class="item-info">
			<h2><input type="text" maxlength="30" placeholder="제목을 입력하세요(30자 이내)" 
			name="title" value="${board.title }" required></h2>
			<hr>
			<div style="height:400px;">
				<textarea maxlength="1000" name="content"
				placeholder="내용을 입력하세요(1000자 이내)"
				style="resize:none; height:400px; width:980px;" >${board.content}</textarea>
			</div>
			<br>
			<br>
			<div class="product-exposure"></div>
			<div class="item-detail-btn"
				style="display: flex; justify-content: center;">
				<button class="buy" type="submit">수정</button>
				<button class="buy" type="button" onclick="cancelForm()">취소</button>
			</div>
		</div>
		</form>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
	<script>
		function registForm(){
			document.getElementById('editBoardForm').submit();
		}
		
		function cancelForm(){
			if(confirm("취소하시겠습니까?")){
				window.location.href='${path}/customer/boardList.do';
			}
		}
	</script>
</body>

</html>