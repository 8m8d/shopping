<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<title>PS TEAM : SIGNIN</title>
<jsp:include page="/WEB-INF/view/nav-sign.jsp"></jsp:include>
<style>
.card-header {
	background-color: #a2d2ff;
	color: white;
}
#wrap{
    padding-bottom: 70px;
}
#signIn{
	margin-top: 50px;
	width: 100%;
	font-size: 20px;
}
#memberId,#memberPassword{
	height: 50px;
}
#memberPassword{
	margin-top: 20px;
}
input::placeholder{
	color: #adb5bd !important;
	font-size: 16px;
	font-weight: bold;
}
</style>
<script>
	// 아이디 비밀번호 확인
    var loginError = "${loginError}";

    if (loginError.trim() !== "") {
        alert(loginError);
    }
	// 회원가입 성공
    var signupOk = "${signupOk}";

    if (signupOk.trim() !== "") {
        alert(signupOk);
    }
    // 게시판 글 작성 시에 로그인 확인
    var signInPlz = "${signInPlz}";
    if(signInPlz.trim() !== ""){
        alert(signInPlz);
    }
</script>
<body>
<form action="signInOk" method="post">
<div id="wrap">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card">
                <div class="text-center card-header">
                    <h4 style="font-size:30px">PS TEAM</h4>
                </div>
                <div class="card-body">
                        <div class="form-group">
<!--                             <label for="userId" style="font-weight: bold">아이디</label> -->
                            <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디" required>
                            
                        </div>
                        <div class="form-group">
<!--                             <label for="password" style="font-weight: bold">비밀번호</label> -->
                            <input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="비밀번호" required>
                        </div>
                        <div class="text-center">
                        <button type="submit" class="btn btn" id="signIn" name="signIn" style="background-color: #a2d2ff; color: white; font-weight:bold;">로그인</button>
                        </div>
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