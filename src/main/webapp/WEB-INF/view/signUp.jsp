<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : SIGNUP</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="/WEB-INF/view/nav-sign.jsp"></jsp:include>
</head>
<style>
.card-header {
	background-color: #a2d2ff;
	color: white;
}
.form-control::placeholder {
    color: #adb5bd;
    font-weight:bold;
}
input[type="text"] {
    font-weight: bold;
    box-shadow: 
}
input[type="email"] {
    font-weight: bold;
}
p,span{
	font-size: 12px;
	color: red;
}
.form-control:focus{
	box-shadow: none;
	border-color: #ced4da;
}
#signUpBtn{
	width:100%;
	background-color: #a2d2ff; 
	color: white; 
	font-weight:bold;
	font-size: 20px;
	margin-top: 20px;
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
<script>

	$(document).ready(function() {
		
		
/* 아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디*/
/* 아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디    아이디*/
		
		// ID 중복확인 
		$("#memberId").keyup(function() {
			var memberId = $("#memberId").val();
			var idRegex = /^[a-zA-Z0-9_-]{3,10}$/;
			// 서버에 중복확인 요청을 보내는 Ajax 호출
			$.ajax({
				url : "/idCheck", // 이 부분을 실제 컨트롤러의 매핑과 일치하도록 수정
				method : "GET",
				data : {
					memberId : memberId
				},
				success : function(response) {
// 					alert("중복된 ID 입니다.")
						$("#idMessage1").show();
						$("#memberId").css("border","2px solid red");
				},
				error : function() {
					if(memberId == "" || memberId == null){
// 						alert("아이디를 입력해주세요.")
						$("#memberId").css("border","2px solid red");
						$("#memberIdMessage").show();
						$("#idMessage1").hide();
						$("#idMessage2").hide();
					}else if(memberId.length <= 2 || !idRegex.test(memberId)){
						$("#memberId").css("border","2px solid red");
						$("#idMessage1").hide();
						$("#idMessage2").show();
					}
					else{
// 					alert("사용 가능한 ID 입니다.")
						//setValidInput("memberId");
						$("#idMessage1").hide();
						$("#idMessage2").hide();
						$("#memberId").css("border","1px solid #ced4da");
// 						$("#idCheck").data("checked",true);
					}
				}
			});
		});
		
		
/*입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 */		
/*입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 전체    입력칸 */		
		
		// 입력란에 입력없이 포커스 이동시 이벤트
		$(".form-control").on("blur",function(){
			var value = $(this).val();
			if(value == "" || value == null){
				setInvalidInput(this.id);
			}
		})
		
		// 입력란에 "" or null 아니면 이벤트
		$(".form-control").on("keyup",function(){
			var value = $(this).val();
			if(value !== "" || value !== null){
				setValidInput(this.id);
			}
		})
		
		
		//유효성 검사에 통과하지 못하면 테두리 색상을 변경하는 함수
		function setInvalidInput(elementId) {
			$("#" + elementId).css("border","2px solid red");
			$("#"+elementId+"Message").show();
		}
	
		// 유효성 검사에 통과하면 경고문 없애는 함수
		function setValidInput(elementId) {
	// 		$("#" + elementId).css("border","1px solid #ced4da");
			$("#"+elementId+"Message").hide();
			$("#valid_"+elementId+"Message").hide();
	// 		console.log("#"+elementId+"Message");
		}
		
		// 가입하기 버튼 클릭시 필수 요소 확인
// 		 $("form").submit(function(event) {
// 	            // Check if the ID has been checked for duplication
// 	            var memberPostcode = document.getElementById("memberPostcode").value;
// 	            var memberPassword = document.getElementById("memberPassword").value;
// 	            var memberPasswordCheck = document.getElementById("memberPasswordCheck").value;
// 	            if (!$("#idCheck").data("checked")) {
// 	                alert("ID 중복확인을 진행해주세요.");
// 	                event.preventDefault(); // Prevent form submission
// 	            }else if(memberPostcode == "" || memberPostcode == null){
// 	            	alert("우편번호를 입력해주세요.")
// 	                console.log(memberPostcode);
// 	                event.preventDefault(); // Prevent form submission
// 	            }if(memberPassword != memberPasswordCheck){
// 	            	alert("비밀번호가 일치하지 않습니다")
// 	            	document.getElementById("memberPassword").focus();
// 	                event.preventDefault(); // Prevent form submission
	                
// 	            }
// 	        });
		
/* 패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드    패스워드    패스워드*/
/* 패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드	패스워드    패스워드    패스워드*/
		
		// 패스워드, 패스워드확인 keyup 시에 어디를 keyup 했는지 id 갖고 오기
		$("#memberPassword, #memberPasswordCheck").on("keyup", function() {
		    var inputId = $(this).attr("id");
		    var messageSelector = "#" + inputId.replace("member", "").toLowerCase() + "Message";
		    validatePassword($(this).val(), messageSelector, $(this));
		});
		// 패스워드, 패스워드 확인 정규식 코드 합격 불합격에 따른 테두리 색상 변화
		function validatePassword(password, messageSelector, inputElement) {
		    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
		
		    if (!passwordRegex.test(password)) {
		        $(messageSelector).show();
		        inputElement.css("border", "2px solid red");
		    } else {
		        $(messageSelector).hide();
		        inputElement.css("border", "1px solid #ced4da");
		    }
		}
		
		// 패스워드확인 입력란에 입력할 때 유효성 검사
		$("#memberPasswordCheck").on("keyup",function(){
			var memberPassword = $("#memberPassword").val();
			var memberPasswordCheck = $("#memberPasswordCheck").val(); 
			$("#validPasswordCheckMessage").hide();
			if(memberPassword != memberPasswordCheck){
				$("#passwordCheckMessage").show();
				$("#memberPasswordCheck").css("border", "2px solid red");
			}else{
				$("#passwordCheckMessage").hide();
			}
		})
		
		

/* 입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2    입력란 전체2    */
/* 입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2     입력란 전체2    입력란 전체2    */
		
		
			// 입력칸에 입력시 필수입력이라는 메세지 지우기 유효성 검사
		  $("#memberId,#memberName,#memberPhone,#memberEmail,#memberDetailAddress").on("keyup",function(){
			  var inputId = $(this).attr("id");
			  var messageSelector = inputId + "Message";
			  var memberId = document.getElementById("memberId").value;
			  if($("#" + messageSelector).length >= 1 ){
				  $("#idMessage2").hide();
				  $(this).css("border","1px solid #ced4da");
			  }
		  })
		  
/* 전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호 */
/* 전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호    전화번호 */
		  
		// 전화번호 유효성 및 하이픈 자동 채우기
		$("#memberPhone").on("keyup", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "")
				   .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
				   .replace("--", "-") );
		});
	});

</script>
<body>
	<form action="signUpOk" method="post">
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-5">
					<div class="card">
						<div class="text-center card-header">
							<h4 style="font-size:30px">회원가입</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
									<input type="text" class="form-control col-md-12" maxlength="10" id="memberId"
										name="memberId" placeholder="아이디" value="${dto.memberId}">
<!-- 									<div class="input-group-append"> -->
<!-- 										<button class="btn btn-outline-secondary" type="button" -->
<!-- 											id="idCheck" name="idCheck" data-checked="false" -->
<!-- 											style="margin-left:35px; background-color: #a2d2ff; color:white; font-weight:bold; border-color: #ced4da">중복확인</button> -->
<!-- 									</div> -->
									<span style="display: none;" id="idMessage1">사용할 수 없는 아이디 입니다. 다른 아이디를 입력해 주세요.</span>
									<span style="display: none;" id="idMessage2">3~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</span>
									<span style="display: none;" id="memberIdMessage">아이디는 필수 입력 값입니다.</span>
									<span id="valid_memberIdMessage">${valid_memberId}</span>
							</div>
							<div class="form-group">
								<input type="password" class="form-control col-md-12 passwordArea" id="memberPassword"
									name="memberPassword" maxlength="16" placeholder="비밀번호" value="${dto.memberPassword}">
									<span id="passwordMessage" style="display: none">비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</span>
									<span style="display: none;" id="memberPasswordMessage">비밀번호는 필수 입력 값입니다.</span>
									<span id="valid_memberPasswordMessage">${valid_memberPassword}</span>
							</div>
							<div class="form-group">
								<input type="password" class="form-control col-md-12 passwordArea"
									id="memberPasswordCheck" name="memberPasswordCheck"
									maxlength="20" placeholder="비밀번호 확인" value="${dto.memberPasswordCheck}">
									<span id="passwordCheckMessage" style="display: none">비밀번호가 일치하지 않습니다.</span>
									<span style="display: none;" id="memberPasswordCheckMessage">비밀번호 확인은 필수 입력 값입니다.</span>
									<span id="valid_memberPasswordCheckMessage">${valid_memberPasswordCheck}</span>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control col-md-4" id="memberName"
										name="memberName" maxlength="20" placeholder="이름" value="${dto.memberName}" >
									<input type="text" class="form-control col-md-7" id="memberPhone" style="margin-left: 45px"
										name="memberPhone" maxlength="13" placeholder="휴대폰 번호" value="${dto.memberPhone}">
								</div>
								<div class="input-group">
									<span id="valid_memberNameMessage">${valid_memberName}</span>
									<span style="display: none;" id="memberNameMessage">이름은 필수 입력 값입니다.</span>
									<span id = "valid_memberPhoneMessage" style="margin-left:210px;">${valid_memberPhone}</span>
									<span style="margin-left:210px; display: none;" id="memberPhoneMessage">전화번호는 필수 입력 값입니다.</span>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control col-md-12" id="memberEmail"
									name="memberEmail" placeholder="yoon-psteam@psteam.com" value="${dto.memberEmail}">
									<span id="valid_memberEmailMessage">${valid_memberEmail}</span>
									<span style="display: none;" id="memberEmailMessage">이메일은 필수 입력 값입니다.</span>
							</div>
							<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control col-md-6" id="memberPostcode" name="memberPostcode" placeholder="우편번호" value="${dto.memberPostcode}" readonly>
								<input type="button" class="form-control col-md-3" onclick="kakaoAddressApi()" value="우편번호 찾기"
								style="margin-left:35px; background-color: #a2d2ff; color:white; font-weight:bold; border-color: #ced4da;
							">
							<br>
							</div>
							<input type="text" class="form-control col-md-12" id="memberAddress" name="memberAddress" placeholder="주소" value="${dto.memberAddress}"
							style="margin-top: 5px;" readonly>
							<span id="valid_memberAddressMessage">${valid_memberAddress}</span>
							<div class="input-group" style="margin-top: 5px;">
								<input type="text" class="form-control col-md-8" id="memberDetailAddress" name="memberDetailAddress" placeholder="상세주소" value="${dto.memberDetailAddress}">
								<input type="text" class="form-control col-md-4" id="memberExtraAddress" name="memberExtraAddress" placeholder="참고항목"
								style="margin-left: 40px;" value="${dto.memberExtraAddress}" readonly>
							</div>
							<div class="input-group">
								<span id="valid_memberDetailAddressMessage">${valid_memberDetailAddress}</span>
								<span style="display: none;" id="memberDetailAddressMessage">상세주소는 필수 입력 값입니다.</span>
								<span id="valid_memberExtraAddressMessage" style="margin-left: 175px">${valid_memberExtraAddress}</span>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="member-ReferenceId"
									name="memberReferenceId" maxlength="10" placeholder="추천인 아이디">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn" id="signUpBtn">가입하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>