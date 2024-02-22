<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : BUY PART</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Navigation -->
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
</head>
<style>
.card-header {
    background-color: #a2d2ff;
    color: white;
}
.form-control::placeholder {
    color: #adb5bd;
    font-weight: bold;
}
input[type="text"] {
    font-weight: bold;
    box-shadow: 
}
input[type="email"] {
    font-weight: bold;
}
.form-control:focus {
    box-shadow: none;
    border-color: #ced4da;
}
.customer_col {
    border: 1px solid #ced4da;
}
h2 {
   color: #5E5E5E;
   font-size: 20px;
   font-weight: 600;
   margin-top: 15px;
}
.customer_col--1 {
    text-align: right;
    color: #5E5E5E;
    padding: 7px 10px 7px 15px;
    background-color: #dedbd2;
    font-weight: 600;
    font-size: 13px;
}
table {
    border-top: 2px solid #ced4da;
}
.paymentDetailContentsArea,
.OrderSummaryArea,
.PointBenefitContentsArea{
    display: flex;
    position: relative;
}    
    
.paymentDetailOrderPrice,
.accordion-body-right,
.accordion-button-right{
    margin-left: auto;
}
.paymentDetailContentsArea,
.PointBenefitContentsArea{
    margin-bottom: 10px;
}
.paymentDetailOrderPriceUl,
.pointBennefitUl{
	border-left: 5px solid #efeff0;
}
.paymentDetailOrderPriceLi,
.pointBennefitLi{
    margin-left: -20px;
    font-size: 15px;
}
.accordion-button::after {
  margin-left: 0;
}

 /* 아코디언 확장시 버튼 색상 변경 예제 */
    .accordion-button:not(.collapsed) {
  background-color: white; /* 확장된 상태일 때의 배경색 */
  color: black; /* 확장된 상태일 때의 글자색 */
}
.accordion-button:focus {
  box-shadow: 0px 1px 0px 0px #dee2e6;
}
.itemImg{
	width: 100px;
	height: 100px;
}
.orderItemInfoArea{
	padding-bottom: 10px; 
	border-bottom: 1px solid #edede9;
	margin-bottom: 10px;
}
.orderItemInfoPrice{
	font-size: 17px; 
	color: #6b90dc; 
	font-weight: 600
}
.orderItemInfoQuantity{
	 color: #767678;
	 font-size: 15px;
}
</style>

<script>

/*카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API  카카오주소 API*/
/*카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API    카카오주소 API  카카오주소 API*/

    function kakaoAddressApi() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("deliveryExtraAddressModal").value = extraAddr;
                
                } else {
                    document.getElementById("deliveryExtraAddressModal").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('deliveryPostcodeModal').value = data.zonecode;
                document.getElementById("deliveryAddressModal").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("deliveryDetailAddressModal").focus();
            }
        }).open();
    }
</script>

<script>

    $(document).ready(function() {

        // 전화번호 유효성 및 하이픈 자동 채우기
        $("#recipientPhoneModal").on("keyup", function() {
            $(this).val($(this).val().replace(/[^0-9]/g, "")
                .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3")
                .replace("--", "-"));
        });

    });
        function changeDeliveryAddress(){
        	var recipientNameModal = document.getElementById("recipientNameModal").value;
        	document.getElementById("recipientName").innerText = recipientNameModal
        	
        	var deliveryAddressModal = document.getElementById("deliveryAddressModal").value;
        	document.getElementById("deliveryAddress").innerText = deliveryAddressModal

        	var deliveryExtraAddressModal = document.getElementById("deliveryExtraAddressModal").value;
        	document.getElementById("deliveryExtraAddress").innerText = deliveryExtraAddressModal

        	var deliveryDetailAddressModal = document.getElementById("deliveryDetailAddressModal").value;
        	document.getElementById("deliveryDetailAddress").innerText = deliveryDetailAddressModal
        	
        	var deliveryPostcodeModal = document.getElementById("deliveryPostcodeModal").value;
        	document.getElementById("deliveryPostcode").innerText = deliveryPostcodeModal

        	var recipientPhoneModal = document.getElementById("recipientPhoneModal").value;
        	document.getElementById("recipientPhone").innerText = recipientPhoneModal
        	
        }
        $(function() {
            var itemPriceTotalSum = 0;
            var orderPriceSum = 0;
            var PointBenefitAmount = parseInt($("#PointBenefitAmount").text().replace(/[^0-9]/g, ""));
            var memberPoint = parseInt($("#memberPoint").text().replace(/[^0-9]/g, ""));
            var deliveryCharge = parseFloat($("#deliveryCharge").text().replace(/[^0-9]/g, ""));

            $("[id^='orderItemInfoPrice_']").each(function(index) {
                var itemPrice = parseFloat($("#orderItemInfoPrice_" + index).text().replace(/[^0-9]/g, ''));
                itemPriceTotalSum += itemPrice;
                orderPriceSum = itemPriceTotalSum + deliveryCharge;
                var paymentedPoint = (memberPoint - orderPriceSum) + PointBenefitAmount;
                $("#paymentedPoint").text(makePrice(paymentedPoint));
            });

            $("#paymentDetailOrderPrice, #paymentDetailPrice").text(makePrice(orderPriceSum));
            $("#OrderSummaryItemPrice").text(makePrice(itemPriceTotalSum));
            
            $("#paymentPoint2").text(makePrice(orderPriceSum));
            $("#savePoint").text(makePrice(PointBenefitAmount));

            $("#finalOrder").on("click", function() {
				
            	var recipientName = document.getElementById("recipientName").innerText;
            	var recipientPhone = document.getElementById("recipientPhone").innerText;
            	var deliveryPostcode = document.getElementById("deliveryPostcode").innerText;
            	var deliveryAddress = document.getElementById("deliveryAddress").innerText;
            	var deliveryDetailAddress = document.getElementById("deliveryDetailAddress").innerText;
            	var deliveryExtraAddress = document.getElementById("deliveryExtraAddress").innerText;
            	var deliveryCharge = document.getElementById("deliveryCharge").innerText.replace(/[^0-9]/g,"");
            	
            	console.log("recipientName : " + recipientName);
            	console.log("recipientPhone : " + recipientPhone);
            	console.log("deliveryPostcode : " + deliveryPostcode);
            	console.log("deliveryAddress : " + deliveryAddress);
            	console.log("deliveryDetailAddress : " + deliveryDetailAddress);
            	console.log("deliveryExtraAddress : " + deliveryExtraAddress);
            	console.log("deliveryCharge : " + deliveryCharge);
            	
            	var finalPoint = memberPoint - orderPriceSum + PointBenefitAmount;
                
                cartNo =[];
                $("[data-cartNo]").each(function(index) {
                	cartNo.push($(this).data("cartno"));
                });
                            console.log(cartNo);

                if (finalPoint >= 0) {
                    $.ajax({
                        url: "orderFinal",
                        type: "post",
                        data: {
                            memberPoint: finalPoint,
                            cartNos: cartNo,
                            recipientName : recipientName,
                            recipientPhone : recipientPhone,
                            deliveryPostcode : deliveryPostcode,
                            deliveryAddress : deliveryAddress,
                            deliveryDetailAddress : deliveryDetailAddress,
                            deliveryExtraAddress : deliveryExtraAddress,
                            deliveryCharge : deliveryCharge
                        },
                        success: function() {
                            console.log("주문완료");
                        },
                        error: function() {
                            console.log("주문실패");
                            alert("주문이 완료되었습니다.");
                            location.href = "/";
                        }
                    });
                } else {
                    console.log("불가능");
                    alert("포인트가 부족합니다");
                }
            });
        });
	
	function makePrice(data){
	return data.toString()
				.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',')+"원";
}
	
</script>
<body>
<div class="container mt-5">
    <div class="row justify-content">
        <div class="col-md-8">
            
             <div class="accordion" id="accordionExample">
                <!-- Delivery Address Section -->
                <div class="accordion-item">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDeliveryAddress" aria-expanded="true" aria-controls="collapseDeliveryAddress">
                            <b>받는사람 정보</b>
                            <span class="accordion-button-right"></span>
                        </button>
                    <div id="collapseDeliveryAddress" class="accordion-collapse collapse show" aria-labelledby="deliveryAddressHeading" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="recipientInfo" style="display: flex; position: relative;">
                                <b>
                                	<span id="recipientName">${loginMember.memberId}</span>
                                </b>  
                                <span style="margin-left: auto;">
                                    <button class="btn btn" data-bs-toggle="modal" data-bs-target="#addressModal" style="background-color: #a2d2ff; color: white; font-weight:bold;">변경</button>
                               	</span>
                            </div>
                            <div >
                                <div class="deliveryAddressInfo">
	                                <span id="deliveryAddress">${loginMember.memberAddress}</span>
	                                <span id="deliveryExtraAddress">${loginMember.memberExtraAddress}</span>
	                                <span id="deliveryDetailAddress">${loginMember.memberDetailAddress}</span>
	                                <span>(<span id="deliveryPostcode">${loginMember.memberPostcode}</span>)</span>
                                </div>
                              
                            </div>
                            <div id="recipientPhone" name="recipientPhone">${loginMember.memberPhone}</div>
                        </div>
                    </div>
                </div>
                <div class="accordion" id="accordionExample2">
                <!-- Customer Section -->
                <div class="accordion-item mt-3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCustomer" aria-expanded="false" aria-controls="collapseCustomer">
                            <b>구매자 정보</b>
                            <span class="accordion-button-right"></span>
                        </button>
                    <div id="collapseCustomer" class="accordion-collapse collapse" aria-labelledby="customerHeading" data-bs-parent="#accordionExample2">
                        <div class="accordion-body">
                            <div><b>${loginMember.memberId}</b></div>
                            <div>${loginMember.memberPhone}</div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            
            <div class="accordion" id="accordionExample3">
                <!-- Delivery Address Section -->
                <div class="accordion-item mt-3">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseorderItemInfo" aria-expanded="false" aria-controls="collapseorderItemInfo">
                            <b>주문 상품</b>
                            <span class="accordion-button-right"></span>
                        </button>
                    <div id="collapseorderItemInfo" class="accordion-collapse collapse show" aria-labelledby="orderItemInfoHeading" data-bs-parent="#accordionExample3">
                        <div class="accordion-body">
	                        		<c:forEach var="cartItems" items="${cartItems}" varStatus="loop">
                        	<div class="orderItemInfoArea row" data-cartNo="${cartItems.cartNo}">
	                        	<span class="col-md-2">
	                        		<a href="itemDetail?itemNo=${cartItems.itemNo }"><img class="itemImg" src="../${cartItems.imgFilePath}" alt="" /></a>
	                        	</span>
	                        	<div class="col-md-10">
	                        		<p></p>
								        <a href="itemDetail?itemNo=${cartItems.itemNo}"><span style="color: #5E5E5E; font-weight: bold;">${cartItems.itemTitle}</span></a>
		                        	<div>
		                        		<span class="orderItemInfoQuantity">주문수량 : ${cartItems.cartQuantity}개</span>
		                        	</div>
		                        	<span class="orderItemInfoPrice" id="orderItemInfoPrice_${loop.index }" >
		                        		<f:formatNumber value="${(cartItems.itemPrice - (cartItems.itemPrice * cartItems.itemDiscount / 100))*cartItems.cartQuantity}" pattern="#,###원"></f:formatNumber>
		                        	</span>
	                        	</div>
                        	</div>
								    </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="col-md-4">
            <div class="accordion" id="accordionExample4">
                <!-- Customer Section -->
                <div class="accordion-item">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePaymentDetail" aria-expanded="true" aria-controls="#collapsePaymentDetail">
                            <span><b>결제 상세</b></span>
                            <span class="accordion-button-right"><b id="paymentDetailPrice" style="color: #6b90dc; font-size: 18px; margin-right: 5px;" ></b></span>
                        </button>
                    <div id="collapsePaymentDetail" class="accordion-collapse collapse show" aria-labelledby="PaymentDetailHeading" data-bs-parent="#accordionExample4">
                        <div class="accordion-body">
                            <div class="paymentDetailContents">
                                <div class="paymentDetailContentsArea">
                                        <span><b>주문금액</b></span>
                                        <span class="paymentDetailOrderPrice"><b id="paymentDetailOrderPrice"></b></span>
                                </div>
                                <ul class="paymentDetailOrderPriceUl">
                                    <li class="paymentDetailOrderPriceLi">
                                        <div class="OrderSummaryArea">
                                            <span>상품금액</span>
                                            <span class="accordion-body-right" id="OrderSummaryItemPrice"></span>
                                        </div>
                                    </li>
                                    <li class="paymentDetailOrderPriceLi">
                                        <div class="OrderSummaryArea">
                                            <span>배송비</span>
                                            <span class="accordion-body-right" id="deliveryCharge">
                                            	<f:formatNumber value="${deliveryCharge}" pattern="#,###원"></f:formatNumber></span>
                                        </div >
                                    </li>
                                    <li class="paymentDetailOrderPriceLi">
                                        <div class="OrderSummaryArea">
                                            <span>쿠폰할인</span>
                                            <span class="accordion-body-right">0원</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="accordion" id="accordionExample5">
                <div class="accordion-item mt-3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePointBenefit" aria-expanded="false" aria-controls="#collapsePointBenefit">
                            <b>포인트 혜택</b>
                            <span class="accordion-button-right">
                            	<b id="PointBenefitAmount" style="color: #6b90dc; font-size: 18px; margin-right: 5px;"><f:formatNumber value="${buyItemPoint}" pattern="#,###원"></f:formatNumber></b></span>
                        </button>
                    <div id="collapsePointBenefit" class="accordion-collapse collapse" aria-labelledby="collapsePointBenefitHeading" data-bs-parent="#accordionExample5">
                        <div class="accordion-body">
                            <div class="PointBenefitContents">
                                <div class="PointBenefitContentsArea">
                                        <b>구매적립</b>
                                        <span class="accordion-body-right"><b><f:formatNumber value="${buyItemPoint}" pattern="#,###원"></f:formatNumber></b></span>
                                </div>
                                <ul class="pointBennefitUl" style="border-left: 5px solid #efeff0;">
                                    <li class="pointBennefitLi">
                                        <div class="OrderSummaryArea">
                                            <span>기본적립</span>
                                            <span class="accordion-body-right">
                                            	<f:formatNumber value="${buyItemPoint}" pattern="#,###원"></f:formatNumber>
                                            </span>
                                        </div>
                                    </li>
                                    <li class="pointBennefitLi">
                                        <div class="OrderSummaryArea">
                                            <span>리뷰적립</span>
                                            <span class="accordion-body-right">0원</span>
                                        </div >
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="color:#5E5E5E; font-weight: bold;">
			<div style="margin-top: 50px; margin-left: 10px;">내 포인트 : <span id="memberPoint"><f:formatNumber value="${loginMember.memberPoint}" pattern="#,###원"></f:formatNumber></span></div>
			<div style="margin-left: 10px;">
				<div>결제금액 : -<span id="paymentPoint2"></span></div>
				<div>적립포인트 : +<span id="savePoint"></span></div>
			</div>	
				<div  style="margin-left:10px; font-size: 20px; margin-top: 20px; color: #6b90dc; font-weight: bold;">결제후 포인트 : <span id="paymentedPoint"></span></div>
			</div>
            <div class="text-center mt-3">
                <button type="button" class="btn btn" id= "finalOrder" style="margin-top:20px; background-color: #a2d2ff; color: white; font-weight:bold;">결제하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 모달 시작 -->
<div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주소 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- 모달 내용 -->
        <div class="form-group">
        	<div style="margin-bottom: 5px">
        		<input type="text" class="form-control col-md-12" id="recipientNameModal" name= "recipientNameModal" placeholder="받는 이"/>
        	</div>
            <div class="input-group">
                <input type="text" class="form-control col-md-6" id="deliveryPostcodeModal" name="deliveryPostcodeModal" placeholder="우편번호" readonly>
                <input type="button" class="form-control col-md-3" onclick="kakaoAddressApi()" value="우편번호 찾기"
                style="margin-left:35px; background-color: #a2d2ff; color:white; font-weight:bold; border-color: #ced4da;">
                <br>
            </div>
            <input type="text" class="form-control col-md-12" id="deliveryAddressModal" name="deliveryAddressModal" placeholder="주소" style="margin-top: 5px;" readonly>
            <div class="input-group" style="margin-top: 5px;">
                <input type="text" class="form-control col-md-8" id="deliveryDetailAddressModal" name="deliveryDetailAddressModal" placeholder="상세주소">
                <input type="text" class="form-control col-md-4" id="deliveryExtraAddressModal" name="deliveryExtraAddressModal" placeholder="참고항목"
                style="margin-left: 40px;" readonly>
            </div>
            <div class="input-group">
                <span id="valid_memberDetailAddressMessageModal"></span>
                <span style="display: none;" id="memberDetailAddressMessageModal">상세주소는 필수 입력 값입니다.</span>
            </div>
            <div style="margin-top: 5px">
        		<input type="text" class="form-control col-md-12" id="recipientPhoneModal"  maxlength="13" name="recipientPhoneModal" placeholder="연락처"/>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="changeDeliveryAddress()" data-bs-dismiss="modal">저장</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 -->

<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>
