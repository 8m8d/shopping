<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : MY BOARD LIST</title>
<jsp:include page="/WEB-INF/view/nav.jsp" />

<style>
html, body {
	height: 100%
}

#wrap {
	min-height: 100%;
	position: relative;
}

.container {
	padding-bottom: 100px;
}

h1 {
	font-weight: bold;
	font-style: inherit;
	color: #5C5C5C;
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
</style>
<body>
	<div>
		<div id="wrap">
			<div class="pageTitle">
				<h1 style="font-size: 55px; color: #5E5E5E">MY BORDE LIST</h1>
			</div>
			<div class="container mt-5">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${dto}" varStatus="loop">
							<tr>
								<th scope="row">${loop.count}</th>
								<td><a href="/boardDetail?no=${dto.boardNo}" id="no">${dto.boardTitle}</a></td>
								<td>${dto.boardWriter}</td>
								<td>${dto.boardRegDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>