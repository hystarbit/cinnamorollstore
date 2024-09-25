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
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok₩6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#replyWrite").on("click",function() {
			var board_number = $("#board_number").val()
			var user_id = '${sessionScope.user.user_id}';
			var content = $("#content").val();
			var user_grade = '${sessionScope.user.grade}';

			if (!content.trim()) {
				alert("댓글 내용을 입력하세요.");
				return;
			}

			$.ajax({
				url : '${path}/customer/reply/write.do',
				type : 'post',
				dataType : 'json',
				data : {
					board_number : board_number,
					user_id : user_id,
					content : content,
				},
				success : function(response) {
					alert("댓글이 성공적으로 작성했습니다.")

					$("#reply-list").empty();
					var newReply = '';
										
					response.forEach((reply) => {
						newReply +='<li>'
						+ '<div style="font-weight:bold;">'
						+ '<span>'+reply.user_name + '('+ reply.user_id+ ')</span>'
						+ '</div>'
						+ '<div>'
						+ '<span id="replyContent_'+reply.reply_number+'">'+reply.content +'</span>'
						+ '</div>'
						+ '<div style="color:grey; font-size: 14px;">'
						+ '<span>'+reply.regdate+'</span>'
						+ '</div>';
						
						if(user_id == reply.user_id){
							newReply += '<button type="button" class="order-button replyEdit"' 
								+ 'data-reply-number="'+ reply.reply_number + '">수정</button>';
							newReply += '<button type="button" class="order-button replyConfirm" style="display: none;"' 
								+ 'data-reply-number="'+ reply.reply_number + '">확인</button>';
						}
						
						if(user_id == reply.user_id || user_grade == '관리자'){
							newReply += '<button type="button" class="order-button replyDelete"' 
								+ 'data-reply-number="'+ reply.reply_number + '">삭제</button>';
						}
						
						newReply += '</li><hr>';
					});
						
					$("#reply-list").append(newReply);
					$("#content").val(''); // 댓글 등록창 초기화 

				},
				error : function(request, status, error) {
					alert("댓글 작성 도중 오류가 발생했습니다.");
					alert("status : " + request.status
						+ ", message : "+ request.responseText
						+ ", error : " + error);

				}
			});
		});
	});
	
	$(function() {
		// 수정 버튼 클릭
		$(".replyEdit").on("click", function() {
			var replyNumber = $(this).data("reply-number");
			var contentSpan = $("#replyContent_" + replyNumber);
			// 기존 댓글 내용 가져오기
			var currentContent = contentSpan.text().trim();

			// 수정할 수 있는 textarea 생성
			contentSpan.html('<textarea id = "editContent_'+replyNumber + 
				'" maxlength="200" style="resize:none; height:100px; width:980px;" required>'
				+ currentContent + '</textarea>');
			
			$(this).hide();
			$(this).siblings('.replyConfirm').show();
		});
		
		// 확인 버튼 클릭
		$(".replyConfirm").on("click",function() {
			var replyNumber = $(this).data("reply-number");
			var editedContent = $("#editContent_" + replyNumber).val().trim();

			if (!editedContent.trim()) {
				alert("댓글 내용을 입력하세요.");
				return;
			}

			$.ajax({
				url : '${path}/customer/reply/edit.do',
				type : 'post',
				dataType : 'json',
				data : {
					reply_number : replyNumber,
					content : editedContent,
				},
				success : function(response) {
					alert("댓글이 성공적으로 수정했습니다.");
					$("#replyContent_" + replyNumber).text(editedContent); // 댓글 등록창 초기화
				},
				error : function(request, status, error) {
					alert("댓글 작성 도중 오류가 발생했습니다.");
					alert("status : " + request.status + 
							", message : "+ request.responseText + 
							", error : "+ error);

				}
			});

			$(this).siblings('.replyEdit').show();
			$(this).hide();
		});
	});

	$(function() {
		$(".replyDelete").on("click",function() {
			var replyNumber = $(this).data("reply-number");
			var self = this
			$.ajax({
				url : '${path}/customer/reply/delete.do',
				type : 'post',
				dataType : 'json',
				data : {
					reply_number : replyNumber,
				},
				success : function(response) {
					alert("댓글이 성공적으로 삭제했습니다.");
					$(self).closest('li').remove();
				},
				error : function(request, status, error) {
					alert("댓글 작성 도중 오류가 발생했습니다.");
					alert("status : " + request.status + 
							", message : "+ request.responseText + 
							", error : "+ error);

				}
			});
		});
	});
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<div class="item-info">
			<input type="hidden" id="board_number" name="board_number"
				value="${board.board_number }">
			<h2>${board.title }</h2>
			<div class="order-item-detail-top" style="font-weight: normal">
				<div class="order-item-detail-top-text">
					<div class="order-date">
						<span>${board.user_name}</span> <span>(${board.user_id})</span>
					</div>
					<div class="order-number">
						<span><fmt:formatDate value="${board.postdate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></span>
					</div>
				</div>
				<div class="order-buttons">
					<span>조회</span> <span>${board.visitcount}</span> <span>댓글</span> <span>${replyCount }</span>
				</div>
			</div>
			<hr>
			<div style="height: 400px;">
				<span>${board.content}</span>
			</div>
			<br> <br>
			<h3>댓글 보기</h3>
			<ul id="reply-list">
				<hr>
				<c:forEach items="${replies }" var="reply">
					<li>
						<div style="font-weight: bold;">
							<span>${reply.user_name}(${reply.user_id})</span>
						</div>
						<div>
							<span id="replyContent_${reply.reply_number }">${reply.content }</span>
						</div>
						<div style="color: grey; font-size: 14px;">
							<span>${reply.regdate }</span>
						</div> <c:if test="${sessionScope.user.user_id == reply.user_id}">
							<button type="button" class="order-button replyEdit" 
							data-reply-number="${reply.reply_number }">수정</button>
							<button type="button" class="order-button replyConfirm"
								style="display: none;"
								data-reply-number="${reply.reply_number }">확인</button>
						</c:if> <c:if
							test="${sessionScope.user.grade == '관리자' || sessionScope.user.user_id == reply.user_id}">
							<button type="button" class="order-button replyDelete"
								data-reply-number="${reply.reply_number }">삭제</button>
						</c:if>
						<hr>
					</li>

				</c:forEach>
			</ul>
			<div style="padding-left: 30px">
				<div style="font-weight: bold;">${reply.user_id}</div>
				<div>
					<div id="user" style="font-weight: bold;">
						<span>${sessionScope.user.name}(${sessionScope.user.user_id})</span>
					</div>
					<textarea maxlength="200" id="content" name="content"
						placeholder="내용을 입력하세요(200자 이내)"
						style="resize: none; height: 100px; width: 960px;" required></textarea>
				</div>
				<button id="replyWrite" class="order-button">작성</button>
				<hr>
			</div>

			<div class="item-detail-btn"
				style="display: flex; justify-content: center;">
				<button class="buy" type="button"
					onclick="location.href='${path}/customer/boardList.do'">목록</button>
				<c:if test="${sessionScope.user.user_id == board.user_id}">
					<button class="buy" type="button"
						onclick="location.href='${path}/customer/board/edit.do?board_number=${board.board_number}'">수정</button>
				</c:if>
			</div>
		</div>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>