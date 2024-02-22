<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 및 결제 완료</title>
</head>
 <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        #wrap {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
        }

        header {
            background-image: url('images/cloud.jpg');
            background-size: cover;
            text-align: center;
            padding: 80px 0;
            color: #000;
        }

        header h1 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .orderendtxt_wrap {
            text-align: center;
            padding: 40px 0;
        }

        .finalendmsg {
            font-size: 24px;
            font-weight: bold;
            color: #28a745; /* Bootstrap success color */
        }

        .endmsg {
            font-size: 20px;
            color: #000;
        }

        .orderend_info {
            padding: 40px;
            border-top: 2px solid #dee2e6; /* Bootstrap border color */
        }

        .info_wrap, .info_dsc {
            margin-bottom: 20px;
        }

        .info_wrap h4 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .ordernumber strong {
            font-size: 20px;
            color: #dc3545; /* Bootstrap danger color */
        }

        .info_dsc ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .info_dsc li {
            font-size: 16px;
            color: #495057; /* Bootstrap secondary color */
        }

        .benefit_fold_panel a {
            color: #007bff; /* Bootstrap primary color */
        }

        .order_bill {
            margin-top: 40px;
            border-top: 2px solid #dee2e6; /* Bootstrap border color */
            border-bottom: 2px solid #dee2e6; /* Bootstrap border color */
            padding: 20px 0;
        }

        .bill_content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logoimg {
            max-width: 100%;
            height: auto;
        }

        .scroll {
            max-height: 200px;
            overflow-y: auto;
        }

        .product_item {
            border-bottom: 1px solid #dee2e6; /* Bootstrap border color */
            padding: 10px 0;
        }

        .product_dsc p {
            margin: 0;
            font-size: 16px;
            color: #495057; /* Bootstrap secondary color */
        }

        .option_list {
            list-style-type: none;
            padding: 0;
            margin: 0;
            font-size: 14px;
            color: #6c757d; /* Bootstrap tertiary color */
        }

        .price {
            font-size: 20px;
            font-weight: bold;
            color: #28a745; /* Bootstrap success color */
        }

        .order_bill_info {
            margin-top: 20px;
        }

        .price_sum_title, .price_sum_detail {
            font-size: 18px;
            color: #000;
        }

        .price_sum_detail em {
            color: #28a745; /* Bootstrap success color */
            font-weight: bold;
        }

        .payment_agree_wrap {
            text-align: center;
            margin-top: 40px;
        }

        button {
            background-color: #007bff; /* Bootstrap primary color */
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            margin: 0 10px;
        }

        .shdw_bottom {
            height: 10px;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0));
        }

        footer {
            background-color: #6c757d; /* Bootstrap secondary color */
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }
    </style>
    
<body>
    <div id="wrap">
        <!-- u_skip -->
        <div id="u_skip"></div>
        <!-- Navigation-->
        <!-- header -->
        <header>
            <img src="images/cloud.jpg" alt="" class="cloud" />
            <div class="header-content text-center text-black">
                <h1 class="display-4 fw-bolder">주문/결제</h1>
                <p class="lead fw-normal text-black-50 mb-0" style="font-size: 20px; color: #00000080;"></p>
            </div>
        </header>
        <!-- //header -->

        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="order" class="order_sc _root _cartDiv">
                <div class="orderendtxt_wrap pointplus_info">
                    <span class="top_line"></span>
                    <div class="orderendtxt_content">
                        <p class="txt">
                            <span class="finalendmsg">주문이 정상적으로 완료</span><span class="endmsg">되었습니다.</span>
                        </p>
                    </div>
                </div>

                <div class="orderend_info">
                    <div class="info_wrap">
                        <h4>주문번호</h4>
                        <span class="ordernumber"> <strong>23235204</strong>
                        </span>
                    </div>

                    <div class="info_wrap">
                        <h4>배송지정보</h4>
                        <div class="info_dsc">
                            <ul>
                                <li>유저</li>
                                <li>010-1234-5678</li>
                                <li>(03134) 서울 종로구 율곡로10길 105 디아망</li>
                            </ul>
                        </div>
                    </div>
                    <dl class="benefit_fold_panel on spot_benefit_pay">
                        <dt class="fold_heading">
                            <a href="#" class="_click(nmp.front.order.order_sheet.result.togglePayEventInfo()) _stopDefault">
                                <strong> 포인트 혜택 </strong> <span class="benefit_spot_green" style="color: #0A58CA;">9,840원</span>
                            </a>
                        </dt>
                    </dl>
                </div>

                <div class="order_bill">
                    <div class="bill_content">
                        <span class="logo"><img src="images/pony_motors_log_cut.png" alt="" class="logoimg" /></span>
                        <div class="scroll">
                            <ul class="product_list">
                                <li class="product_item">
                                    <div class="product_dsc">
                                        <p>- 엔진오일</p>
                                        <ul class="option_list">
                                            <li>옵션 : SONATA</li>
                                            <li>주문수량 : 2개</li>
                                        </ul>
                                        <p>- 브레이크</p>    
                                        <ul class="option_list">
                                            <li>옵션 : AVANTE</li>
                                            <li>주문수량 : 3개</li>
                                        </ul>
                                        <strong class="price"><em style="padding-left: 12px;">196,800</em>원</strong>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <!-- 주문금액 Start -->
                        <div class="order_bill_info">
                            <div class="sum">
                                <strong class="price_sum_title">주문금액</strong>
                                <p class="price_sum_detail" style="color: #0A58CA;">
                                    <em>196,800</em>원
                                </p>
                            </div>
                            <ul class="calc_list">
                                <li><strong>상품금액</strong>
                                    <p>
                                        <em>196,800</em>원
                                    </p></li>
                                <li><strong>배송비</strong>
                                    <p>
                                        +<em>0</em>원
                                    </p></li>
                            </ul>
                        </div>
                        <!-- 주문금액 End -->

                        <!-- 결제상세 Start -->
                        <div class="order_bill_info">
                            <div class="sum">결제상세</div>
                            <div class="area_payment_info">
                                <div class="sum">
                                    <strong class="price_sum_title">포인트 사용</strong>
                                    <p class="price_sum_detail" style="color: #0A58CA;">
                                        <em>8,500</em>원
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="ob_bottom"></span>
                </div>

                <div class="cutting_line cutting_line_v3"></div>
                <div class="payment_agree_wrap">
                    <a href="/myorderlist"><button class="" style="background-color: #0A58CA; border: none;" >
                        <span class="txt_purchase">구매내역 보기</span>
                    </button></a>
                    <a href="/partall"><button class="" style="background-color: #0A58CA; border: none;">
                        <span class="txt_shophome">부품 목록 가기</span>
                    </button></a>
                    <div class="shdw_bottom"></div>
                </div>
            </div>
            <!-- //content -->
        </div>
        <!-- //container -->

        <!-- footer -->
        <footer class="py-5 bg-secondary" style="background-color: #6c757d !important;">
            <div class="container">
                <p class="m-0 text-center text-white" style="font-size: 16px;">Copyright &copy; Your Website 2023</p>
            </div>
        </footer>
        <!-- //footer -->
    </div>
</body>
</html>