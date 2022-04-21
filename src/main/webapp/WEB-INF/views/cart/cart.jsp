<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!doctype html>
<html lang="en">

<head>
	<title>Find your own drink, Barny</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico" />

	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

	<!-- naver fonts -->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

	<!-- Core theme CSS (includes Bootstrap)-->
	<!-- <link href="/static/main_page/css/styles.css" rel="stylesheet"/>
<link rel="stylesheet" href="/static/css/styles.css"> -->

	<link rel="stylesheet" href="/static/table/css/style.css" />
	<link rel="stylesheet" href="/static/table/css/owl.carousel.min.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<link rel="stylesheet" href="/static/cart/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!--JQuery-->
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="/static/cart/js/jquery.min.js"></script>
	<script src="/static/cart/js/popper.js"></script>
	<script src="/static/cart/js/bootstrap.min.js"></script>
	<script src="/static/cart/js/main.js"></script>

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">

	<!--새로 붙인 유효한 css (머가 다른지 모르것네 이거 적용하면 그대신 장바구니 사이즈가 늘어남 그거만 줄이면 될듯) -->

	<!-- Core theme CSS (includes Bootstrap) -->
	<link href="/static/main_page/css/styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="/static/css/styles.css">


</head>
<style>
	.btn-basic1 {
		font-family: BBTreeGB;
		font-size: 15px;
		background-color:
			/* #EBC24B; */
			white;
		color: gray;
		padding: 7px;
		border-radius: 3px;
		text-align: center;
		border-width: 1px;
	}
	.btn-basic1:hover {
		color: gray;
		box-shadow: 0 0 0 0.25rem rgba(255, 208, 38, 0.5);
	}
	.btn-basic1:focus {
		color: gray;
		box-shadow: 0 0 0 0.25rem rgba(255, 208, 38, 0.5);
	}
</style>

<body id="page-top">

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

	<!-- 장바구니 -->
	<section class="ftco-section">
		<div class="container" style="width:80%;">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">장바구니</h2>
				</div>
			</div>

			<c:choose>
				<c:when test="${map.count == 0 }">
					<hr class="my-4 mb-6">
					<div class=empty style="text-align:center; margin-top:50px; margin-bottom:50px;">
						<p>장바구니가 비었습니다.</p>
					</div>
					<hr class="my-4 mb-6">
					<div class="text-center mb-5 mt-5">
						<a class="btn-basic btn-lg text-uppercase" href="/products/main">쇼핑하러가기!</a>
					</div>
				</c:when>

				<c:otherwise>

					<div class ="mb-2 ml-4">
						<label class="control control--checkbox mx-2">
							<input type="checkbox" id="allCheck" name="allCheck" />
							<div class="control__indicator"></div>
						</label> <a class="selection" style="margin-left: 2.4rem;">전체 선택 /</a>
						<input type="button" value="선택 삭제 " class="selection" onclick="deleteValue();" />
					</div>

					<div class="row" style="text-align:center;">
						<div class="col-md-12">
							<div class="table-wrap">
								<table class="table">
									<thead class="thead-primary">
										<tr>
											<th>&nbsp;</th>
											<th>&nbsp;</th>
											<th>Product</th>
											<th>Price</th>
											<th>Qty</th>
											<!-- <th>&nbsp;</th> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${cartList}" var="dto">
											<tr class="alert" role="alert">
												<th scope="row">
													<label class="control control--checkbox">
														<input type="checkbox" value="${dto.id}" name="RowCheck" />
														<div class="control__indicator"></div>
													</label>
												</th>
												<td>
													<%-- <div class="img" src="${dto.image_route}"></div> --%>
<%--													<a href="#"><img class="img" src="/${dto.image_route}"></a>--%>
													<a href="#"><img class="img" src="/static/img/002.png"></a>
												</td>
												<td>
													<div class="productname">
														<span>${dto.selectedItem.productName} </span>
													</div>
												</td>
												<td>${dto.selectedItem.price} </td>
												<td class="qty">
													<div class="input-group1">
														<%-- <input type="text" name="qty" class="qty form-control input-number" value="${dto.quantity}" min="1" max="10"> --%>
														<input id="quantity" name="quantity"
															style="text-align:center; width:60px; margin-left:30%; margin-right: 10px;" type="number"
															value="${dto.quantity}" />
														<input id="id" name="id" type="hidden" value="${dto.id}">
														<button id="update" type="button" class="btn-basic1 btn-sm">수량변경</button>

													</div>
												</td>
											</tr>
											<!--<button id="update" type="button" class="btn-outline-dark btn-sm">수정</button> -->

										</c:forEach>

									</tbody>
									<tr>
										<td id="total_price" colspan="5" align="right">
											장바구니 금액 합계 :
											<fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###" />원 <br>
											배송료 : ${map.fee} 원<br>
											총 주문금액 :
											<fmt:formatNumber value="${map.sum}" pattern="#,###,###" />원
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
		</div>
		<div class="text-center mb-5 mt-5">
			<a class="btn-basic btn-lg text-uppercase" href="/user/order">주문하기</a>
			<a class="btn-basic btn-lg text-uppercase" href="/products/main">더 쇼핑하기</a>
		</div>
		</c:otherwise>
		</c:choose>

	</section>

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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/static/main_page/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

	<!-- 수량 변경 -->
	<script type="text/javascript">
		$(document).ready(function () {
			$("#update").click(function (event) {
				event.preventDefault();
				var id = $("#id").val();
				var quantity = $("#quantity").val();
				// var productName = $("#productName").val();
				var update = {
					id: id,
					quantity: quantity
				};
				debugger;
				//dataType: 'json',
				$.ajax({
					type: "POST",
					url: "/cart/update",
					cache: false,
					contentType: 'application/json; charset=UTF-8',
					data: JSON.stringify(update),
					success: function (result) {
						// console.log("수정 성공");
						location.href = "/cart";

					},
					error: function (e) {
						console.log("실패");
					}
				});
			});
		});
	</script>

	<!-- 삭제 체크박스 -->
	<script type="text/javascript">
		$(function () {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			$("input[name='allCheck']").click(function () {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function () {
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}

			});
		});
		function deleteValue() {
			var url = "${pageContext.request.contextPath}/cart/delete";
			var ids = [];
			var list = $("input[name='RowCheck']");
			var trArray = [];
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
					ids.push(list[i].value);
					trArray = $(list[i]).parent().parent().parent();
				}
			}
			if (ids.length === 0) {
				alert("선택된 글이 없습니다.");
			} else {
				if (confirm("해당 상품을 삭제하시겠습니까?")) {
					debugger;
					// var chk = confirm("정말 삭제하시겠습니까?");
					let data = {
						ids: ids
					};
					data = JSON.stringify(data);
					$.ajax({
						url: url,
						type: 'POST',
						traditional: true,
						contentType: 'application/json',
						data: data,
						success: function (result) {
							if (result == "SUCCESS") {
								//alert("삭제되었습니다.");								
								//for(var i = 0; i < trArray.length; i++){									
								//	$(trArray[i]).remove();
								//}
								location.href = "/cart";
							} else {
								alert("삭제가 실패하였습니다.");
							}
						}
					});
				} else {
					alert("작업이 취소되었습니다.");
				}
			}
		}
	</script>

</body>

</html>