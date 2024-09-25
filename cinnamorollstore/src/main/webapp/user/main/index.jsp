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
		<c:if test="${param.message == 'deleteAccount'}">
			<script>
				alert('그동안 이용해주셔서 감사합니다.');
			</script>
		</c:if>
		<section class="item-content">
			<div id="item-overview">
				<div class="new-items">
					<div class="items-title">
						<h3>시나모롤의 귀여운 문구 상품들</h3>
						<button type="button" class="order-button"
							onclick="location.href='${path}/itemList.do?category=stationary'">더보기</button>
					</div>

					<ul class="item-list" style="width: 1000px;">
						<c:forEach items="${stationaryItems }" var="item" begin="0"
							end="3">
							<li class="item" style="width: 220px;"><a
								href="${path}/itemDetail.do?item_number=${item.item_number}">
									<div class="item-image">
										<img src="${path}/imgLoad.do?fileName=${item.image }"
											alt="${item.name }" width="200px" height="200px">
									</div>
									<div class="item-detail-buttons" style="text-align: center;">
										<button type="button"
											style="background: #71BFEC; border: 1px solid #71BFEC; color: white; height: 20px; line-height: 100%; font-size: 14px;">신상</button>
										<button type="button"
											style="background: #efd45e; border: 1px solid #efd45e; color: white; height: 20px; line-height: 100%; font-size: 14px;">베스트</button>
										<c:if test="${item.original_price > item.sale_price}">
											<button type="button"
												style="background: #ff7bb0; border: 1px solid #ff7bb0; color: white; height: 20px; line-height: 100%; font-size: 14px;">세일</button>
										</c:if>
										<c:if test="${item.exposure == '품절'}">
											<button type="button"
												style="background: #1C0000; border: 1px solid #1C0000; color: white; height: 20px; line-height: 100%; font-size: 14px;">품절</button>
										</c:if>
									</div>
									<div class="item-infos">
										<div class="item-title">
											<span>${ item.name }</span>
										</div>
										<c:if
											test="${item.original_price != item.sale_price}">
											<div class="item-detail-original-price"
												style="font-size: 14px; text-decoration-line: line-through;">
												<span>${item.original_price}원</span>
											</div>
										</c:if>
										<div class="item-price">
											<span>${item.sale_price }원</span>
										</div>
									</div>
							</a></li>
						</c:forEach>

					</ul>
				</div>
				<div class="best-items">
					<div class="items-title">
						<h3>시나모롤의 귀여운 필기 상품들</h3>
						<button type="button" class="order-button"
							onclick="location.href='${path}/itemList.do?category=writing'">더보기</button>
					</div>
					<ul class="item-list">
						<c:forEach items="${writingItems }" var="item" begin="0"
							end="3">
							<li class="item" style="width: 220px;"><a
								href="${path}/itemDetail.do?item_number=${item.item_number}">
									<div class="item-image">
										<img src="${path}/imgLoad.do?fileName=${item.image}"
											alt="${item.name }" width="200px" height="200px">
									</div>
									<div class="item-detail-buttons" style="text-align: center;">
										<button type="button"
											style="background: #71BFEC; border: 1px solid #71BFEC; color: white; height: 20px; line-height: 100%; font-size: 14px;">신상</button>
										<button type="button"
											style="background: #efd45e; border: 1px solid #efd45e; color: white; height: 20px; line-height: 100%; font-size: 14px;">베스트</button>
										<c:if
											test="${item.original_price > item.sale_price}">
											<button type="button"
												style="background: #ff7bb0; border: 1px solid #ff7bb0; color: white; height: 20px; line-height: 100%; font-size: 14px;">세일</button>
										</c:if>
										<c:if test="${item.exposure == '품절'}">
											<button type="button"
												style="background: #1C0000; border: 1px solid #1C0000; color: white; height: 20px; line-height: 100%; font-size: 14px;">품절</button>
										</c:if>
									</div>
									<div class="item-infos">
										<div class="item-title">
											<span>${ item.name }</span>
										</div>
										<c:if
											test="${item.original_price != item.sale_price}">
											<div class="item-detail-original-price"
												style="font-size: 14px; text-decoration-line: line-through;">
												<span>${item.original_price}원</span>
											</div>
										</c:if>
										<div class="item-price">
											<span>${item.sale_price }원</span>
										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="sale-items">
					<div class="items-title">
						<h3>시나모롤의 귀여운 소품 상품들</h3>
						<button type="button" class="order-button"
							onclick="location.href='${path}/itemList.do?category=props'">더보기</button>
					</div>
					<ul class="item-list">
						<c:forEach items="${propsItems }" var="item" begin="0"
							end="3">
							<li class="item" style="width: 220px;"><a
								href="${path}/itemDetail.do?item_number=${item.item_number}">
									<div class="item-image">
										<img src="${path}/imgLoad.do?fileName=${item.image}"
											alt="${item.name }" width="200px" height="200px">
									</div>
									<div class="item-detail-buttons" style="text-align: center;">
										<button type="button"
											style="background: #71BFEC; border: 1px solid #71BFEC; color: white; height: 20px; line-height: 100%; font-size: 14px;">신상</button>
										<button type="button"
											style="background: #efd45e; border: 1px solid #efd45e; color: white; height: 20px; line-height: 100%; font-size: 14px;">베스트</button>
										<c:if
											test="${item.original_price > item.sale_price}">
											<button type="button"
												style="background: #ff7bb0; border: 1px solid #ff7bb0; color: white; height: 20px; line-height: 100%; font-size: 14px;">세일</button>
										</c:if>
										<c:if test="${item.exposure == '품절'}">
											<button type="button"
												style="background: #1C0000; border: 1px solid #1C0000; color: white; height: 20px; line-height: 100%; font-size: 14px;">품절</button>
										</c:if>
									</div>
									<div class="item-infos">
										<div class="item-title">
											<span>${ item.name }</span>
										</div>
										<c:if
											test="${item.original_price != item.sale_price}">
											<div class="item-detail-original-price"
												style="font-size: 14px; text-decoration-line: line-through;">
												<span>${item.original_price}원</span>
											</div>
										</c:if>
										<div class="item-price">
											<span>${item.sale_price }원</span>
										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
		<%@ include file="../fixedBar/footer.jsp"%>
	</div>
</body>
</html>