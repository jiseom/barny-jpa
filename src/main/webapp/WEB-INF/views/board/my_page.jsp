<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Find your own drink, Barny</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;300;400;500;600&family=Nanum+Gothic:wght@400;700;800&display=swap"
          rel="stylesheet">
    <!-- naver fonts -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/static/main_page/css/styles.css" rel="stylesheet"/>
    <link href="/static/my_page/css/my_page.css" rel="stylesheet"/>
    <link href="/static/table/css/style.css" rel="stylesheet"/>
</head>

<body id="page-top">
<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<!--content-->
<div class="container" style ="width: 70%; padding: 7rem 0;">
    <div class="board_name">마이페이지
        <a class="board_name_small">포인트 및 주문내역, 개인정보 등을 확인하거나 변경하세요.</a>
    </div>
        <div class="line" style="border-bottom: solid 3px; border-bottom-color: #EBC24B;"></div>
    <div class="container my-page-header my-3 ">
        <div class="row">
            <div class="col-3">
                <img class="profile2"
                     style="width: 85%; height: auto;"
                     src="/static/img/BARNY3.png"/>
            </div>
            <div class="col-1" style="border-left: solid 1px; border-left-color: #EBC24B; margin: 2rem 0; width: 1%;">
            </div>
            <div class="col mt-5 pl-5" style="text-align: left;">
                <a style="font-family: BBTreeGB; font-size: 35px;">환영합니다. <sec:authentication
                        property="principal.account.AccountId"/>님!</a>
                <p></p>
                <a style="font-family: NanumSquare; font-size: 18px; font-weight: 400;">적립금 >  <sec:authentication
                        property="principal.account.point"/>P</a>
            </div>

        </div>
    </div>
        <div class="line" style="border-bottom: solid 2px; border-bottom-color: #EBC24B;"></div>
    <c:if test="${member == null}"></c:if>
    <div class="main-menu">
        <div class="row mb-3 mt-5">
            <div class="card card-my_page col-4" type="button" onclick="location.href='/my-page/press'">
                <div class="card-body my_page">
                    구독 정보
                </div>
            </div>
            <div class="card card-my_page col-4" type="button" onclick="location.href='/my-page/purchase-list'">
                <div class="card-body my_page">
                    구매 내역
                </div>
            </div>
            <div class="card card-my_page col-4" type="button" onclick="location.href='/inquiries'">
                <div class="card-body my_page">
                    문의 내역
                </div>
            </div>
        </div>
        <div class="row">
            <div class="card card-my_page col-4" type="button" onclick="location.href='/reviews'">
                <div class="card-body my_page">
                    후기
                </div>
            </div>
            <div class="card card-my_page col-4" type="button" onclick="location.href='/my-page/point'">
                <div class="card-body my_page">
                    적립금
                </div>
            </div>
            <div class="card card-my_page col-4" type="button" onclick="location.href='/my-page/edit'">
                <div class="card-body my_page">
                    개인 정보 수정
                </div>
            </div>
        </div>
    </div>
    <div class="line pt-5" style="border-bottom: solid 3px; border-bottom-color: #EBC24B;"></div>
</div>
</div>

<!-- Footer-->
<footer class="footer">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 text-lg-start"><b>주식회사 바니</b> <br> 서울특별시 종로구 종로 69 YMCA빌딩 7층
                <br>Copyright &copy; Barny Inc. All rights reserved.
            </div>
            <div class="col-lg-4 my-3 my-lg-0">
                <a class="btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                <a class="btn-dark btn-social mx-2" href="#!"><i class="fab fa-instagram"></i></a>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a class="link-dark text-decoration-none me-3" href="#!">개인정보처리방침</a>
                <a class="link-dark text-decoration-none" href="#!">이용약관</a>
            </div>
        </div>
    </div>
</footer>

<!--top-button-->
<img id="myBtn" src="/static/main_page/assets/top-btn.png" onclick="topFunction()">


<!--kakao-chat-->
<a href="javascript:void kakaoChatStart()" class="kakaoChatPc hidden-md hidden-sm hidden-xs" id="kakao-chat">
    <img src="/static/main_page/assets/kakao-chat.png" width="50px" height="50px">
</a>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
    Kakao.init('7e53e24ce9a07956bfb5ac4930333caa');

    function kakaoChatStart() {
        Kakao.Channel.chat({
            channelPublicId: '_WDxjSs'
        });
    }
</script>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/static/main_page/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</body>
</html>