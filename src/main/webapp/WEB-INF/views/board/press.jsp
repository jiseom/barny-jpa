<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="/static/main_page/css/styles.css"/>
    <link rel="stylesheet" href="/static/my_page/css/my_page.css"/>
    <link rel="stylesheet" href="/static/table/css/style.css"/>
    <link rel="stylesheet" href="/static/table/css/owl.carousel.min.css"/>
</head>

<body>
<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<div class="container" style="padding-top: 2rem;">
    <div class="row">
        <div class="col-3" style="padding: 7rem 0;">
            <div class="list-group side-nav">
                <a href="/my-page/press" class="list-group-item list-group-item-action active" aria-current="true">구독 정보</a>
                <a href="/my-page/purchase-list" class="list-group-item list-group-item-action">구매 내역</a>
                <a href="/inquiries" class="list-group-item list-group-item-action">
                    문의 내역
                </a>
                <a href="/my-page/point" class="list-group-item list-group-item-action">적립금</a>
                <a href="/my-page/edit" class="list-group-item list-group-item-action">개인 정보 수정</a>
            </div>
        </div>

        <div class="col-9" style="width: 70%; padding: 7rem 0;">
            <div class="board_name">구독
                <a class="board_name_small">현재 구독 중인 패키지를 확인 가능합니다.</a>
            </div>
            <div class="table-responsive outline pb-3">
                <table class="table custom-table" style="min-width: 500px;">
                    <thead style="border-bottom: solid 1px;">
                    <tr>
                        <td colspan ="2">구독상품</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${press}" var="dto">
                        <tr>
                            <td>
                                <a style ="padding-left: 70px;" href="/products/${dto.id}/detail">${dto.productName}</a>                            </td>
                            <td>
<%--                                <a class="btn-basic post mb-2" style ="margin-right: 20px;" type="button" href="${pageContext.request.contextPath}/board/update_modify?subscribe=${dto.subscribe}" onclick="button_event('${pageContext.request.contextPath}/board/update_modify?subscribe=${dto.subscribe}');">구독 취소</a>--%>
                            </td>
                        <tr>

                            <script>
                                function button_event(url) {
                                	 console.log(url);
                                    if (confirm("지정된 다음 달 결제일까지는 구독이 유효합니다") === true) {
                                        //document.form.submit();
                                        console.log(url);
                                        $(location).attr(href,url);
                                        //location.href = url;
                                    } else {   //취소
                                        return;
                                    }
                                }

                                //-->
                            </script>

                        </tr>
                    </c:forEach>


                    <c:choose>

                        <c:when test="${empty press}">

                            <tr>
                                <td colspan="5" align="center">구독정보가 없습니다</td>
                            </tr>

                        </c:when>

                        <c:when test="${!empty press}">


                            <c:forEach var="pressList" items="${press}">

                            </c:forEach>
                        </c:when>
                    </c:choose>

                    </tbody>
                </table>
                <div class="line mb-3" style="border-bottom: solid 2px; border-bottom-color: #EBC24B;"></div>
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
</body>
</html>