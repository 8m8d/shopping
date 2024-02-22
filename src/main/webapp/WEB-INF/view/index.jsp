<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>PS TEAM</title>
<link rel="icon"  href="../image/aaa.png" />
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

.video-wrapper {
  position: relative;
  height: 70vh; /* 전체 화면 높이에 맞게 설정 */
}

#mainImg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
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
	color: #6b90dc;
}
.nav-wrapper {
  z-index: 1;
  background-color: rgba(255, 255, 255, 0.8); /* 네비게이션 배경색 지정 */
}
</style>
</head>
<body>
	<div class="video-wrapper">
		<video name="mainImg" id="mainImg" src="/video/aaa.mp4" alt=""
			autoplay="autoplay" muted="muted" /></video>
			<div class="nav-wrapper">
				<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
			</div>
	</div>
	<div class="best">
		<h1>BEST 상품</h1>
		<div class="bestContent">
			<c:forEach var="item" items="${item}" varStatus="status">
				<c:if test="${status.index < 4}">
					<div class="item_wrapper">
						<a href="itemDetail?itemNo=${item.itemNo}"> <img
							src="..${item.imgFilePath}" alt="" />
							<div class="item_title">${item.itemTitle }</div> <c:if
								test="${item.itemDiscount > 0}">
							${item.itemDiscount}%
							<span class="OrgPrice"
									style="text-decoration: line-through; color: #5c5c5c;"><f:formatNumber>${item.itemPrice}</f:formatNumber></span>
							</c:if>
							<div>
								<span class="item_price"> <f:formatNumber
										value="${item.itemPrice - (item.itemPrice * item.itemDiscount / 100)} "
										pattern="#,###" var="itemPrice" /> ${itemPrice}원
								</span>
							</div>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
<script>
	var video = document.getElementById("mainImg");
	video.addEventListener("ended",function(){
		video.play();
	})
</script>
</body>
</html>