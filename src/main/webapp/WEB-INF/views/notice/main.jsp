<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Find your own drink, Barny</title>
    <!--font-->
    <link rel="stylesheet" href="fonts/icomoon/style.css" />
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

    <%--content--%>
    <div class="content">
        <div class="custom-container">
            <div class="board_name">공지사항
                <a class="board_name_small">바니의 새로운 소식과 정보를 확인하세요.</a>
            </div>
            <div class="table-responsive outline pb-3">
                <table class="table custom-table">
                    <thead style="border-bottom: solid 1px;">
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="vo">
                            <tr style="font-weight: 400;">
                                <td>${vo.id}</td>
                                <td style="text-align: left; padding-left: 2rem">
                                    <a class="board_title"
                                        href="${pageContext.request.contextPath}/notice/content/${vo.id}">${vo.boardTitle}</a>
                                </td>
                                <td>Barny</td>
                                <td>${vo.createdDate}</td>
                                <td>${vo.boardHit}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

<%--            <!--Pagination-->--%>
<%--            <nav aria-label="Page navigation example">--%>
<%--                <ul class="pagination justify-content-center">--%>
<%--                    <c:if test="${pageMaker.prev}">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="notice${pageMaker.makeQuery(pageMaker.startPage - 1) }"--%>
<%--                                aria-label="Previous">--%>
<%--                                <span aria-hidden="true">&laquo;</span>--%>
<%--                                <span class="sr-only">Previous</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                    <c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">--%>
<%--                        <li class="page-item "><a class="page-link" href="notice${pageMaker.makeQuery(idx)}">--%>
<%--                                ${idx}--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>
<%--                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" aria-label="Next"--%>
<%--                                href="notice${pageMaker.makeQuery(pageMaker.endPage +1) }">--%>
<%--                                <span aria-hidden="true">&raquo;</span>--%>
<%--                                <span class="sr-only">Next</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                </ul>--%>
<%--            </nav>--%>

            <%--searching button--%>
<%--            <div class="table-responsive outline pt-4">--%>
<%--                <form class="d-flex mb-3" id="searchForm" action="/notice" method='get' style="float: right;">--%>
<%--                    <select name='type' class="searching_option">--%>
<%--                        <option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}" />--%>
<%--                        >--</option>--%>
<%--                        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}" />--%>
<%--                        >제목</option>--%>
<%--                        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}" />--%>
<%--                        >내용</option>--%>
<%--                    </select>--%>
<%--                    <input class="form-control_2 me-2" type='text' name='keyword'--%>
<%--                        value='<c:out value="${pageMaker.cri.keyword}"/>' />--%>
<%--                    <input class="form-control_2 me-2" type='hidden' name='pageNum'--%>
<%--                        value='<c:out value="${pageMaker.cri.pageNum}"/>' />--%>
<%--                    <input class="form-control_2 me-2" type='hidden' name='amount'--%>
<%--                        value='<c:out value="${pageMaker.cri.amount}"/>' />--%>
<%--                    <button class="searching_btn btn-outline-search" type="submit">검색</button>--%>
<%--                </form>--%>
<%--            </div>--%>
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

    <!-- Core theme JS-->
    <script src="/static/main_page/js/scripts.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var searchForm = $("#searchForm");
            $("#searchForm button").on("click", function (e) {
                if (!searchForm.find("option:selected").val()) {
                    alert("검색 종류를 선택하세요");
                    return false;
                }
                if (!searchForm.find("input[name='keyword']").val()) {
                    alert("키워드를 입력하세요");
                    return false;
                }
                searchForm.find("input[name='pageNum']").val("1");
                e.preventDefault();
                searchForm.submit();

            });
        });
    </script>

</body>

</html>