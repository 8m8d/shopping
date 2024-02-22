<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : MODIFY BOARD</title>
<jsp:include page="/WEB-INF/view/nav.jsp" />
<style>
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
<body>
	<div class="pageTitle">
		<h1 style="font-size: 55px; color: #5E5E5E">MODIFY BOARD</h1>
	</div>
	<form action="modifyOk" id="frm" method="post">
		<div class="container mt-5">
			<input value=${data.boardNo } name="boardNo" hidden="" />
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="boardTitle" value="${data.boardTitle}"
					name="boardTitle">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="boardContent" rows="4"
					name="boardContent">${data.boardContent}</textarea>
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="boardWriter" value="${data.boardWriter}"
					name="boardWriter" readonly>
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
			<a href="boardList"><button type="button" class="btn btn-danger">취소</button></a>
		</div>
	</form>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
	<!-- Bootstrap JS and jQuery (optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>