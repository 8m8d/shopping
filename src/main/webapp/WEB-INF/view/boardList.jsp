<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>PS TEAM : BOARD LIST</title>
<link rel="icon"  href="../image/aaa.png" />
</head>
<script>
	var modifyFailed = "${modifyFailed}";
	
	if (modifyFailed.trim() !== "") {
		alert(modifyFailed);
	}
</script>
<style>
	 h1{
        	font-weight: bold;
        	font-style: inherit;
        	color: #5C5C5C;
        	margin-bottom: 50px;
        }
        #writeBtn{
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
.page-link{
	font-weight: 500;
}
</style>
<body>
<jsp:include page="/WEB-INF/view/nav.jsp">
<jsp:param name="dto" value="${dto}"/>
</jsp:include>
<div>
	<div class="pageTitle" >
		<h1 style="font-size: 55px; color:#5E5E5E">BOARD LIST</h1>
	</div>
	<div class="container mt-5">
		<div class="text-center" style="font-size: 20px">
		</div>
		<a href="/boardWrite"><button type="button"
				class="btn btn-secondary" id="writeBtn">작성</button></a>
		<table class="table">
		<c:if test="${isOwner }">
			<a href="myBoardList?writer=${data.boardWriter}"><button class="btn btn-primary">내가 쓴 게시글</button></a>
		</c:if>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${list}" varStatus="loop">
					<tr>
						<th scope="row">${loop.count}</th>
						<td><a href="/boardDetail?no=${data.boardNo}" id="no">${data.boardTitle}</a></td>
						<td>${data.boardWriter}</td>
						<td>${data.boardRegDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<ul class="pagination">
	  <li class="page-item"><a class="page-link" href="#">이전</a></li>
	  <li class="page-item"><a class="page-link" href="#">1</a></li>
	  <li class="page-item"><a class="page-link" href="#">2</a></li>
	  <li class="page-item"><a class="page-link" href="#">3</a></li>
	  <li class="page-item"><a class="page-link" href="#">다음</a></li>
	</ul>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>