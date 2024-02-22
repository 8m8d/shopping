<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addOrder" method="POST">
		수령인
		<input type="text" name="recipientName" id="" value=""/>
		수령인번호
		<input type="text" name="recipientPhone" id="" value=""/>
		상태
		<input type="text" name="orderStatus" id="" value=""/>
		포인트
		<input type="text" name="orderPoint" id="" value=""/>
		배송비
		<input type="text" name="deliveryCharge" id="" value=""/>
		합계금액
		<input type="text" name="orderTotalPrice" id="" value=""/>
		주문아이디
		<input type="text" name="memberId" id="" value="${dto.memberId}"/>
		<button type="submit">전송</button>
	</form>
</body>
</html>