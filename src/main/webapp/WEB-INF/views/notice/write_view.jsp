<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <!--Content -->
    <div class="container">
        <div class="custom-container2">
            <div class="board_name">공지사항 등록
            </div>
            <div class="table-responsive outline pt-3">
                <form action="/admin/notices/new" modelAttribute="createNoticeForm" method="post">
                    <table class="table" style="font-size: 13px; border-top : solid 1px; border-top-color: #dee2e6;">
                        <tr>
                            <td class="content_head"> 제목 </td>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control_2" value="${createNoticeForm.boardTitle}" name="boardTitle" placeholder="제목을 입력하세요" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="content_head"> 내용 </td>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control_2"
                                           value="${createNoticeForm.boardContent}"
                                        style="padding-top: 1rem; padding-bottom: 15rem;" name="boardContent"
                                        placeholder="내용을 입력하세요">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="py-3" style="text-align: right;">
                                <input type="submit" class="btn-basic text-uppercase" value="등록">
                                <a href="/admin/notices" role="button" class="btn-basic text-uppercase">취소</a>

                            </td>
                        </tr>
                    </table>

            </div>
            <div class="table-responsive outline pb-3" />
        </div>
    </div>
</body>

</html>