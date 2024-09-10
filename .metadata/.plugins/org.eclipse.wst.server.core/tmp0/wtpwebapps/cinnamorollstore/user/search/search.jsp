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
</head>
<body>
	<div id="wrap">
		<%@ include file="../fixedBar/nav-before.jsp"%>
		<div class="item-info">
			<h2>검색결과</h2>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="all-tab" data-bs-toggle="tab"
						data-bs-target="#all-tab-pane" type="button" role="tab"
						aria-controls="all-tab-pane" aria-selected="true">통합 검색</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="delivery-prepare-tab"
						data-bs-toggle="tab" data-bs-target="#delivery-prepare-tab-pane"
						type="button" role="tab" aria-controls="delivery-prepare-tab-pane"
						aria-selected="false">문구</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="delivery-in-tab" data-bs-toggle="tab"
						data-bs-target="#delivery-in-tab-pane" type="button" role="tab"
						aria-controls="delivery-in-tab-pane" aria-selected="false">필기</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="delivery-complete-tab"
						data-bs-toggle="tab" data-bs-target="#delivery-complete-tab-pane"
						type="button" role="tab"
						aria-controls="delivery-complete-tab-pane" aria-selected="false">소품</button>
				</li>
			</ul>
			<br>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="all-tab-pane"
					role="tabpanel" aria-labelledby="all-tab" tabindex="0">
					<h3>문구</h3>
					<p>검색 결과가 없습니다.</p>
					<hr>
					<br>
					<h3>필기</h3>
					<p>검색 결과가 없습니다.</p>
					<hr>
					<br>
					<div class="items-title">
						<h3>소품</h3>
						<button type="button" class="order-button"
							onclick="location.href='../itemInfo/itemDetail.jsp'">검색
							결과 더 보기></button>
					</div>
					<div class="item-detail">
						<div class="item-img">
							<img src="${path}/resources/images/Cinnamoroll.webp" alt="Logo"
								height="150px">
						</div>
						<div class="item-detail-infos">
							<div class="item-detail-buttons">
								<button type="button"
									style="background: #71BFEC; border: 1px solid #71BFEC; color: white; height: 20px; line-height: 100%; font-size: 14px;">신상</button>
								<button type="button"
									style="background: #efd45e; border: 1px solid #efd45e; color: white; height: 20px; line-height: 100%; font-size: 14px;">베스트</button>
								<button type="button"
									style="background: #ff7bb0; border: 1px solid #ff7bb0; color: white; height: 20px; line-height: 100%; font-size: 14px;">세일</button>
							</div>
							<div class="item-detail-title">
								<span><a href="../itemInfo/itemDetail.jsp">시나모롤 대형 인형
										100cm</a></span>
							</div>
							<div class="item-detail-price">
								<span class="left">판매 가격: </span> <span>30000</span> <span>원</span>
							</div>
						</div>

					</div>
				</div>
				<div class="tab-pane fade" id="delivery-prepare-tab-pane"
					role="tabpanel" aria-labelledby="delivery-prepare-tab" tabindex="0">
					<p>검색 결과가 없습니다.</p>
				</div>
				<div class="tab-pane fade" id="delivery-in-tab-pane" role="tabpanel"
					aria-labelledby="delivery-in-tab" tabindex="0">
					<p>검색 결과가 없습니다.</p>
				</div>
				<div class="tab-pane fade" id="delivery-complete-tab-pane"
					role="tabpanel" aria-labelledby="delivery-complete-tab"
					tabindex="0">
					<div class="item-detail">
						<div class="item-img">
							<img src="${path}/resources/images/Cinnamoroll.webp" alt="Logo"
								height="150px">
						</div>
						<div class="item-detail-infos">
							<div class="item-detail-buttons">
								<button type="button"
									style="background: #71BFEC; border: 1px solid #71BFEC; color: white; height: 20px; line-height: 100%; font-size: 14px;">신상</button>
								<button type="button"
									style="background: #efd45e; border: 1px solid #efd45e; color: white; height: 20px; line-height: 100%; font-size: 14px;">베스트</button>
								<button type="button"
									style="background: #ff7bb0; border: 1px solid #ff7bb0; color: white; height: 20px; line-height: 100%; font-size: 14px;">세일</button>
							</div>
							<div class="item-detail-title">
								<span><a href="../itemInfo/itemDetail.jsp">시나모롤 대형 인형
										100cm</a></span>
							</div>
							<div class="item-detail-price">
								<span class="left">판매 가격: </span> <span>30000</span> <span>원</span>
							</div>
						</div>

					</div>
				</div>
			</div>
			<br>

			<hr>
		</div>
	</div>
	<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>

</html>