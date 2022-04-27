<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="edu.bit.ex.domain.board.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Find your own drink, Barny</title>
    <!--JQuery-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                <a href="/inquiries" class="list-group-item list-group-item-action active" aria-current="true">
                    문의 내역
                </a>
                <a href="/reviews" class="list-group-item list-group-item-action">후기</a>
                <a href="/my-page/point" class="list-group-item list-group-item-action">적립금</a>
                <a href="/my-page/edit" class="list-group-item list-group-item-action">개인 정보 수정</a>
            </div>
        </div>

        <div class="col-9" style="width: 70%; padding: 7rem 0;">
            <div class="board_name">1:1 문의
                <a class="board_name_small">포인트 및 주문내역, 개인정보 등을 확인하거나 변경하세요.</a>
            </div>
            <div class="table-responsive outline pt-3">
                <table class="table" style="font-size: 13px; border-top : solid 1px; border-top-color: #dee2e6;">
                    <form action="/inquiries/new" method="post" id="inquiry" name="inquiry">
                        <tr>
                            <td class="content_head"> 문의 종류</td>
                            <td>
                                <div class="form-group">
<%--                                    <div class="a">--%>
<%--                                            <c:forEach items="BoardType" var="type">--%>
<%--                                                <option value="${type}">${type.value}</option>--%>
<%--                                            </c:forEach>--%>
<%--                                    </div>--%>

                                    <select name="boardType" id="boardType" class="category-form" value="">
                                        <option value="0">--</option>
                                        <option value="${BoardType.ORDER_INQUIRY}">주문 문의</option>
                                        <option value="${BoardType.PRODUCT_INQUIRY}">상품 문의</option>
                                        <option value="${BoardType.SHIP_INQUIRY}">배송 문의</option>
                                        <option value="${BoardType.ETC_INQUIRY}">기타 문의</option>

<%--                                        <option value="${boardTypeList.ORDER_INQUIRY}">주문 문의</option>--%>
<%--                                        <option value="${boardTypeList.PRODUCT_INQUIRY}">상품 문의</option>--%>
<%--                                        <option value="${boardTypeList.SHIP_INQUIRY}">배송 문의</option>--%>
<%--                                        <option value="${boardTypeList.ETC_INQUIRY}">기타 문의</option>--%>


                                    </select>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="content_head"> 제목</td>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control_2" name="boardTitle" id="boardTitle"
                                           value="${inquiryForm.boardTitle}"
                                           placeholder="제목을 입력하세요"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="content_head"> 내용</td>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control_2"
                                           style="padding-top: 1rem; padding-bottom: 13rem;"
                                           value="${inquiryForm.boardContent}"
                                           name="boardContent" id="boardContent" placeholder="내용을 입력하세요">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="py-3" style="text-align: right;">
                                <input type="submit" class="btn-basic text-uppercase" value="등록">
                                <a href="/board/my_view" role="button" class="btn-basic text-uppercase">취소</a>
                            </td>
                        </tr>
                    </form>
                </table>
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

<%--validation--%>
<script>
    $(function () {
        $("#inquiry").submit(function () {
            if ($("#boardType").val() == 0) {
                alert('문의 종류를 선택해주세요.')
                return false
            }
            if ($("#boardTitle").val() == "") {
                alert('제목을 입력해주세요.')
                return false
            }
            if ($("#boardContent").val() == "") {
                alert('내용을 입력해주세요.')
                return false
            }
        });
    });
</script>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/static/table/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Core theme JS-->
<script src="/static/main_page/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- AJax-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>
