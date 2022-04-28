<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<sec:authentication property="principal" var="principal"/>

<html lang="ko">
<head>
    <title>Find your own drink, Barny</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <!-- Favicon-->
    <link rel="icon" href="/static/login/images.icona/barny.png" type="image/x-icon" sizes="16x16">

    <!--bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!--jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

    <!-- naver fonts -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" href="/static/main_page/css/styles.css"/>
    <link rel="stylesheet" href="/static/my_page/css/my_page.css"/>
    <link rel="stylesheet" href="/static/table/css/style.css"/>


    <link rel="stylesheet" type="text/css" href="/static/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/static/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/static/login/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="/static/login/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="/static/login/vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="/static/login/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/static/login/vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="/static/login/css/util.css">
    <link rel="stylesheet" type="text/css" href="/static/login/css/main.css">

    <!--  <style> body {
          min-height: 100vh;
          background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
          background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
          background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
          background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
          background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
      }

      .input-form {
          max-width: 680px;
          margin-top: 80px;
          padding: 32px;
          background: #fff;
          -webkit-border-radius: 10px;
          -moz-border-radius: 10px;
          border-radius: 10px;
          -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
          -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
          box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
      } </style>
  -->

</head>
<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<!--content-->
<div class="container" style="padding-top: 2rem;">
    <div class="row">
        <div class="col-3" style="padding: 7rem 0;">
            <div class="list-group side-nav">
                <a style="font-family: NanumSquare;" href="/my-page/press" class="list-group-item list-group-item-action">구독
                    정보</a>
                <a style="font-family: NanumSquare;" href="/my-page/purchase-list"
                   class="list-group-item list-group-item-action">구매 내역</a>
                <a style="font-family: NanumSquare;" href="/inquiries"
                   class="list-group-item list-group-item-action">문의 내역</a>
                <a style="font-family: NanumSquare;" href="/reviews"
                <a style="font-family: NanumSquare;" href="/my-page/point" class="list-group-item list-group-item-action">적립금</a>
                <a style="font-family: NanumSquare;" href="/my-page/edit"
                   class="list-group-item list-group-item-action active" aria-current="true">
                    개인 정보 수정</a>
            </div>
        </div>
        <div class="col-9" style="width: 70%; padding: 7rem 0;">
            <h3 class="board_name">회원정보수정
            </h3>
            <div style="border-bottom:solid 2px; border-color:#EBC24B;"></div>
            <div>
                <table class="table custom-table" style="min-width: 500px;">
                    <thead style="border-bottom: solid 1px;">
                    <tr>

                        <!--updateForm-->
                        <form:form name="frmMember" modelAttribute="updateAccountForm" action="/my-page/update" method="POST">
                        <div class="container pt-5" style="width: 60%">
                            <div class="input-form-backgroud row">
                                <div class="input-form col-md-12 mx-auto"></div>
                            </div>
                        </div>
                        <form class="validation-form" novalidate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="wrap-input100 validate-input m-b-16"
                                         style="background-color: transparent;">
                                        <label for="accountId">아이디</label>
                                        <input class="form-control" type="text" id="accountId" name="accountId" readonly
                                               placeholder="${account.accountId}"
                                               minlength="6" maxlength="12">
                                        <form:errors path="accountId"/>

                                    </div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <div class="wrap-input100 validate-input m-b-16"
                                         style="background-color: transparent;">
                                        <label for="name">이름</label>
                                        <input class="form-control" type="text" id="name" name="name"
                                               placeholder="${account.name}" disabled
                                              >
                                        <form:errors path="name"/>

                                    </div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <div class="wrap-input100 validate-input m-b-16"
                                         style="background-color: transparent;">
                                        <label for="password">패스워드</label>
                                        <input class="form-control" type="password" id="password" name="password"
                                               value="${updateAccountForm.password}"
                                               placeholder="8자~20자 이내의 영문,숫자,특수기호 조합" required>
                                        <form:errors path="password"/>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <div class="wrap-input100 validate-input m-b-16"
                                         style="background-color: transparent;">
                                        <label for="nickname">닉네임</label>
                                        <input class="form-control" type="text" id="nickname" name="nickname" readonly
                                               placeholder="${account.nickname}"
<%--                                               placeholder="닉네임"--%>required>
                                        <form:errors path="nickname"/>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-8 mb-3 ">
                                    <div class="wrap-input100 validate-input m-b-16"
                                         style="background-color: transparent;">
                                        <label for="email">이메일</label>
                                        <input type="email"
                                                name="email" id="email" disabled
                                               placeholder="${account.email}" required
                                               class="form-control">
                                        <form:errors path="email" cssStyle="color: #e80f25"/>

                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <label for="postcode">주소</label>
                                <div class="col-md-8 mb-3">
                                    <input type="text" class="form-control" id="postcode" name="address"
                                           placeholder="우편번호" required>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <input type="button" class="btn btn-outline-primary btn-s"
                                           onclick="execDaumPostcode()"
                                           value="우편번호 찾기" required><br>
                                </div>
                                <div class="col-md-8 mb-3">
                                    <input type="text" class="form-control" id="roadAddress"
                                           value="${updateAccountForm.address}"
                                           name="address"
                                           placeholder="도로명주소 " required>
                                    <div class="invalid-feedback">
                                        주소를 입력해주세요.
                                    </div>
                                </div>

                                <div class="col-md-8 mb-3 ">
                                    <input type="text" class="form-control" id="detailAddress"
                                           value="${updateAccountForm.address}"
                                           name="address"
                                           placeholder="${account.address}" required>
                                    <div class="invalid-feedback">
                                        주소를 입력해주세요.
                                    </div>

                                    <input type="hidden" id="jibunAddress" placeholder="지번주소"></br>
                                    <span id="guide" style="color:#6A6666;display:none"></span>
                                    <input type="hidden" id="extraAddress" placeholder="참고항목">
                                </div>
                            </div>
            </div>
        </div>


        <div class="col-md-8 mb-3" style="padding-left: 1px;">
            <label for="tel">전화번호</label>
            <input type="tel" class="form-control" id="tel" name="tel"
                   value="${updateAccountForm.tel}"
                   placeholder="${account.tel}" required >
<%--                   placeholder="010-0000-0000"--%>
            <div class="invalid-feedback"> 전화번호를 입력해주세요.</div>
        </div>

        <div class="col-md-4 mb-3" style="padding-left: 1px;">
            <label for="dateOfBirth">생년월일</label>
            <input type="date"
                   class="form-control" id="dateOfBirth"
                   name="dateOfBirth" disabled
                   value="${account.dateOfBirth}" required >

            <div class="invalid-feedback"> 생년월일을 입력해주세요.</div>
        </div>
    <div class="mt-5" style="border-bottom:solid 2px; border-color:#EBC24B;"></div>
        <%--                     </form> --%>

    <div class="my-3" style="text-align: right;">
        <button class="btn btn-primary btn-lg btn-block edit-btn" type="submit">수정</button>
        <div class="mt-2">
            <button type="button" onclick="location.href='/my-page/delete'"
                    class="btn btn-primary btn-lg btn-block edit-btn">탈퇴
            </button>
        </div>
        </form>
        </form:form>
    </table>
    </div>
    </div>
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
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/static/main_page/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<!—JS->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<script src="/static/join_page/js/join.js"></script>
<script src="/static/login/js/main.js"></script>
<script src="/static/join_page/js/find-address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/login/vendor/animsition/js/animsition.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="/static/login/vendor/select2/select2.min.js"></script>
<script src="/static/login/vendor/daterangepicker/moment.min.js"></script>
<script src="/static/login/vendor/daterangepicker/daterangepicker.js"></script>
<script src="/static/login/vendor/countdowntime/countdowntime.js"></script>
</body>

</html>