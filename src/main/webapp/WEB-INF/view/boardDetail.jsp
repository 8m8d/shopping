<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : BOARD DETAIL</title>
<!-- 네비게이션  -->
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
</head>
<style>
#wrap {
	padding-bottom: 120px;
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
		$("#deleteCheck").on("click", function() {
			alert("삭제 되었습니다")
		})
	})
</script>
<body>
	<div id="wrap">
		<div class="pageTitle">
			<h1 style="font-size: 55px; color: #5E5E5E">BOARD DETAIL</h1>
		</div>
		<div class="container mt-5">
			<c:if test="${isOwner}">
				<a href="/modifyForm?no=${dto.boardNo}"><button type="button"
						class="btn btn-success">수정</button></a>
				<a href="/delete?no=${dto.boardNo}"><button type="button"
						class="btn btn-danger" id="deleteCheck">삭제</button></a>
			</c:if>
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">제목 : ${dto.boardTitle}</h5>
				</div>
				<div class="card-body">
					<p class="card-text">${dto.boardContent}</p>
				</div>
				<div class="card-footer text-muted">
					<p class="card-text">작성자 : ${dto.boardWriter}</p>
				</div>
			</div>
			<a href="/boardList">목록으로 돌아가기</a>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</html>