<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS TEAM : MEMBER</title>
</head>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<style>
	table {
        width: 80%;
        border-collapse: collapse;
        margin: 20px auto;
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
    .mb-4{
    	margin: 50px;
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
<body>
<div class="pageTitle" >
		<h1 style="font-size: 55px; color:#5E5E5E">회원정보</h1>
	</div>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>가입날짜</th>
		</tr>
		<c:forEach var="data" items="${model}">
			<tr>
				<td>${data.memberId}</td>
				<td>${data.memberPassword}</td>
				<td>${data.memberName}</td>
				<td>${data.memberPhone}</td>
				<td>${data.memberEmail}</td>
				<td>${data.memberSignUpDate}</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>