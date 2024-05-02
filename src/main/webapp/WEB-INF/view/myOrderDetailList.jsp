<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<!-- Navigation -->
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<style>
.container {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 10px;
	/*             box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
	max-width: 800px;
	margin-top: 20px; /* 여백 추가 */
}

.order-item, .order-no-date, .order-address,.order-price,.payment-detail,.point-benefit {
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #dee2e6;
	border-radius: 5px;
	background-color: #ffffff;
	border-top: 1px solid #dee2e6;;
}
.order-actions {
	margin-top: 10px;
}

.orderStatusArea {
	margin-top: 30px;
	color: #5E5E5E;
	font-size: 20px;
	font-weight: bold;
}

#itemImg {
	width: 90px;
	height: 90px;
}

.orderInfoArea {
	margin-left: 10px;
}

.orderInfo {
	margin-bottom: 5px;
}

.pageTitle {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 150px;
	background-color: rgb(244, 250, 255);
	margin: 100px;
	height: 150px;
}

#boxMiddleLine {
	border-bottom: 1px solid #dee2e6;
	width: 100%;
	height: 20px;
}

.icon_text {
	display: inline-block;
	padding: 0 3px;
	font-size: 15px;
	line-height: 15px;
	white-space: nowrap;
	letter-spacing: -1px;
	border: 1px solid #dddde1;
	background-color: #fff;
}
.address-infoHead{
	margin-bottom: 10px;
}
.orderPrice-infoHead{
	margin-bottom: 10px;
}
.boxTitle {
	font-size:17px;
	font-weight: bold;
	border-bottom: 1px solid #dee2e6;
	padding-bottom: 20px;
}
li{
list-style:none;
}
.address-infoHead strong{
	position:absolute;
	color : #8f8f8f;
}
.address-infoHead span{
	position:relative;
	width:100px;
	margin-left: 100px;
	
}
.orderPrice-infoHead strong,.paymentDetail-infoHead strong{
	position:absolute;
	color : #8f8f8f;
}
.orderPrice-span,.paymentDetail-span{
	float: right;
	margin-right: -20px;
	font-weight: bold;
}
</style>
<body>
	<div class="pageTitle">
		<h1 style="font-size: 55px; color: #5E5E5E">ORDER LIST</h1>
	</div>
	<div class="container">
		<div class="row order-no-date">
			<div style="font-weight: bold; font-size: 17px;">주문번호 ${order.orderNo}</div>
			<div>
				주문일자
				<f:formatDate value="${orderDate}" pattern="YYYY.MM.dd" />
			</div>
		</div>
		<!-- 주문 목록 데이터를 forEach로 출력 -->
		<div class="row order-item">
			<div class="boxTitle">주문상품</div>
			<c:forEach var="orderDetailList" items="${orderDetailList}"
				varStatus="loop">
				<div class="orderStatusArea"></div>
				<div class="orderInfo row">
					<div class="col-md-1" style="width: 90px">
						<div class="itemImgArea">
							<img id="itemImg" src="..${orderDetailList.imgFilePath}" alt="" />
						</div>
					</div>
					<div class="col-md-10">
						<div class="orderInfoArea">
							<div>${orderDetailList.itemTitle}</div>
							<div style="font-weight: bold;">
								<f:formatNumber value="${orderDetailList.orderDetailAmount}"
									pattern="#,###원"></f:formatNumber>
							</div>
							<div>수량 : ${orderDetailList.orderDetailQuantity}</div>
							<div>
								<span class="icon_text option">옵션</span> 선택 없음
							</div>
						</div>
					</div>
				</div>
				<div id="boxMiddleLine"></div>
			</c:forEach>
		</div>
		<div class="row order-address">
			<div class="boxTitle" style="margin-bottom: 30px;">배송지정보</div>
			<div class="orderInfo row">
						<li class="address-infoHead">
							<strong>수령인</strong>
							<span><c:out value="${order.recipientName}" /></span>
						</li>
						<li class="address-infoHead">
							<strong>연락처</strong> <span>${order.recipientPhone}</span>
						</li>
						<li class="address-infoHead">
							<strong>배송지</strong>
							<span>
								${order.deliveryPostcode}
							</span>
							<br>
								<span>
								${order.deliveryAddress}
								${order.deliveryExtraAddress}
								</span>
							<br>
								<span>
								${order.deliveryDetailAddress}
							</span>
						</li>
						<li class="address-infoHead">
							<strong>배송메모</strong>
							<span>부재시 문 앞에 두고가주세요.</span>
						</li>
			</div>
		</div>
		<div class="row order-price">
			<div class="boxTitle" style="margin-bottom: 30px;">주문금액 <span style="float: right; color: #0A58CA;"><f:formatNumber value="${order.orderTotalPrice + order.deliveryCharge}" pattern="#,###원"></f:formatNumber></span></div>
			<div class="orderInfo row">
						<li class="orderPrice-infoHead">
							<strong>상품금액</strong>
							<span class="orderPrice-span"><f:formatNumber value="${order.orderTotalPrice}" pattern="#,###원"></f:formatNumber> </span>
						</li>
						<li class="orderPrice-infoHead">
							<strong>배송비</strong> 
							<c:if test="${order.deliveryCharge > 0}"><span class="orderPrice-span">+<f:formatNumber value="${order.deliveryCharge}" pattern="#,###원"></f:formatNumber></span></c:if> 
							<c:if test="${order.deliveryCharge <= 0}"><span class="orderPrice-span"><f:formatNumber value="${order.deliveryCharge}" pattern="#,###원"></f:formatNumber></span></c:if>
						</li>
			</div>
		</div>
		<div class="row payment-detail">
			<div class="boxTitle" style="margin-bottom: 30px;">결제상세 <span style="float: right; color: #0A58CA;"><f:formatNumber value="${order.orderTotalPrice + order.deliveryCharge}" pattern="#,###원"></f:formatNumber></span></div>
			<div class="orderInfo row">
						<li class="paymentDetail-infoHead">
							<strong>포인트 사용</strong>
							<span class="paymentDetail-span"><f:formatNumber value="${order.orderTotalPrice + order.deliveryCharge}" pattern="#,###원"></f:formatNumber> </span>
						</li>
			</div>
		</div>
		<div class="row point-benefit">
			<div class="boxTitle" style="margin-bottom: 30px;">포인트 혜택 <span style="float: right; color: #0A58CA;"><f:formatNumber value="${order.orderTotalPrice / 100}" pattern="#,###원"></f:formatNumber></span></div>
			<div class="orderInfo row">
						<li class="paymentDetail-infoHead">
							<strong>구매적립</strong>
							<span class="paymentDetail-span"><f:formatNumber value="${order.orderTotalPrice / 100}" pattern="#,###원"></f:formatNumber> </span>
						</li>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>
