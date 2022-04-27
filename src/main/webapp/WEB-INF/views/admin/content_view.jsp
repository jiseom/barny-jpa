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
                <a href="/admin/account-list" class="list-group-item list-group-item-action active" aria-current="true">회원
                    관리</a>
                <a href="#" class="list-group-item list-group-item-action">상품 관리</a>
                <a href="#" class="list-group-item list-group-item-action">게시판 관리</a>
                <a href="#" class="list-group-item list-group-item-action">주문 관리</a>


            </div>
        </div>

        <div class="col-9" style="width: 70%; padding: 7rem 0;">
            <div class="board_name">회원 정보 관리
                <a class="board_name_small">관리자 모드입니다.</a>
            </div>
            <div class="table-responsive outline pt-3"></div>

            <table class="table" style="font-size: 13px; border-top : solid 1px; border-top-color: #dee2e6;">
                <form action="/admin/${content_view.id}/delete" method="post">
                    <input type="hidden" name="id" value="${content_view.id}">


                    <tr>
                        <td> 아이디</td>
                        <td> ${content_view.accountId} </td>
                    </tr>
                    <tr>
                        <td> 회원번호</td>
                        <td> ${content_view.id} </td>
                    </tr>
                    <tr>
                        <td> 회원이름</td>
                        <td><input type="text" name="name" value="${content_view.name
            }"></td>
                    </tr>
                    <tr>
                        <td> 닉네임</td>
                        <td><input type="text" name="nickname" value="${content_view.nickname}"></td>
                    </tr>
                    <tr>
                        <td> 이메일</td>
                        <td><input type="text" name="email" value="${content_view.email}"></td>
                    </tr>
                    <tr>
                        <td> 결제수단</td>
                        <td><input type="text" name="payment" value="${content_view.payment}"></td>
                    </tr>

                    <tr>
                        <td> 전화번호</td>
                        <td><input type="text" name="tel" value="${content_view.tel}"></td>
                    </tr>

                    <tr>
                        <td> 주소</td>
                        <td><input type="text" name="address" value="${content_view.address}"></td>
                    </tr>

                    <tr>
                        <td> 생년월일</td>
                        <td><input type="date" name="dateOfBirth" value="${content_view.dateOfBirth}"></td>
                    </tr>

                    <tr>
                        <td> 포인트</td>
                        <td><input type="text" name="point" value="${content_view.point}"></td>
                    </tr>
                    <tr>
                        <td> 비활성화</td>
                        <td><input type="text" name="enabled" value="${content_view.enabled}"></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                           &nbsp;&nbsp;
                            <a href="/admin/account-list" class="btn-basic text-uppercase">목록보기</a> &nbsp;&nbsp;
                            <input type="submit" value="비활성화" class="btn-basic text-uppercase">
<%--                            <a--%>
<%--                               href="/admin/${content_view.id}/delete"--%>
<%--                               class="btn-basic text-uppercase">비활성화</a>--%>
    </td>
                    </tr>

<%--                            &nbsp;&nbsp; <a href="reply_view?id=${content_view.id}"--%>
<%--                                            class="btn-basic text-uppercase">답변</a></td>--%>
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