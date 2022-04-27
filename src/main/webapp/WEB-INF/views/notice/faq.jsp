<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js">
	</script>

	<title>Find your own drink, Barny</title>
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


</head>

<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

	<!--faq-->
	<section class="page-section bg-light">
		<div class="faq-title">
			<h2 class="title">자주 묻는 질문!</h2>
		</div>
		<div class="col-sm-6 accordion_one">
			<div class="panel-group" id="accordionFourLeft">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion_oneLeft"
								href="#collapseFiveLeftone" aria-expanded="false" class="collapsed"> 나의 구독 내역을
								어떻게 확인하나요? </a> </h4>
					</div>
					<div id="collapseFiveLeftone" class="panel-collapse collapse" aria-expanded="false" role="tablist"
						style="height: 0px;">
						<div class="panel-body">
							<div class="img-accordion"></div>
							<div class="text-accordion">
								<p> [마이페이지 → 구독 정보 조회] 를 통해 자세한 구독 내역도 확인하실 수 있습니다. </p>
							</div>
						</div> <!-- end of panel-body -->
					</div>
				</div> <!-- /.panel-default -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#accordion_oneLeft"
								href="#collapseFiveLeftTwo" aria-expanded="false"> 주문한 상품을 취소하고 싶은데 주문 취소가 안됩니다. 어떻게 해야 하나요? </a>
						</h4>
					</div>
					<div id="collapseFiveLeftTwo" class="panel-collapse collapse" aria-expanded="false" role="tablist"
						style="height: 0px;">
						<div class="panel-body">
							<div class="img-accordion"> </div>
							<div class="text-accordion">
								<p> 결제 완료 상태의 경우에는 바로 주문취소가 됩니다.
									주문 취소가 되지 않거나 특이사항이 있을 경우 고객센터(1666-8888)에 문의를 주시면 보다 정확히 확인 가능합니다. </p>
							</div>
						</div> <!-- end of panel-body -->
					</div>
				</div> <!-- /.panel-default -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#accordion_oneLeft"
								href="#collapseFiveLeftThree" aria-expanded="false"> 아이디와 비밀번호(Password)를 변경할 수 있나요? </a> </h4>
					</div>
					<div id="collapseFiveLeftThree" class="panel-collapse collapse" aria-expanded="false" role="tablist">
						<div class="panel-body">
							<div class="img-accordion"> </div>
							<div class="text-accordion">
								<p> ID 변경을 위해서는 탈퇴 후 재가입을 하셔야 합니다. 회원탈퇴 시에는 보유하고 있는 포인트는 자동으로 소멸되며, 주문한 내역이 자동
									삭제되어 구입한 제품의 정보 확인, 반품 등 모든 처리가 불가하게 됩니다.
									비밀번호 변경은 [마이페이지 → 개인정보수정]에서 새로운 비밀번호를 입력하여 변경하실 수 있습니다. </p>
							</div>
						</div> <!-- end of panel-body -->
					</div>
				</div> <!-- /.panel-default -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#accordion_oneLeft"
								href="#collapseFiveLeftFour" aria-expanded="false"> 온라인(Barny) 포인트는 어디서 사용이 가능한가요? </a> </h4>
					</div>
					<div id="collapseFiveLeftFour" class="panel-collapse collapse" aria-expanded="false" role="tablist">
						<div class="panel-body">
							<div class="img-accordion"> </div>
							<div class="text-accordion">
								<p> 사이트에서 적립된 포인트는 온라인(Barny)에서만 사용 가능합니다. </p>
							</div>
						</div> <!-- end of panel-body -->
					</div>
				</div> <!-- /.panel-default -->
			</div>
			<!--end of /.panel-group-->
		</div>
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
</body>

</html>
