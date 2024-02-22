<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<!-- Navigation -->
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<body>
	<c:forEach var="orderDetailList" items="${orderDetailList}">
	<h1>${orderDetailList}</h1>
		
	</c:forEach>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>
