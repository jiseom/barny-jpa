<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico" />
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	<!-- naver fonts -->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/static/main_page/css/styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="/static/css/styles.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<title>Find your own drink, Barny</title>
	<style>
		.collapsing {
			position: relative;
			height: 0;
			overflow: hidden;
			transition: height ease !important;
		}
		.card-img {
			width: 300px;
			height: 350px;
			object-fit: cover;
		}
		.productDetail
		{
			padding-top: 100px;
			/*margin-left: 200px;
	margin-right: 200px;*/
		}
		.productDetail
		1 {
			/* margin-left: 400px; */
			margin-left: 25%;
		}
		.product_detail {
			margin-left: 23%;
			/*     margin-left: 25%;
	margin-right: 200px;
	margin-top: -10px; */
		}
	</style>

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
</head>

<body id="page-top">

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

	<!-- 상품상세보기 -->
	<div class="productDetail">
		<div class="productDetail1">
			<!-- <div class="container mt-4"> -->
			<div class="row">
				<div class="col-md-4">
					<img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/3.png" alt="상품이미지">
				</div>
				<div class="col-md-4 mt-4">
					<h3>${productDetail.productName}</h3>
					<hr class="my-6">
					<!-- <label>가격&nbsp : ${productDetail.price} 원</label> -->
					<p>상품할인가&nbsp; : &nbsp;${productDetail.price} 원</p>
					<hr class="my-2">
					<p style="text-color: #999999;">배송구분&nbsp; : &nbsp;일반배송</p>
					<hr class="my-2">
					<label>구매수량&nbsp; : &nbsp;</label> <input id="quantity" name="amount" type="number" value="1" /> </br>
					<hr class="my-2">

					<input id="id" name="id" type="hidden" value="${productDetail.id}">
					<sec:authorize access="hasAnyRole('ROLE_USER')">
						<button id="cart" type="button" class="btn btn-secondary btn-md">장바구니</button>
					</sec:authorize>
					<!--<input id="id" name="id" type="hidden"
						value="${productDetail.id}">
					<button id="cart" type="button" class="btn btn-secondary btn-md">장바구니</button>
					 <button id="order2" type="button" class="btn btn-secondary btn-md">바로구매</button> -->
					<button id="re" type="button" disabled class="btn btn-secondary btn-md">재입고알림</button>
				</div>
			</div>
			<br>
			<!-- </div> -->
		</div>
		<hr class="my-6">

		<!-- 상품 상세 정보 -->
		<div class="product_detail">
			<div class="row">
				<div class="col-md-12">
					<img class="detail-img" style="width: 70%; height: auto;" src="/static/img/002.png">
					<img class="detail-img" style="width: 70%; height: auto;" src="/static/img/003.png">
					<img class="detail-img" style="width: 70%; height: auto;" src="/static/img/004.png">
				</div>
			</div>
			<br>
		</div>
		<hr class="my-4">


	</div>
	<br>
	<br>



	<script src="/static/js/popper.js"></script>
	<script src="/static/js/reviewLike&Hit.js"></script>


	<script>
		// 장바구니
		$(document).ready(function () {
			$("#cart").click(function (event) {
				event.preventDefault();
				var id = $("#id").val();
				var quantity = $("#quantity").val();
				var cart = {
					id: id,
					quantity: quantity
				};
				//dataType: 'json',
				$.ajax({
					type: "GET",
					url: "/cart/addCart",
					cache: false,
					contentType: 'application/json; charset=utf-8',
					data: cart,
					success: function (result) {
						alert("장바구니에 담겼습니다!");
					},
					error: function (e) {
						alert("실패");
						console.log(e);
					}
				});
			});
		});
	</script>

	<!-- Footer-->
	<footer class="footer">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 text-lg-start">
					<b>주식회사 바니</b> <br> 서울특별시 종로구 종로 69 YMCA빌딩 7층 <br>Copyright
					&copy; Barny Inc. All rights reserved.
				</div>
				<div class="col-lg-4 my-3 my-lg-0">
					<a class="btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a> <a
						class="btn-dark btn-social mx-2" href="#!"><i class="fab fa-instagram"></i></a>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/static/main_page/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</body>

</html>