<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : PRODUCT LIST</title>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<style>
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
	width: calc(25% - 30px); /* 각 아이템의 너비를 설정하되 마진 공간을 제외합니다. */
	text-align: center;
	margin-top: 50px;
	box-sizing: border-box;
}

.item_wrapper img {
	height: 250px;
}

.item_wrapper img, .item_wrapper_desc {
	width: 70%;
	display: block; /* inline 요소에서 block 요소로 변경하여 다른 내용과의 정렬을 용이하게 합니다. */
	margin: 0 auto; /* 이미지를 중앙 정렬합니다. */
}

.item_title {
	white-space: nowrap; /* 텍스트가 한 줄로 나오도록 설정 */
	overflow: hidden; /* 오버플로우 처리 */
	text-overflow: ellipsis; /* 초과된 텍스트에 '...' 표시 */
	margin-top: 10px;
	font-weight: bold;
	color: #5C5C5C;
	max-width: 100%;
}

.item_price {
	font-size: 20px;
	color: #cb1400;
}
.pageTitle{
	display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 150px;
    background-color: rgb(244, 250, 255);
    margin-bottom: 100px;
	height: 150px;
}
</style>
<body>
	<div class="best">
		<div class="pageTitle" >
		<h1 style="font-size: 55px; color:#5E5E5E;">BEST 상품</h1>
		<p>PS TEAM이 엄선한 최고의 상품을 소개합니다.</p>
		</div>
		<div class="bestContent">
			<c:forEach items="${item}" var="item">
				<div class="item_wrapper">
					<a href="itemDetail?itemNo=${item.itemNo}">
						<div class="item_wrapper_img">
							<img src="..${item.imgFilePath}" alt="" />
						</div>
						<div class="item_wrapper_desc">
							<div class="item_title">${item.itemTitle}</div>
							<div>
							<c:if test="${item.itemDiscount > 0}">
							${item.itemDiscount}%
							<span class="OrgPrice" style="text-decoration: line-through; color:#5c5c5c;"><f:formatNumber >${item.itemPrice}</f:formatNumber></span>
							</c:if>
							</div>
							<span class="item_price"> <f:formatNumber
									value="${item.itemPrice - (item.itemPrice * item.itemDiscount / 100)} " pattern="#,###" var="itemPrice" /> ${itemPrice}원
							</span>
						</div>
					</a>
				</div>

			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>
