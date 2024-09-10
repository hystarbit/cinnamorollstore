<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="imagePath" value="/Users/hwajung/Documents/work/uploadImage" />
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
		<section class="item-content">
			<div id="item-overview">
				<div class="new-items">
					<div class="items-title">
						<h3>시나모롤의 귀여운 문구 상품들</h3>
						<button type="button" class="order-button" onclick="location.href='${path}/itemList/stationary.do'">더보기</button>
					</div>

					<ul class="item-list">
						<c:forEach items="${stationaryItems }" var="stationaryItem"
							begin="0" end="3">
							<li class="item"><a
								href="${path}/itemDetail.do?item_number=${stationaryItem.item_number}">
									<div class="item-image">
										<img src="${path}/resources/images/${stationaryItem.image}"
											alt="${item.name }" width="200px">
									</div>
									<div class="item-infos">
										<div class="item-title">

											<span>${ stationaryItem.name }</span>
										</div>
										<div class="item-price">
											<span>${stationaryItem.sale_price }원</span>
										</div>
									</div>
							</a></li>
						</c:forEach>

					</ul>
				</div>
				<div class="best-items">
					<div class="items-title">
						<h3>시나모롤의 귀여운 필기 상품들</h3>
						<button type="button" class="order-button" onclick="location.href='${path}/itemList/writing.do'">더보기</button>
					</div>
					<ul class="item-list">
						<c:forEach items="${writingItems }" var="writingItem" begin="0"
							end="3">
							<li class="item"><a
								href="${path}/itemDetail.do?item_number=${writingItem.item_number}">
									<div class="item-image">
										<img src="${path}/resources/images/${writingItem.image}"
											alt="${item.name }" width="200px">
									</div>
									<div class="item-infos">
										<div class="item-title">
											<span>${ writingItem.name }</span>
										</div>
										<div class="item-price">
											<span>${writingItem.sale_price }원</span>
										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="sale-items">
					<div class="items-title">
						<h3>시나모롤의 귀여운 소품 상품들</h3>
						<button type="button" class="order-button" onclick="location.href='${path}/itemList/props.do'">더보기</button>
					</div>
					<ul class="item-list">
						<c:forEach items="${propsItems }" var="propsItem" begin="0"
							end="3">
							<li class="item"><a
								href="${path}/itemDetail.do?item_number=${propsItem.item_number}">
									<div class="item-image">
										<img src="${path}/resources/images/${propsItem.image}"
											alt="${item.name }" width="200px">
									</div>
									<div class="item-infos">
										<div class="item-title">
											<span>${ propsItem.name }</span>
										</div>
										<div class="item-price">
											<span>${propsItem.sale_price }원</span>
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