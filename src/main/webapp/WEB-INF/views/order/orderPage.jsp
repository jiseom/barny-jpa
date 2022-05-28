<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Find your drink, Barny</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css"/>
    <!-- naver fonts -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/static/main_page/css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/main_page/css/drink_test.css"/>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/static/main_page/js/scripts.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</head>
<style>
    h1 {
        text-align: center;
    }

    div {
        text-align: center;
    }

</style>
<body id="page-top">
<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<div id="drink_test_body" class="container shadow bg-body rounded">
    <section id="main" class="mx-auto my-3 ">

        <h1> 주문이 완료되었습니다!</h1>
        <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">
            <img src="/static/img/test_main.png" alt="mainImage" class="img-fluid">
        </div>
        <p>
        </p>
        <button id="order" type="button" class="btn btn-secondary btn-lg text-uppercase" onclick="location.href='http://localhost:8282/main'">메인화면 이동
        </button>

    </section>
</div>
</body>
</html>
