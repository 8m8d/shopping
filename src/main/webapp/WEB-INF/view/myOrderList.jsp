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

.order-item {
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #dee2e6;
	border-radius: 5px;
	background-color: #ffffff;
}

.order-actions {
	margin-top: 10px;
}

.cancel-btn, .inquiry-btn {
	margin-right: 10px;
}

.orderStatusArea {
	margin-top: 30px;
	margin-bottom: 30px;
	color: #5E5E5E;
	font-size: 20px;
	font-weight: bold;
}
#itemImg{
	width: 90px;
	height: 90px;
}
.orderInfoArea{
	margin-left: 10px;
}
.orderDateInfoArea{
	color: gray;
	font-size: 13px;
}
.orderPriceInfoArea{
	font-weight: bold;
}
.orderInfo{
	margin-bottom: 30px;
}
.btn{
	width: 100%
}
#orderInquireBtn{
	background-color: #f3f5f7;
	font-weight: bold;
	font-size: 17px;
}
.orderDeleteBtn{
	background-color: #e36672;
	font-weight: bold;
	color: white;
	font-size: 17px;
}
.pageTitle{
	display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 150px;
    background-color: rgb(244, 250, 255);
    margin:100px;
	height: 150px;
}
</style>
</head>
<script>
	$(function(){
		$(".orderDeleteBtn").on("click",function(){
			var orderNo = $(this).val();
			if(confirm("해당 주문을 취소 하시겠습니까?")){
				
				$.ajax({
					url:"myOrderListDelete",
					type:"get",
					data:{
						orderNo : orderNo
					},
					success : function(){
					},error : function(){
						alert("해당 주문이 삭제 되었습니다.");
						location.href = "myOrderList";
					}
				})
			}
		})
	})
</script>
<body>
	<div class="pageTitle">
		<h1 style="font-size: 55px; color: #5E5E5E">ORDER LIST</h1>
	</div>
	<div class="container">
		<!-- 주문 목록 데이터를 forEach로 출력 -->
		<c:forEach var="order" items="${dto}" varStatus="loop">
			<div class="row order-item">
				<div class="orderStatusArea">
					${order.orderStatus}
				</div>
				<div class="orderInfo row">
					<div class="col-md-1"  style="width: 90px">
						<div class="itemImgArea">
							<img id="itemImg" src="..${order.imgFilePath}" alt="" />
						</div>
					</div>
					<div class="col-md-10">
						<div class="orderInfoArea">
							<f:parseDate var="parseDate" value="${order.orderDate}"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<div class="orderDateInfoArea">
								<f:formatDate value="${parseDate}" pattern="MM.dd 결제" />
							</div>
							<div>
							${order.itemTitle}
							</div>
							<div class="orderPriceInfoArea">
								<f:formatNumber
									value="${order.orderTotalPrice + order.deliveryCharge}"
									pattern="#,###원"></f:formatNumber>
							</div>
							<div class="orderDetailLink">
								<a href="myOrderDetailList?orderNo=${order.orderNo}" style="color: #0A58CA;">주문상세</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<span class="orderInquire">
						<button class="btn btn" id="orderInquireBtn">상품문의</button>
					</span>
				</div>	
				<div class="col-md-6">
					<span class="orderDelete">
						<button class="orderDeleteBtn btn btn" value="${order.orderNo }">주문취소</button>
					</span> 	
				</div>
			</div>
		</c:forEach>
	</div>

	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>
