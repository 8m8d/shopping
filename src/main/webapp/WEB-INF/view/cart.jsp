<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PS TEAM : CART</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 네비게이션  -->
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
</head>
<style>
.category-row, .input-row, .buyItem-row,.checkbox-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.category-row {
	color: #0077b6;
	margin-top:25px;
	margin-bottom:25px;
	font-weight: bold;
	font-size: 18px;
	word-break: keep-all; /* 영역 넘어가도 글자수 줄 안바꾸고 옆으로 써지게 함 */
}

.input-row {
	padding-bottom: 10px;
	border-bottom: 1px solid #edede9;
}

.category, .input-field {
	text-align: center;
}

.input-field {
	height: 30px;
	margin-top: 20px;
	text-align: center;
}

#itemSearch {
	width: 450px;
	height: 40px;
	text-align: center;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.product-item, .product-category {
	width: 100%;
	box-sizing: border-box;
	background-color: #F5FBFF;
}
.checkbox-row{
	width: 100%;
	margin-bottom: 50px;
}
.buyArea {
	width: 100%;
	box-sizing: border-box;
}

#itemTitle {
	text-overflow: ellipsis;
}

input::-webkit-inner-spin-button {
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
}

.totalPrice {
	font-weight: bold;
}

.buyItem-row {
	margin-top: 50px;
	font-size: 30px;
	font-weight: bold;
}

#buyBtn {
	background-color: white;
	color: #5C5C5C;
	width: 250px;
	height: 50px;
	margin-top: -20px;
	font-size: 20px;
	font-weight: bold;
	margin-left: 40px;
}

#buyTotalArea {
	margin-top: 20px;
	font-size: 20px;
	font-weight: bold;
	float: right;
	margin-right: 250px;
	color: white;
}

#buyBtnArea {
	position: fixed;
	width: 100%;
	height: 80px;
	background-color: #007bff;
	bottom: 0;
}

#buyTotalPrice {
	font-size: 30px;
	margin-left: 15px;
}

.badge {
	color: white;
	background-color: red;
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
input[type="checkbox"]{
	zoom:1.5;
}
/* .product-item{
	max-height: 300px;
	overflow-y: auto;
	overflow-x:hidden;
} */
.checkedPriceInfo{
	font-size: 17px;
}
.buyItem-row{
	color: #5C5C5C;
	font-size: 20px;
}
#finalTotalPriceText{
	text-align: right;
}
.totalPriceArea{
	display: grid; 
	place-items: center;
	text-align: center;
	border-left: 2px solid lightgray;
}
.deliveryInfo{
	text-align: right;
	margin-left: -30px;
}
.myPointArea{
	margin-left: auto; 
	text-align: right;
	font-weight: bold;
	color: #5C5C5C;
	font-size: 17px;
}
</style>
<script>
$(document).ready(function() {
    // 페이지 로딩 시 모든 체크박스를 선택 상태로 만듭니다.
    $("[id^='cartCheckbox']").prop("checked", true);

    // "전체선택" 체크박스 변경 이벤트 처리
    $("#checkboxAll").change(function () {
        var isChecked = $(this).prop("checked");

        // "전체선택" 체크박스를 기반으로 다른 모든 체크박스의 checked 속성 설정
        $("[id^='cartCheckbox']").prop("checked", isChecked);
    });

    // 개별 체크박스 변경 이벤트 처리
    $("[id^='cartCheckbox']").change(function () {
        // 개별 체크박스 중 하나라도 체크 해제되면 "전체선택" 체크박스도 체크 해제
        if (!$(this).prop("checked")) {
            $("#checkboxAll").prop("checked", false);
        }
    });
	
    
    // "전체선택" 체크박스를 기본으로 선택 상태로 만듭니다.
    $("#checkboxAll").prop("checked", true);
});

	$(function () {
	    // "전체선택" 체크박스 변경 이벤트 처리
	    $("#checkboxAll").change(function () {
	        var isChecked = $(this).prop("checked");
	
	        // "전체선택" 체크박스를 기반으로 다른 모든 체크박스의 checked 속성 설정
	        $("[id^='cartCheckbox']").prop("checked", isChecked);
	    });
	
	    // 개별 체크박스 변경 이벤트 처리
	    $("[id^='cartCheckbox']").change(function () {
	        // 개별 체크박스 중 하나라도 체크 해제되면 "전체선택" 체크박스도 체크 해제
	        if (!$(this).prop("checked")) {
	            $("#checkboxAll").prop("checked", false);
	        }
	    });
	});
	
	
</script>

<body>
		<div class="pageTitle">
			<h1 style="font-size: 55px; color: #5E5E5E">MY CART</h1>
		</div>
		<div class="container mt-5">
			<div class="checkbox-row">
				    <div class="col-md-2" style="display: flex; align-items: center; zoom:1.3; ">
        <input type="checkbox" name="" id="checkboxAll" /><span style="margin-left: 5px; font-size: 14px; font-weight: bold; color: #5C5C5C;">전체선택</span>
				</div>
				<div class="checkbox col-md-1">
					<button type="button" class="btn btn" id="selectDeleteBtn" style="width:110px; border: 1px solid #ced4da;">
							<svg style="margin-left: -7px;" width="16" height="16" viewBox="0 0 16 16" fill="none" class="ico_delete--2NfiVYXLHf">
						<path d="M13 2.5l.707.707-4.646 4.647 4.646 4.646-.707.707-4.646-4.646-4.647 4.646L3 12.5l4.647-4.646L3 3.207l.707-.707 4.647 4.647L13 2.5z" fill="#BDC0C6" /></svg>
							<span class="none_280--1hzCgfasqV" style=" color: #5C5C5C; font-weight: bold;">선택삭제</span>
						</button>
				</div>
			</div>
			<div class="product-category">
				<div class="category-row">
					<div class="category col-md-1"></div>
					<div class="category col-md-2">이미지</div>
					<div class="category col-md-3">상품명</div>
					<div class="category col-md-2">상품가격</div>
					<div class="category col-md-2">수량</div>
					<div class="category col-md-1">구매금액</div>
					<div class="category col-md-1"></div>
				</div>
			</div>
			<div class="product-item">
				<c:forEach var="userCart" items="${dto}" varStatus="loop">
					<div class="input-row">
						<div class="col-md-1" style="display: grid; place-items: center;">
							<input type="checkbox" class="chkbox" name="" id="cartCheckbox_${loop.index}" value="${userCart.cartNo }" data-cartNo="${userCart.cartNo}" />
						</div>
						<div class="col-md-2" style="display: grid; place-items: center;">
							<a href="itemDetail?itemNo=${userCart.itemNo}"><img
								src="..${userCart.imgFilePath}" alt=""
								style="width: 70px; height: 70px;" /></a>
						</div>
						<div class="input-field col-md-3" id="itemTitle_${loop.index}"
							name="itemTitle" style="font-weight: bold;">${userCart.itemTitle}</div>
						<div class="input-field col-md-2" name="itemPrice">
							<div>
								<c:if test="${userCart.itemDiscount > 0}">
									<span style="font-weight: bold; color: #6d6875">${userCart.itemDiscount}%
									</span>
									<span style="text-decoration: line-through;"> <f:formatNumber value="${userCart.itemPrice}" pattern="#,###"> </f:formatNumber></span>
								</c:if>
							</div>
							<c:set var="discountedPrice"
								value="${userCart.itemPrice - (userCart.itemPrice * userCart.itemDiscount / 100)}" />
							<span id="itemPrice_${loop.index}"
								style="font-weight: bold; color: red;"> <f:formatNumber
									value="${discountedPrice}" pattern="##,###원" />
							</span>
						</div>
						<div class="input-field col-md-2">
							<input type="button" id="minus" value="-"
								onclick="decrementValue('cartQuantity_${loop.index}')"
								style="width: 35px; height: 38px; border: 0px"> <input
								type="number" class="cartQuantity" id="cartQuantity_${loop.index}"
								value="${userCart.cartQuantity}"
								style="width: 50px; height: 38px; margin: -5px; border: 1px solid #eff1f5; text-align: center;">
							<input type="button" id="plus" value="+"
								onclick="incrementValue('cartQuantity_${loop.index}')"
								style="width: 35px; height: 38px; border: 0px">
						</div>
						<div class="input-field col-md-1 totalPrice"
							id="totalPrice_${loop.index}" name="totalPrice"></div>
						<div class="input-field col-md-1">
							<button id="cartItemDeleteBtn_${loop.index}"
								class="cartItemDeleteBtn" style="border: none; background-color: white; color:#8a817c; font-weight: bold;"
								value="${userCart.cartNo}" >X</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container mt-5" style="padding-bottom: 100px;">
			<div class="buyArea">
				<div style="border-top: 2px solid lightgray;"></div>
				<div class="myPointArea"><span>MY POINT : <f:formatNumber value="${loginMember.memberPoint}" pattern="#,###원"></f:formatNumber></span></div>
				<div class="buyItem-row">
				<div class="col-md-6"></div>
					<div class="col-md-2" id="finalTotalPriceText"
						><span>선택 상품금액</span>
						<div><span id="checkedItemPrice"></span></div>						
					</div>
					<div class="checkedPriceInfo col-md-1" style="display: grid; place-items: center;">
						<svg width="15" height="14" viewBox="0 0 15 14" fill="none"
							xmlns="http://www.w3.org/2000/svg">
							<path fill="#C7C7C7" d="M.502 6h14v2h-14z"></path>
							<path fill="#C7C7C7" d="M6.502 0h2v14h-2z"></path></svg>
					</div>
					<div class="deliveryInfo col-md-1">
						<span>배송비</span>
						<span id="deliveryPrice"></span>
					</div>
					<div class="totalPriceArea col-md-2">
						<span>주문금액</span>
						<span id="totalPriceSum" style="color: #6b90dc;"></span>
						<span id="buyItemPoint" style="font-size: 13px; color:#6b90dc;"></span>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="text-center" id="buyBtnArea">
				<div id="buyTotalArea">
					<span>총 주문금액 </span> <span id="buyTotalPrice"></span> <span>
						<button type="button" class="btn btn-primary" id="buyBtn">
							BUY NOW <span class="badge" id="badge" style="border-radius: 20px;"></span>
						</button>
					</span>
				</div>
			</div>
		</div>
<!-- 	<iframe id="iframeParam" name="iframeParam" style="display: none;" /> -->
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
	<div style="width: 100%; height: 80px;"></div>
</body>
<script>

$(function () {
    $(".cartItemDeleteBtn").on("click", function () {
        // "this"를 통해 현재 클릭된 버튼에 대한 정보를 가져옴
        var index = $(this).attr('id').split('_')[1]; // 버튼의 id에서 index 추출
        var cartNo = document.getElementById("cartItemDeleteBtn_" + index).value;
        if(confirm("장바구니에서 해당 상품을 삭제 하시겠습니까?")){
        	$.ajax({
        		url : "cartItemDelete",
        		type : "POST",
        		data : {checkArr : [cartNo]},
        		success : function(){
        			location.reload();
        		},
        		error : function(){
        			console.log("삭제 에러");
        		}
        	})
        }
    });
});

$(function(){
		$("#selectDeleteBtn").on("click",function(){
			var checkArr = [];
			$("input[class='chkbox']:checked").each(function(){
				checkArr.push($(this).val());
// 				console.log("체크된 상품 번호 : " + checkArr);
			})
			if(checkArr.length <= 0){
				alert("삭제하실 상품을 선택해주세요.")
			}else if(confirm("선택하신 "+checkArr.length + "개의 상품을 장바구니에서 삭제하시겠습니까?")){
				$.ajax({
					url: "cartItemDelete",
					type: "POST",
					data:{checkArr : checkArr},
					success : function(){
						console.log("삭제성공")
						location.href = "cart"
					},
					error : function(){
						console.log("삭제 에러")
					}
				})
			}
	})
	
	$("#buyBtn").on("click",function(){
		var deliveryPrice = document.getElementById("deliveryPrice").innerText.replace(/[^0-9]/g, "");
		var buyItemPoint = document.getElementById("buyItemPoint").innerText.replace(/[^0-9]/g,"");
		var checkArr = new Array();
		$("input[class='chkbox']:checked").each(function(){
			checkArr.push($(this).attr("data-cartNo"));
		})
		if(checkArr != null && checkArr.length > 0){
			console.log("주문리스트 : " + checkArr);
			$.ajax({
				url : "cartBuyItem",
				type: "post",
				data:{
						chkbox : checkArr,
						deliveryCharge : deliveryPrice,
						buyItemPoint : buyItemPoint
						},
				success:function(response){
					console.log("성공")
					location.href = "cartBuyItem"
					
				},
				error:function(xhr,status,error){
					console.error("에러");
					location.href = "cartBuyItem"
				}
			})
		}else{
			alert("주문하실 상품을 선택해 주세요.");
		}
	})
})

// 상품수량 텍스트칸에서 변경시 포커스 이동하면 ajax로 db수량 변경
$(function(){
	$(".cartQuantity").on("blur",function(){
		var id = $(this).attr("id");
		var index = id.split('_')[1];
	    
	    var cartNo = $("#cartCheckbox_" + index).data("cartno");
	    console.log(cartNo);
	    
	    $.ajax({
	    	url: "cartQuantityUpdate",
	    	type: "post",
	    	data: {
	    			cartNo : cartNo,
	    			cartQuantity : this.value},
	    	success: function(){
	    		console.log("성공");
	    	},error : function(){
	    		console.log("실패");
	    	}
	    })
	})
})

// 플러스 버튼 클릭시 db에 있는 수량 ajax로 변경
function incrementValue(id) {
    var input = document.getElementById(id);
    var value = parseInt(input.value, 10);
    value = isNaN(value) ? 0 : value;
    value++;
    input.value = value;
    
    var index = id.split('_')[1];
    
    var cartNo = document.getElementById("cartCheckbox_"+index).getAttribute("data-cartNo");
    console.log(cartNo);
    
    $.ajax({
    	url: "cartQuantityUpdate",
    	type: "post",
    	data: {
    			cartNo : cartNo,
    			cartQuantity : input.value},
    	success: function(){
    		console.log("성공");
    	},error : function(){
    		console.log("실패");
    	}
    })
}
// 마이너스 버튼 클릭 시 db에 있는 수량 ajax로 변경
function decrementValue(id) {
    var input = document.getElementById(id);
    var value = parseInt(input.value, 10);
    value = isNaN(value) ? 0 : value;
    if (value > 1) {
        value--;
        input.value = value;
    }
    
	var index = id.split('_')[1];
    
    var cartNo = document.getElementById("cartCheckbox_"+index).getAttribute("data-cartNo");
    console.log(cartNo);
    
    $.ajax({
    	url: "cartQuantityUpdate",
    	type: "post",
    	data: {
    			cartNo : cartNo,
    			cartQuantity : input.value},
    	success: function(){
    		console.log("성공");
    	},error : function(){
    		console.log("실패");
    	}
    })
}
// 숫자 콤마 찍기
function makePrice(data){
	return data.toString()
				.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
}
$(function () {
    setInterval(function () {
        var totalSum = 0;
        var checkedSum = 0;

        $("[id^='totalPrice_']").each(function (index) {
            var itemPriceText = document.getElementById("itemPrice_" + index).innerText;
            var itemPrice = parseFloat(itemPriceText.replace(/[^0-9]/g, ''));
            var qty = document.getElementById("cartQuantity_" + index).value;
            var totalPrice = itemPrice * qty;

            if (qty <= 0) {
                alert("1개 이상부터 주문 가능합니다");
                document.getElementById("cartQuantity_" + index).value = 1;
            } else if (qty > 10000) {
                alert("10,000개 이하로 구매하실 수 있습니다");
                document.getElementById("cartQuantity_" + index).value = 10000;
            }

            document.getElementById("totalPrice_" + index).innerText = makePrice(totalPrice)
            totalSum += totalPrice;

            var checkboxId = "cartCheckbox_" + index;
            var isChecked = $("#" + checkboxId).prop("checked");
            if (isChecked) {
                checkedSum += totalPrice;
            }
        });
        
        var isAnyCheckboxSelected = $("[id^='cartCheckbox']:checked").length > 0;
        var deliveryPrice = (checkedSum <= 30000 && isAnyCheckboxSelected == true) ? 3000 : 0;
        
        checkedSum += deliveryPrice;
        
        var formattedCheckedSum = makePrice(checkedSum);
		var checkedItemPrice = checkedSum - deliveryPrice;
        // Format and display the total sum with delivery
        var inputSumPrice = formattedCheckedSum + '원';
        
		var buyItemPoint = makePrice((Math.round(checkedItemPrice*0.01))+'원')
        
		makePrice(inputSumPrice) + '원'
		$("#deliveryPrice").html(makePrice(deliveryPrice));
		$("#totalPriceSum").html(makePrice(inputSumPrice));
		$("#buyTotalPrice").html(makePrice(inputSumPrice));
		$("#checkedItemPrice").html(makePrice(checkedItemPrice)+'원');
		$("#buyItemPoint").html("(적립예정 " + buyItemPoint + ")");
		
		
        // 체크된 상품 개수 확인해서 뱃지에 넣기
        var checkedCount = $("[id^='cartCheckbox']:checked").length;
		$("#badge").html(checkedCount);
		
    }, 100);
    
});
</script>
</html>