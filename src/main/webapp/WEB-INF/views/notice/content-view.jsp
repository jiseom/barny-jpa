<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Find your own drink, Barny</title>
    <!--font-->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" href="/static/table/css/style.css" />
    <link href="/static/main_page/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="stylesheet" href="/static/table/css/owl.carousel.min.css" />

</head>

<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<!--Content -->
    <div class="container">
        <div class="custom-container2">
            <div class="board_name" style="text-align: center">공지사항 <br>
                <a class="board_name_small">바니의 새로운 소식과 정보를 확인하세요.</a>
            </div>
            <div class="table-responsive outline pt-3">
                <table class="table" style="font-size: 13px; border-top : solid 1px; border-top-color: #dee2e6;">
                    <form action="${pageContext.request.contextPath}/notice/content/${content_view.id}"
                        method="post">
                        <input type="hidden" id="id" value="${content_view.id}">
                        <tr>
                            <td class="content_head"> 제목</td>
                            <td colspan="3">${content_view.boardTitle}</td>
                        </tr>
                        <tr>
                            <td class="content_head"> 번호</td>
                            <td style="width:70px; border-right : solid 1px; border-right-color: #dee2e6;">
                                ${content_view.id} </td>
                            <td class="content_head"> 작성 일자</td>
                            <td> ${content_view.createdDate} </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding-top: 5rem; padding-bottom: 5rem;">${content_view.boardContent}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="py-3" style="text-align: right"><a class="btn-basic text-uppercase"
                                    href="${pageContext.request.contextPath}/notice">목록보기</a></td>
                        </tr>
                    </form>
                </table>
            </div>
            <div class="table-responsive outline pb-3" />
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
                    <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-instagram"></i></a>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a class="link-dark text-decoration-none me-3" href="#!">개인정보처리방침</a>
                    <a class="link-dark text-decoration-none" href="#!">이용약관</a>
                </div>
            </div>
        </div>
    </footer>

    <!--top-button-->
    <img id="myBtn" src="static/main_page/assets/top-btn.png" onclick="topFunction()">


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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    <script src="/static/table/js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Core theme JS-->
    <script src="/static/main_page/js/scripts.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</body>

</html>