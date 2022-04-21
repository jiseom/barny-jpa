<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
    <link rel="stylesheet" href="/static/main_page/css/styles.css"/>
    <link rel="stylesheet" href="/static/my_page/css/my_page.css"/>
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
                <a href="/board/press" class="list-group-item list-group-item-action">구독 정보</a>
                <a href="/board/purchase_list" class="list-group-item list-group-item-action">구매 내역</a>
                <a href="/board/myInquiries" class="list-group-item list-group-item-action active" aria-current="true">
                    문의 내역
                </a>
                <a href="/board/my_review" class="list-group-item list-group-item-action">후기</a>
                <a href="#" class="list-group-item list-group-item-action">적립금</a>
                <a href="#" class="list-group-item list-group-item-action">개인 정보 수정</a>
            </div>
        </div>

        <div class="col-9" style="width: 70%; padding: 7rem 0;">
            <div class="board_name">1:1 문의
                <a class="board_name_small">포인트 및 주문내역, 개인정보 등을 확인하거나 변경하세요.</a>
            </div>
            <div class="table-responsive outline pb-3">
                <table class="table custom-table" style="min-width: 500px;">
                    <thead style="border-bottom: solid 1px;">
                    <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>날짜</td>
                    </tr>
                    </thead>
                    <tbody>

                    <c:choose>

                        <c:when test="${empty myInquiries}">

                            <tr>
                                <td colspan="5" align="center">게시글이없습니다</td>
                            </tr>

                        </c:when>

                        <c:when test="${!empty myInquiries}">


                            <c:forEach var="boardList" items="${myInquiries}">

                            </c:forEach>
                        </c:when>
                    </c:choose>

                    <c:forEach items="${myInquiries}" var="dto">
                        <tr style="font-weight: 400;">
                            <td style="width : 15%;">${dto.id}</td>
                            <td>
                                <c:forEach begin="1" end="${dto.boardIndent}">ㄴ</c:forEach>
<%--                                /inquiries/{boardId}/detail--%>
                                <a href="inquiries/${dto.id}/detail">${dto.boardTitle}</a></td>
<%--                                <a href="my_content_view?boardId=${dto.id}">${dto.boardTitle}</a></td>--%>
                            <td style="width : 15%;">${dto.createdDate}</td>
                        </tr>
                    </c:forEach>

                    <c:forEach items="${reply_view}" var="dtt">
                        <tr style="font-weight: 400;">
                            <td style="width : 15%;">${dtt.boardId}</td>
                            <td>
                                <c:forEach begin="1" end="${dtt.boardIndent}">ㄴ</c:forEach>
                                <a href="reply_content_view?board_id=${dtt.id}">${dtt.boardTitle}</a></td>
                            <td style="width : 15%;">${dtt.createdDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="line mb-3" style="border-bottom: solid 2px; border-bottom-color: #EBC24B;"></div>
                <a class="btn-basic post mb-2" type="button" title="글쓰기" onclick="location.href='/inquiries/new'">글쓰기</a>
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