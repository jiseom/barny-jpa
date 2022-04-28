<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Find your own drink, Barny</title>
    <!--font-->
    <link rel="stylesheet" href="fonts/icomoon/style.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico"/>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" href="/static/my_page/css/my_page.css"/>
    <link rel="stylesheet" href="/static/main_page/css/styles.css"/>
    <link rel="stylesheet" href="/static/table/css/style.css"/>
    <link rel="stylesheet" href="/static/table/css/owl.carousel.min.css"/>

    <!--JQuery-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>


<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<!--content-->
<div class="container" style="padding-top: 2rem;">
    <div class="row">
        <div class="col-3" style="padding: 7rem 0;">
            <div class="list-group side-nav">
                <a href="/my-page/press" class="list-group-item list-group-item-action">구독 정보</a>
                <a href="/my-page/purchase-list" class="list-group-item list-group-item-action">구매 내역</a>
                <a href="/inquiries" class="list-group-item list-group-item-action active">
                    문의 내역
                </a>
                <a href="/my-page/point" class="list-group-item list-group-item-action">적립금</a>
                <a href="/my-page/edit" class="list-group-item list-group-item-action">개인 정보 수정</a>
            </div>
        </div>
        </div>

        <div class="col-9" style="width: 70%; padding: 7rem 0;">
            <div class="board_name">1:1 문의
                <a class="board_name_small">포인트 및 주문내역, 개인정보 등을 확인하거나 변경하세요.</a>
            </div>
            <div class="table-responsive outline pt-3"></div>
            <table class="table" style="font-size: 13px; border-top : solid 1px; border-top-color: #dee2e6;">
                <form action="my_modify" method="post">
                    <input type="hidden" name="board_id" value="${reply_content_view.board_id}">
                    <tr>

                        <td class="content_head"> 제목</td>
                        <td colspan="3"><input type="text" class="textarea-custom py-1" style="padding-left:10px;"
                                               id="b_title" name="b_title" value="${reply_content_view.b_title}"></td>
                    </tr>
                    <tr>
                        <td class="content_head"> 번호</td>
                        <td style="width:70px; border-right : solid 1px; border-right-color: #dee2e6;"> ${reply_content_view.board_id} </td>
                        <td class="content_head"> 작성 일자</td>
                        <td> ${reply_content_view.b_date} </td>
                    </tr>
                    <tr>
                        <td class="content_head"> 내용</td>
                        <td colspan="4"><textarea class="textarea-custom" rows="10" id="b_content" name="b_content"
                                                  style="padding-top: 1rem; padding-bottom: 5rem; padding-left:10px; width: 100%;">${reply_content_view.b_content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="py-3">
                            <div class="row">
                            <div class="col-2" style="text-align: left; margin-top: 5px;"><a class="btn-basic text-uppercase"
                                                                            href="my_view">목록 보기</a>
                            </div>
                            </div>
                        </td>
                    </tr>
                </form>
            </table>
        </div>
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


</body>
</html>
