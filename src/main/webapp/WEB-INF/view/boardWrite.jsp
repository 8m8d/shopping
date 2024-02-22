<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : BOARD WRITE</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 네비게이션  -->
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
</head>
<style>
html, body {
	height: 100%
}

#wrap {
	min-height: 100%;
	position: relative;
}

.container {
	padding-bottom: 70px;
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
</style>
<script>
	$(function() {
		$("#writeBtn").on("click", function() {
			var title = $("#title").val();
			var content = $("#content").val();
			var writer = $("#writer").val();
			if (title === "" || content === "" || writer === "") {
				alert("모든 항목을 입력해주세요");
			} else {
				document.getElementById("frm").submit();
			}
		});

		var signInPlz = "${signInPlz}";
		if (signInPlz.trim() !== "") {
			alert(signInPlz);
		}
	});
</script>
<body>
	<div class="pageTitle">
		<h1 style="font-size: 55px; color: #5E5E5E">BOARD WRITE</h1>
	</div>
	<form action="writeOk" id="frm" method="post">
		<input type="hidden" name="boardWriter" value="" />
		<div id="wrap">
			<div class="container mt-5">
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="boardTitle" placeholder="제목을 입력하세요"
						name="boardTitle">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="boardContent" rows="4"
						placeholder="내용을 입력하세요" name="boardContent"></textarea>
				</div>
				<div class="form-group">
					<label for="writer">작성자</label> <input type="text"
						class="form-control" name="boardWriter" value="${dto.memberId}"
						id="boardWriter" readonly>
				</div>
				<button type="button" class="btn btn-primary" id="writeBtn">작성</button>
				<a href="boardList"><button type="button" class="btn btn-danger">취소</button></a>

			</div>
		</div>
	</form>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>