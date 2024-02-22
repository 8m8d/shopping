<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>PS TEAM : ADD PRODUCT</title>
<!-- 네비게이션  -->
<jsp:include page="/WEB-INF/view/nav.jsp"/>
</head>
<style>
label{
	color: #5C5C5C;
	font-weight: bold;
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
<script>
$(function(){
	$("#itemPrice").on("input", function() {
		var itemPrice = $(this).val().replace(/[^\d]/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		$(this).val(itemPrice);
	});
});

	function addItemOk(){
		alert("상품이 추가되었습니다");
		return true;
	}
</script>
<body>
	<div class="pageTitle" >
    <h1 class="text-center mb-4" style="font-size: 55px; color:#5E5E5E">ADD PRODUCT</h1>
    </div>
<div class="container mt-5">
    <form action="/addItem" method="post" enctype="multipart/form-data" onsubmit="return addItemOk();">
        <div class="form-group">
            <label for="productName">상품명</label>
            <input type="text" class="form-control" id="itemTitle" name="itemTitle" required>
        </div>
        <div class="form-group">
            <label for="productPrice">상품가격</label>
            <input type="text" class="form-control" id="itemPrice" name="itemPrice" required>
        </div>
        <div class="form-group">
            <label for="discountRate">할인률(%)</label>
            <input type="text" class="form-control" id="itemDiscount" name="itemDiscount" min="0" max="100" value="0">
        </div>
        <div class="form-group">
            <label for="productImage">상품 이미지</label>
            <input type="file" class="form-control" id="imgFile" name="imgFile" >
        </div>
        <div class="text-center">
        <button type="submit" class="btn btn-primary">상품 추가</button>
        </div>
    </form>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>