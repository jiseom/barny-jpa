<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="ko">
<head>

    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Find your own drink, Barny</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css"/>
    <!-- naver fonts -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/static/main_page/css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/styles.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body id="page-top">
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<form:form name="findMember" modelAttribute="memberVO" action="/loginForm" method="POST">
    <div class="container pt-5" style="width:60%">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto mt-5">

                <h3>비밀번호 찾기</h3>

                <form class="validation-form" novalidate>
                    <div class="row">


                        <div class="col-md-6 mb-3 mt-5">
                            <div class="wrap-input100 validate-input m-b-16">
                                <label for="member_name">이름</label>
                                <input class="form-control" type="text" id="member_name" name="member_name"
                                       value="${memberVO.member_name}"
                                       placeholder="고객님의 이름을 입력해주세요" required>
                                <form:errors path="member_name"/>

                            </div>
                        </div>


                    </div>


                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <div class="wrap-input100 validate-input m-b-16">
                                <label for="member_id">아이디</label>
                                <input class="form-control" type="text" id="member_id" name="member_id"
                                       value="${memberVO.member_id}"
                                       placeholder="6~12자 이내의 영어,숫자 조합 " required
                                       minlength="6" maxlength="12">
                                <form:errors path="member_id"/>

                            </div>
                        </div>
                    </div>




                    <div class="row">
                        <div class="col-md-6 mb-3 ">
                            <div class="wrap-input100 validate-input m-b-16">
                                <label for="email">이메일</label>
                                <input type="email"
                                       placeholder="가입 시 등록하신 이메일 주소를 입력해주세요" name="email" id="email"
                                       value="${memberVO.email}"
                                       class="form-control" required>
                                <form:errors path="email" cssStyle="color: #e80f25"/>

                            </div>
                        </div>

                        <div class="col-md-3 mb-4 pt-4">
                            <input type="button" value="인증하기" id="sendMail" class="btn btn-outline-primary btn-s"> <br>
                        </div>

<%--                        <div class="col-md-3 mb-4 pt-4">--%>
<%--                            <button type="submit"  id="sendMail" class="btn btn-outline-primary btn-s"> 확인<br></button>--%>
<%--                        </div>--%>

                    </div>


                </form>
    </div>


    </div>
    </div>

    </div>


    <script> window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');
        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) { //이 addEventListener 가 submit 이라는 이벤트를 발생시켰을떄 function실행
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false); </script>


</form:form>


</body>


<!—JS—>


<script src="/static/join_page/js/findPw.js"></script>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/static/main_page/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</html>