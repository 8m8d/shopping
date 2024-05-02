<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

style>body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

footer {
	margin-top:200px;
	border-top: 2px solid #ddd;
	padding: 20px 0;
	bottom: 0;
	width: 100%;
}

.footer-content {
	display:flex;
	margin: 0 auto;
}

.footer-links {
	text-align:center;
	margin-top: 20px;
	margin-left: -300px;
}

.footer-links a {
	margin: 0 10px;
	color: #007bff;
	text-decoration: none;
}
address{
	width:400px;
	font-size: 12px;
	margin-left:220px;
	margin-top:-50px;
}
.footer-layer{
	margin-left: 300px;
}
a{
	color: #555555;
}
a:hover{
	text-decoration: none;
	color: #555555;
}
.address-container {
    display: flex;
}
.contact-info{
	margin-top:-55px;
	margin-left: 15px;
}
.galaxisImg{
	margin-top: -55px;
	margin-left: 100px;
}
</style>
</head>
<body>
	<footer>
		<div class="footer-layer">
			<h1>
				<a id="logo-link" href="/">PS TEAM</a>
			</h1>
			<div class="footer-content">
				<div class="address-container">
					<address class="address">
						&copy; 상호명 및 호스팅 서비스 제공 : PS TEAM <br>
						대표 : TESTER <br>
						경기도 부천시 양지로 237 광양프런티어밸리 5차 지식산업센터 312호 <br>
						사업자등록번호 : 111-11-11111 <br>
						통신판매신고번호 : 2024-경기부천-1111호
					</address>
					<div class="contact-info">
						<strong>C/S CENTER</strong><br>
						<div style="font-size: 25px; font-weight: bold;">032-111-1111</div>
						<p style="font-size: 12px;">평일 10:00am ~ 18:00pm</p>
					</div>
					<div class="galaxisImg"><img src="https://payimg.billgate.net/galaxia/img/escrow/BN_galaxiaEscrow_m.gif" alt="" style="width: 340px;height: 80px;"/></div>
				</div>
			</div>
			<div class="footer-links">
				<a href="#">이용약관</a> <a href="#">개인정보 처리방침</a> <a href="#">고객센터</a>
			</div>
		</div>
	</footer>

</body>
</html>