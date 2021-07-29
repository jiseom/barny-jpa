<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/styles.css">
<style>
    h1 {
        text-align: center;
    }
</style>
    
    <title>글 작성하기</title>
</head>
<body>
    <!-- <div></div> -->
    <h1>상품 후기 등록</h1>

<div class="col-md-12">
    <div class="col-md-4 mx-auto">
        <form action="writeReview" method="post" onsubmit="return confirm('게시글을 등록하시겠습니까?')" role="form">
            <input type="hidden" name="product_id" value="${product_view.product_id}">
            <!--로그인한 아이디를 여기에 불러와야함-->
            <div class="form-group">
                <td> 상품 이름 </td>
				<td> ${product_view.product_name} </td>
            </div>
            <div class="form-group">
                <label for="title">후기 제목</label>
                <input type="text" class="form-control" name="b_title" placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
                <label for="author"> 후기 내용 </label>
                <input type="text" class="form-control" name="b_content" placeholder="내용을 입력하세요">
            </div>
            <a href="javascript:history.back()" role="button" class="btn btn-secondary">취소</a>
            <input type="submit" class="btn btn-primary" value="등록"></input>
        </form>
    </div>
</div>

</body>
</html>