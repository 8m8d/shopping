<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon"  href="../image/aaa.png" />
<style>

#navbarSupportedContent{
	padding-left:200px;
}
.mypage{
	
	}
	
.nav-item{
	padding:0 50px;
	
}
.nav-link{
	width:100px;
	font-size: 20px;
	color:#5E5E5E;
	font-weight: bold;
	text-align: center;
}
	
.mypageGo{
	float:right; 
	z-index: 9999;
	position: absolute;
	right: 2%;
	top: 5px;
	padding-top:20px;
}
	
.navbar-brand>img{
/* width:100px; height:70px; */
	left: 2%;
	top: 5px;
	z-index: 9999;
}

.navbar{
	height:80px;
	background-color: rgba(255, 255, 255, 0.8) !important;
}

ul, ol {
    list-style: none;
}

a {
    text-decoration: none;
    color: black;
    font-weight: bold;
    font-style: inherit;
}
.dropdown-item{
	font-weight: bold;
}
.navbar-toggler-icon {
     background-color: #5E5E5E; /* 햄버거 아이콘 색상 지정 */
}

/* dropdown-menu 의 색상 지정 */
.dropdown-menu {
     background-color: #fff;
}

.dropdown-item {
     font-weight: bold;
     color: #5E5E5E; /* 드롭다운 아이템 텍스트 색상 지정 */
}

.dropdown-item:hover {
     background-color: #5E5E5E; /* 드롭다운 아이템 호버시 배경색 지정 */
     color: #fff; /* 드롭다운 아이템 호버시 텍스트 색상 지정 */
}
</style>
</head>
<body>


<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/"><img src="../image/그림2.png" alt="" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            PS TEAM
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="https://psteam.co.kr/">PS TEAM(배대지)</a></li>
            <!-- <li><hr class="dropdown-divider"></li> -->
            <li><a class="dropdown-item" href="https://shop.coupang.com/psteam?locale=ko_KR&platform=p">PS TEAM(쿠팡)</a></li>
          </ul>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="itemList">PRODUCT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/boardList">BOARD</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-center" href="/itemModifyForm">I-EDDIT</a>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            SHOP
          </a>
               <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/itemModifyForm">상품 수정</a></li>
                <li><a class="dropdown-item" href="/addItem">상품 추가</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/buyItem">주문하기</a></li>
            </ul>
        </li>
      </ul>
    </div>
    
    <div class="mypage">
			<div class="dropdown">
				
				<div class="dropdown-content">
						<a href="/signIn" class="mypage-link2">로그인</a>
						<a href="/signUp" class="mypage-link1" style="padding-left: 15px; padding-right: 25px;">회원가입</a>
				</div>
			</div>
	</div>
    
<!--       <div class="d-flex">
        <a class="mypageGo" href="/mypage">mypage</a>
        <a class="mypageGo" href="/mypage">mypage</a>        
      </div> -->
  </div>
</nav>
</body>
</html>