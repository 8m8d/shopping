<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PS TEAM : PRODUCT DETAIL</title>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<!-- 부트스트랩 CDN 추가 -->
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
.cartOrBuy {
	text-align: center;
	margin-top: 50px;
	padding-bottom: 30px;
	border-bottom: 1px solid gray;
}

#itemTitle {
	font-size: 25px;
	border-bottom: 1px solid gray;
	padding-bottom: 30px;
}

#itemDcPrice {
	margin-top: 25px;
	font-size: 15px;
	color:#6c757d;
}

.strike-through {
	text-decoration: line-through;
}
.itemPrice{
	border-bottom: 1px solid gray;
	padding-bottom: 30px;
}
#cartQuantity{
	text-align: center;
}
input::-webkit-inner-spin-button {
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
}
.totalPrice{
	margin-top: 20px;
	font-size: 20px;
}
#totalPriceArea{
	margin-left: 230px;
	color: #6b90dc;
	font-size: 30px;
	font-weight: bold;
}
img{
	min-width: 100%;
	max-height: 100%;
}
.imgFileArea{
	width: 500px;
	height: 450px;
}
.img-fluid {
    max-width: 100%;
    height: 100%;
}
</style>
<script>

$(function(){
    var checkArr = [];
    $("#buyBtn").on("click",function(){
        var itemNo = document.getElementById("itemNo").value;
        var cartQuantity = document.getElementById("cartQuantity").value;
        var deliveryCharge = document.getElementById("deliveryCharge").value;
        var totalPriceArea = document.getElementById("totalPriceArea").innerText; // 수정된 부분
        var totalPrice = parseFloat(totalPriceArea.replace(/[^0-9]/g,''));
        var buyItemPoint = Math.round(totalPrice / 100);
        console.log(buyItemPoint);
        if(totalPrice >= 30000){
        	deliveryCharge = 0;
        }else{
        	deliveryCharge = 3000;
        	
        }
        console.log(totalPrice);
        $.ajax({
            url : "nowBuyItem",
            type : "get",
            data : {
                itemNo : itemNo,
                cartQuantity : cartQuantity,
                deliveryCharge : deliveryCharge,
                buyItemPoint : buyItemPoint
            },
            success : function(response){
                console.log("성공")
            	location.href="nowBuyItem?itemNo=" + itemNo + "&cartQuantity="+cartQuantity + "&deliveryCharge="+deliveryCharge + "&buyItemPoint="+buyItemPoint;
            },error : function(){
                console.log("에러")
            }
        })
    })
})
</script>
<body>
<form action="addCart" id="frm" method="post" target="iframeParam">
	<input type="hidden" id="memberId" name="memberId" value="${dto.memberId}" />
	<input type="hidden" name="itemNo" id="itemNo" value="${item.itemNo}" />
	<div class="container mt-5">
		<div class="row">
			<div class="imgFileArea col-md-6">
				<img src="..${item.imgFilePath}" alt="${item.itemTitle}"
					class="img-fluid rounded">
			</div>
			<div class="col-md-6">
				<h2 id="itemTitle">${item.itemTitle}</h2>
				<!-- 원래 가격 -->
				<div class="itemPrice">
					<p class="h4" id="itemDcPrice">
						<c:if test="${item.itemDiscount > 0}">
							<span>${item.itemDiscount}%</span>
							<span class="strike-through"> <f:formatNumber
									value="${item.itemPrice}" pattern="#,###" var="originalPrice" />${originalPrice}원
							</span>
						</c:if>
					</p>

					<!-- 할인된 가격 -->
					<c:if test="${item.itemDiscount > 0}">
						<p class="h4" id="itemPriceValue" style="color: #cb1400;">
							<strong style="font-size: 25px;"> <f:formatNumber
									value="${item.itemPrice - (item.itemPrice * item.itemDiscount / 100)}"
									pattern="#,###" var="discountedPrice" /> ${discountedPrice}원
							</strong>
						</p>
					</c:if>
					<c:if test="${item.itemDiscount <= 0}">
						<p class="h4" id="itemPriceValue" style="color: #cb1400;">
							<strong style="font-size: 25px;"> <f:formatNumber
									value="${item.itemPrice - (item.itemPrice * item.itemDiscount / 100)}"
									pattern="#,###" var="discountedPrice" /> ${discountedPrice}원
							</strong>
						</p>
					</c:if>
				</div>
				
				<div class="cartOrBuy">
				 <span class="qtyArea" style="align-items: center;">
			        <input type="button" id ="minus" value="-" onclick="decrementValue('cartQuantity')" style="width: 35px; height: 38px; border: 0px">
			        <input type="number" id="cartQuantity" name="cartQuantity" value="1" style="width: 50px; height: 38px; margin: -5px; border: 1px solid #eff1f5 ">
			        <input type="button" id="plus" value="+" onclick="incrementValue('cartQuantity')" style="width: 35px; height: 38px; border: 0px">
			    </span>
					<button type="button" class="btn btn-light" id="addCartBtn"
						style="width: 150px; color: #007bff; border: 1px solid #007bff; font-weight: bold; margin-left: 10px;">ADD
						TO CART</button> <button type="button" class="btn btn-primary"
						id="buyBtn" style="width: 150px;">BUY NOW</button>
				</div>
				
				<div class="totalPrice">총 상품 금액
					<span id="totalPriceArea">${discountedPrice}원</span>
				</div>
				<input type="hidden" name="deliveryCharge" id="deliveryCharge" value=""/>
				<input type="hidden" name="buyItemPoint" id="buyItemPoint" value=""/>
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
<script>		





$(document).ready(function(){
	var memberId = document.getElementById("memberId").value;
	$("#addCartBtn").on("click",function(){
		if(memberId == null || memberId == ""){
			alert("로그인 후에 사용가능합니다.")
			location.href = "signIn"
		}else{
			var data = $("#frm").serialize();
			console.log(data)
			$.ajax({
				url:"addCart",
				type:"POST",
				data: data,
				success:function(data){
			            if(confirm("이미 장바구니에 담겨있는 상품입니다." + "\n" + "장바구니로 이동하시겠습니까?")){
				            location.href = "cart";
			            }
				},error:function(data){
					 if (confirm("장바구니에 상품을 담았습니다." + "\n" + "장바구니로 이동하시겠습니까?")) {
						 console.log(data);
			             location.href = "cart";
					}
				}
			})
		}
	})
})

    function incrementValue(id) {
        var input = document.getElementById(id);
        var value = parseInt(input.value, 10);
        value = isNaN(value) ? 0 : value;
        value++;
        input.value = value;
    }

    function decrementValue(id) {
        var input = document.getElementById(id);
        var value = parseInt(input.value, 10);
        value = isNaN(value) ? 0 : value;
        if (value > 1) {
            value--;
            input.value = value;
        }
    }
    $(function(){
        setInterval(function() {
        	var itemPriceText = document.getElementById("itemPriceValue").innerText;
        	var itemPrice = parseFloat(itemPriceText.replace(/[^0-9]/g, ''));
            var qty = document.getElementById("cartQuantity").value;
            if(qty <= 0){
            	alert("1개 이상부터 주문 가능합니다");
            	document.getElementById("cartQuantity").value = 1;
            }else if(qty > 10000){
            	alert("10,000개 이하로 구매하실 수 있습니다")
            	document.getElementById("cartQuantity").value = 10000;
            }
            var totalPrice = itemPrice * qty;
            document.getElementById("totalPriceArea").innerText = totalPrice.toLocaleString()+"원";
        }, 100);  // 1000ms (1초) 간격으로 코드를 실행합니다.
    });
</script>
</html>
