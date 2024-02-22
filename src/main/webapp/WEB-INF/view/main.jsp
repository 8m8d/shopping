<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>인덱스 페이지</title>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<style>
.card {
	text-align: center;
}

.container {
	max-width: 600px;
	margin: auto;
}

h3 {
	font-weight: bold;
	font-style: inherit;
	color: #5c5552;
}

#mainImg {
	width: 100%;
	height: 50vh; /* 뷰포트 높이에 맞게 설정 */
	object-fit: cover;
	display: block;
	margin: 0; /* 기본 마진 제거 */
	padding: 0; /* 기본 패딩 제거 */
}

.best {
	margin: 100px;
	text-align: center;
	font-weight: bold;
	color: #5C5C5C;
}

.bestContent {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.item_wrapper {
	width: calc(33.33% - 300px); /* 각 아이템의 너비를 설정하되 마진 공간을 제외합니다. */
	margin: 30px;
	text-align: center;
}

.item_wrapper img {
	width: 100%;
	height: auto;
}

.item_title {
	white-space: nowrap; /* 텍스트가 한 줄로 나오도록 설정 */
	overflow: hidden; /* 오버플로우 처리 */
	text-overflow: ellipsis; /* 초과된 텍스트에 '...' 표시 */
	margin-top: 10px;
	font-weight: bold;
	color: #5C5C5C;
	max-width: 90%;
}

.item_price {
	font-size: 20px;
	color: #2196f3;
}
</style>
</head>
<body>
	<div>
		<img name="mainImg" id="mainImg"
			src="https://images.unsplash.com/photo-1613690399151-65ea69478674?q=80&w=2073
        &auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
			alt="" />
	</div>
	<div class="best">
		<h1>BEST 상품</h1>
		<div class="bestContent">
			<c:forEach var="item" items="${item}" varStatus="status">
				<c:if test="${status.index < 4}">
					<div class="item_wrapper">
						<a href="itemDetail?id=${item.id }"> <img src="${item.img_path}" alt="" />
							<div class="item_title">${item.title }</div> <span
							class="item_price"> <f:formatNumber value="${item.price}"
									pattern="#,###" var="price" /> ${price}원
						</span>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html> --%>