<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head><!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>PS TEAM : MY PAGE</title>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
</head>
<style>
	table {
        width: 80%;
        border-collapse: collapse;
        margin: 20px auto;
        margin-top: 100px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }
    	.card-header {
	background-color: #a2d2ff;
	color: white;
}
.form-control::placeholder {
    color: #adb5bd;
    font-weight:bold;
}
.form-group > input{
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
		$("#modifyBtn").on("click",function(){
		var password = document.getElementById("memberPassword").value;
		var passwordCheck = document.getElementById("memberPasswordCheck").value;
			console.log("asd")
			if(password !== passwordCheck){
				alert("비밀번호가 일치하지 않습니다.")
			}else if(password == "" || password == null || passwordCheck == "" || passwordCheck == null){
				alert("비밀번호를 입력해주세요")				
			}else{
				document.getElementById("frm").submit();
			}
		})
	})
	
	
	
	var modifyOk = "${modifyOk}";
	if(modifyOk.trim() !== ""){
		alert(modifyOk);
	}
	
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
                    document.getElementById("memberExtraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("memberExtraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberPostcode').value = data.zonecode;
                document.getElementById("memberAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memberDetailAddress").focus();
            }
        }).open();
    }
</script>

<body>
<div class="pageTitle" >
		<h1 style="font-size: 55px; color:#5E5E5E">MY PAGE</h1>
	</div>
	<input type="hidden" name="memberId" value="${dto.memberId}"/>
	<input type="hidden" name="memberName" value="${dto.memberName}"/>
		<div class="container mt-5 text-center">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h4 style="font-size:30px">기본 정보</h4>
					</div>
					<div class="card-body">
							<div class="form-group">
								<label for="userId" style="font-size:35px; color:#3f88c5;">${dto.memberName}</label>
								<span style="color:#3f88c5;" readonly>(${dto.memberId})</span>
								<div class="input-group">
								<div class="ml-auto">
								<span style="font-weight: bold; color: #5E5E5E;">MY POINT : <f:formatNumber value="${dto.memberPoint}" pattern="#,###원"></f:formatNumber></span>
								</div>
							</div>
								<p style="text-align: left; margin-bottom:-1px; color:#5E5E5E; font-weight: bold;">아이디</p>
							<div class="form-group">
								<input type="text"
									class="form-control" id="memberPhone" name="memberPhone" value="${dto.memberId}" placeholder="${dto.memberId}" readonly> 
							</div>
								<p style="text-align: left; margin-bottom:-1px; color:#5E5E5E; font-weight: bold;">이름</p>
							<div class="form-group">
								<input type="text"
									class="form-control" id="memberPhone" name="memberPhone" value="${dto.memberName}" placeholder="${dto.memberName}" readonly> 
							</div>
								<p style="text-align: left; margin-bottom:-1px; color:#5E5E5E; font-weight: bold;">전화번호</p>
							<div class="form-group">
								<input type="text"
									class="form-control" id="memberPhone" name="memberPhone" value="${dto.memberPhone}" placeholder="${dto.memberPhone}" readonly> 
							</div>
								<p style="text-align: left; margin-bottom:-1px; color:#5E5E5E; font-weight: bold;">이메일</p>
							<div class="form-group">
								<input type="email"
									class="form-control" id="memberEmail" name="memberEmail" value= "${dto.memberEmail}" placeholder="${dto.memberEmail}" readonly>
							</div>
							<div class="form-group">
								<p style="text-align: left; margin-bottom:-1px; color:#5E5E5E; font-weight: bold;">주소</p>
							<div class="input-group">
								<input type="text" class="form-control col-md-6" id="memberPostcode" name="memberPostcode" placeholder="우편번호" value="${dto.memberPostcode}" readonly>
							</div>
							<input type="text" class="form-control col-md-12" id="memberAddress" name="memberAddress" value="${dto.memberAddress}"
							style="margin-top: 5px;" readonly>
							<div class="input-group" style="margin-top: 5px;">
								<input type="text" class="form-control col-md-8" id="memberDetailAddress" name="memberDetailAddress" value="${dto.memberDetailAddress }" readonly>
								<input type="text" class="form-control col-md-4" id="memberExtraAddress" name="memberExtraAddress" value="${dto.memberExtraAddress }"
								style="margin-left: 40px;" readonly>
							</div>
							</div>
							<div class= "text-right">
							<a href="mypageUpdate"><button id="modifyBtn" type="button" class="btn btn" style="background-color: #a2d2ff; color: white; font-weight:bold;">회원정보수정</button></span></a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>