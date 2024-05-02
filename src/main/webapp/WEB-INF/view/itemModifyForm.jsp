<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PS TEAM : MODIFY PRODUCT</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<style>
.category-row, .input-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.category, .input-field {
	text-align: center;
}

.category-row {
	color: #0077b6;
	font-weight: bold;
	font-size: 18px;
	margin-bottom: 30px;
}

.input-row {
	padding-bottom: 10px;
	border-bottom: 1px solid #edede9;
}

.input-field {
	height: 32px;
	margin-top: 20px;
	text-align: center;
	border: 1px solid #edede9;
	font-weight: bold;
	color: #735751;
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

.product-item {
	width: 100%;
	box-sizing: border-box;
}

.itemSearchArea {
	display: flex;
	margin-bottom: 50px;
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
.col-md-1,.col-md-2,.col-md-3{
	text-align: center;
}
input::placeholder{
	color: #adb5bd;
	font-weight: bold;
	font-size: 17px;
}
</style>
<script>
$(function() {
    // 기존에 등록된 이벤트 핸들러 제거
    $(document).off("keyup", ".itemPrice");

    // 새로운 이벤트 핸들러 등록
    $(document).on("keyup", ".itemPrice", function() {
        var inputValue = $(this).val();

        if (inputValue !== undefined) {
            var formattedValue = inputValue.replace(/[^\d]/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            $(this).val(formattedValue);
        }
    });
    
    $("#addItem").on("click",function(){
    	console.log("test")
    })
    
	// 수정 버튼 눌렀을때 폼 데이터 불러와서 ajax로 전달
    $(document).on("click", ".formBtn", function(event) {
        event.preventDefault();
        var form = $(this).closest(".input-row");
        var itemTitle = form.find("#itemTitle").val();
    	// 수정된 부분: .itemPrice 클래스를 가진 input 요소를 찾을 때 수정
        var itemPriceInput = form.find(".itemPrice");
        var itemPrice = itemPriceInput.val().replace(/[^\d]/g, "");
        
        var itemDiscount = form.find("#itemDiscount").val();
        var itemImg_path = form.find("#itemImg_path").val();
        var itemNo = $(this).val();

        var imgFile = form.find("#imgFile")[0].files[0];

        // FormData 객체 생성
        var formData = new FormData();
        formData.append("itemTitle", itemTitle);
        formData.append("itemPrice", itemPrice);
        formData.append("itemDiscount", itemDiscount);
        formData.append("itemNo", itemNo);
        formData.append("imgFile", imgFile);

        $.ajax({
            url : "itemModifyOk",
            type : "POST",
            data : formData,
            processData: false,
            contentType: false,
            success : function(data) {
                console.log(data);
            },
            error : function(error) {
                alert("수정이 완료 되었습니다.");
                setTimeout("location.reload()", 2000);
            }
        })
    })
})
	$(function() {
		$("#itemSearchBtn").on("click", function() {
			var searchKeyword = $("#itemSearch").val();
			console.log(searchKeyword);

			$.ajax({
				url : "searchItem", // 검색을 처리할 컨트롤러의 매핑 주소
				type : "GET",
				data : {
					itemTitle : searchKeyword
				},
				success : function(data) {
					// 서버에서 받아온 데이터를 이용하여 동적으로 화면을 갱신
					console.log("에러");
					updateProductItems(data);
				},
				error : function(data) {
				}
			});
		});

		function formatNumber(price) {
		    return new Intl.NumberFormat('ko-KR').format(price);
		}
		// 동적으로 화면을 갱신하는 함수
		function updateProductItems(data) {
			// product-item 영역 초기화
			$(".product-item").empty();
			// 받아온 데이터로 product-item 영역 갱신
			var categoryRow = $("<div class='category-row'>"
					+ "<div class='category col-md-2'>이미지</div>"
					+ "<div class='category col-md-3'>상품명</div>"
					+ "<div class='category col-md-2'>상품가격</div>"
					+ "<div class='category col-md-1'>할인률</div>"
					+ "<div class='category col-md-3'>이미지 경로</div>"
					+ "<div class='category col-md-1'>수정</div>" + "</div>");
			$(".product-item").prepend(categoryRow);
			for (var i = 0; i < data.length; i++) {
				var item = data[i];
				var newRow = $("<div class='input-row'></div>");

				newRow
						.append("<div class='col-md-2' style='display: grid; place-items: center;'>"
								+ "<a href='itemDetail?itemNo="
								+ item.itemNo
								+ "'><img src='../" + item.imgFilePath +
                "' alt='' style='width: 70px; height: 70px;'/></a></div>");
				newRow
						.append("<div class='col-md-3'><input type='text' class='input-field' style='width: 290px;' " +
                "id='itemTitle' name='itemTitle' value='" + item.itemTitle + "'></div>");
				newRow
				.append("<div class='col-md-2'><input type='text' class='input-field itemPrice' " +
		                "name='itemPrice' value='" + formatNumber(item.itemPrice) + "' style='width:150px;'></div>");
				newRow
						.append("<div class='col-md-1'><input type='text' class='input-field' " +
                "id='itemDiscount' name='itemDiscount' value='" + item.itemDiscount + "' style='width:50px;'>"
                +"<span style='font-weight: 900; color:#735751;'>%</span>"
                + "</div>");
				
				newRow
						.append("<div class='col-md-3'><input type='file' class='input-field' " +
                "id='imgFile' name='imgFile' value='" + item.imgFileName + "' style=width 300px;''></div>");
				newRow
						.append("<div class='input-field col-md-1' style='border: none;'>"
								+ "<button type='button' value='" + item.itemNo + "' class='formBtn btn btn-primary' " +
                "style='width: 65px; height: 35px;'>수정</button></div>");

				$(".product-item").append(newRow);
			}
		}
	});
	function addItemOk(){
		alert("상품이 추가되었습니다");
		return true;
	}
</script>
</head>
<body>
	<div class="pageTitle">
		<h1 style="font-size: 55px; color: #5E5E5E">MODIFY PRODUCT</h1>
	</div>
	<div class="container mt-5">
		<div class="itemSearchArea">
			<input type="text" name="itemSearch" id="itemSearch"
				placeholder="상품명을 입력해주세요." />
			<button class="btn btn-primary" id="itemSearchBtn"
				style="width: 65px; height: 40px; margin-left: 10px;">검색</button>
		</div>
		<div class="product-item" style="padding-top:20px; border-top: 2px solid #5E5E5E;">
		<div class="col-md-12" style="text-align:right; margin-bottom: 50px;">
			<span>
				<button class="btn btn-success" id="addItem" data-bs-toggle="modal" data-bs-target="#addItemModal">상품 추가</button>
			</span>
		</div>
			<div class="category-row">
				<div class="category col-md-2">이미지</div>
				<div class="category col-md-3">상품명</div>
				<div class="category col-md-2">상품가격</div>
				<div class="category col-md-1">할인률</div>
				<div class="category col-md-3">이미지 경로</div>
				<div class="category col-md-1">수정</div>
			</div>
			<c:forEach var="item" items="${item}">
				<div class="input-row">
					<div class="col-md-2" style="display: grid; place-items: center;">
						<a href="itemDetail?itemNo=${item.itemNo}"><img
							src="..${item.imgFilePath}" alt=""
							style="width: 70px; height: 70px;" /></a>
					</div>
					<div class="col-md-3">
						<input type="text" class="input-field"
							id="itemTitle" name="itemTitle" value="${item.itemTitle}"  style="width: 290px;">
					</div>
					<div class="col-md-2">
						<input type="text" class="input-field itemPrice"
							name="itemPrice" value="<f:formatNumber value="${item.itemPrice}" pattern="#,###"></f:formatNumber>"  style="width: 150px;" id="itemPrice">
					</div>
					<div class="col-md-1">
						<input type="text" class="input-field"
							name="itemDiscount" value="${item.itemDiscount}"  style="width: 50px;" id="itemDiscount" >
						<span style="font-weight: 900; color:#735751;">%</span>
					</div>
					<div class="col-md-3">
						<input type="file" class="input-field" id="imgFile"  
							name="imgFile" value="${item.imgFileName}" style="width: 300px;">
							<input type="hidden" name="imgFileName" value="${item.imgFileName}" />
					</div>
					<div class="input-field col-md-1" style="border: none;">
						<button type="button" value="${item.itemNo}" id="formBtn"
							class="formBtn btn btn-primary" value="${item.itemNo}"
							style="width: 65px; height: 35px;">수정</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
<!-- 모달영역		모달영역		모달영역		모달영역		모달영역		모달영역		모달영역		모달영역		모달영역-->
	
	<div class="modal fade" id="addItemModal" tabindex="1" role="dialog" aria-labelledby="exampleModalLebel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title" id="exampleModalLebel">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-lebel="Close" ></button>
					</div>
				</div>
				<div class="modal-body">
				<form action="addItem" method="POST" enctype="multipart/form-data">
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
		            <input type="text" class="form-control" id="itemDiscount" name="itemDiscount" min="0" max="2" value="0">
		        </div>
		        <div class="form-group">
		            <label for="productImage">상품 이미지</label>
		            <input type="file" class="form-control" id="imgFile" name="imgFile" >
		            <input type="text" name="imgFile" id="imgFile"/>
		        </div>
		        <div class="text-center">
		       	 	<button type="submit" class="btn btn-primary" onclick="addItemOk()" style="margin-top: 20px;">상품 추가</button>
		        </div>
        </form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>