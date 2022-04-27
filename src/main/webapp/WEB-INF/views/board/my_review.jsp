<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Find your own drink, Barny</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/static/main_page/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;300;400;500;600&family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<!-- naver fonts -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="/static/main_page/css/styles.css" />
<link rel="stylesheet" href="/static/my_page/css/my_page.css" />
<link rel="stylesheet" href="/static/table/css/style.css" />
<link rel="stylesheet" href="/static/table/css/owl.carousel.min.css" />

</head>
<tbody>

	<body>

	<%--navbar--%>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

		<!--content-->
		<div class="container" style="padding-top: 2rem;">
			<div class="row">
				<div class="col-3" style="padding: 7rem 0;">
					<div class="list-group side-nav">
						<a href="/my-page/press"
							class="list-group-item list-group-item-action">구독 정보</a> <a
							href="/my-page/purchase-list"
							class="list-group-item list-group-item-action">구매 내역</a> <a
							href="/inquiries"
							class="list-group-item list-group-item-action">문의 내역</a> <a
							href="/reviews"
							class="list-group-item list-group-item-action active"
							aria-current="true">후기</a> <a href="/my-page/point"
							class="list-group-item list-group-item-action">적립금</a> <a
							href="/my-page/edit" class="list-group-item list-group-item-action">개인
							정보 수정</a>
					</div>
				</div>

				<div class="col-9" style="width: 70%; padding: 7rem 0;">
					<div class="board_name">
						후기 <a class="board_name_small">포인트 및 주문내역, 개인정보 등을 확인하거나
							변경하세요.</a>
					</div>
					<div class="table-responsive outline pb-3">
						<table class="table custom-table" style="min-width: 500px;">
							<thead style="border-bottom: solid 1px;">
								<tr>
									<td>번호</td>
									<td>제목</td>
									<td>날짜</td>
									<td>상품</td>
									<td>좋아요</td>
								</tr>
							</thead>
							<tbody>

								<c:choose>

									<c:when test="${empty my_review}">

										<tr>
											<td colspan="5" align="center">작성한 후기가 없습니다</td>
										</tr>

									</c:when>

									<c:when test="${!empty my_review}">


										<c:forEach var="reviewList" items="${my_review}">


											<tr>

												<td><c:out value="${reviewList.board_id}" /></td>
												<td><a
													href="review_content_view?board_id=${reviewList.board_id}">${reviewList.b_title}</a></td>
												<td><c:out value="${reviewList.b_date}" /></td>
												<td><a
													href="${pageContext.request.contextPath}/product_view?product_id=${reviewList.product_id}">${reviewList.product_name}</a></td>
												<td><c:out value="${reviewList.like_count}" /></td>

											</tr>

										</c:forEach>

									</c:when>

								</c:choose>


							</tbody>

						</table>


						<div class="line mb-3"
							style="border-bottom: solid 2px; border-bottom-color: #EBC24B;"></div>
						<a class="btn-basic post mb-2" type="button" title="글쓰기"
							onclick="location.href='/user/review/write_view/**'">글쓰기</a>


									<!--  Pagination -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="my_review${pageMaker.makeQuery(pageMaker.startPage - 1) }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											<span class="sr-only">Previous</span>
									</a></li>
								</c:if>
								<c:forEach var="idx" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li class="page-item "><a class="page-link"
										href="my_review${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
										aria-label="Next"
										href="my_review${pageMaker.makeQuery(pageMaker.endPage +1) }">
											<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
									</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>

			</div>
		</div>


		<!-- Footer-->
		<footer class="footer">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-4 text-lg-start">
						<b>주식회사 바니</b> <br> 서울특별시 종로구 종로 69 YMCA빌딩 7층 <br>Copyright
						&copy; Barny Inc. All rights reserved.
					</div>
					<div class="col-lg-4 my-3 my-lg-0">
						<a class="btn-dark btn-social mx-2" href="#!"><i
							class="fab fa-twitter"></i></a> <a class="btn-dark btn-social mx-2"
							href="#!"><i class="fab fa-instagram"></i></a>
					</div>
					<div class="col-lg-4 text-lg-end">
						<a class="link-dark text-decoration-none me-3" href="#!">개인정보처리방침</a>
						<a class="link-dark text-decoration-none" href="#!">이용약관</a>
					</div>
				</div>
			</div>
		</footer>


		<!--top-button-->
		<img id="myBtn" src="/static/main_page/assets/top-btn.png"
			onclick="topFunction()">


		<!--kakao-chat-->
		<a href="javascript:void kakaoChatStart()"
			class="kakaoChatPc hidden-md hidden-sm hidden-xs" id="kakao-chat">
			<img src="/static/main_page/assets/kakao-chat.png" width="50px"
			height="50px">
		</a>

		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type='text/javascript'>
			Kakao.init('7e53e24ce9a07956bfb5ac4930333caa');

			function kakaoChatStart() {
				Kakao.Channel.chat({
					channelPublicId : '_WDxjSs'
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


<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
     id="mainNav_2">
    <div class="container">
        <a class="navbar-brand" href="/main"><img
                src="/static/main_page/assets/img/logo.png" alt="바니 로고 1"/></a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <li class="nav-item"><a class="nav-link" href="/subscribe">구독</a></li>
                <li class="nav-item"><a class="nav-link" href="/story">브랜드
                    스토리</a></li>
                <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"> 상품 보기 </a>
                    <ul class="dropdown-menu"
                        aria-labelledby="navbarDarkDropdownMenuLink">
                        <li></li>
                        <a class="dropdown-item" href="/product_main">패키지</a></li>
                        <li><a class="dropdown-item" href="/product_main_liquor">술</a></li>
                        <li><a class="dropdown-item" href="/product_main_food">안주</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="/event">이벤트</a></li>
                <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"> 고객센터 </a>
                    <ul class="dropdown-menu"
                        aria-labelledby="navbarDarkDropdownMenuLink">
                        <li></li>
                        <a class="dropdown-item" href="/notice">공지사항</a></li>
                        <li><a class="dropdown-item" href="/notice/faq">자주 묻는 질문</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <sec:authorize access="isAnonymous()">
                    <li class="nav-item"><a class="nav-link" href="/loginForm">로그인</a></li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_USER')">
                    <li class="nav-item"><a class="nav-link" href="/board/my_page">마이페이지</a></li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                    <li class="nav-item"><a class="nav-link" href="/admin/statistics">관리페이지</a></li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_USER')">
                    <li class="nav-item"><a class="nav-link" href="/user/cart5">장바구니</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>


<!--content-->
<div class="container" style="padding-top: 2rem;">
    <div class="row">
        <div class="col-3" style="padding: 7rem 0;">
            <div class="list-group side-nav">
                <a href="/board/press" class="list-group-item list-group-item-action">구독 정보</a>
                <a href="/board/purchase_list" class="list-group-item list-group-item-action">구매 내역</a>
                <a href="/board/my_view" class="list-group-item list-group-item-action">문의 내역</a>
                <a href="/board/my_review" class="list-group-item list-group-item-action active" aria-current="true">후기</a>
                <a href="/board/point" class="list-group-item list-group-item-action">적립금</a>
                <a href="/user/edit" class="list-group-item list-group-item-action">개인 정보 수정</a>
            </div>
        </div>

        <div class="col-9" style="width: 70%; padding: 7rem 0;">
            <div class="board_name">후기
                <a class="board_name_small">포인트 및 주문내역, 개인정보 등을 확인하거나 변경하세요.</a>
            </div>
            <div class="table-responsive outline pb-3">
                <table class="table custom-table" style="min-width: 500px;">
                    <thead style="border-bottom: solid 1px;">
                    <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>날짜</td>
                        <td>상품</td>
                        <td>좋아요</td>
                    </tr>
                    </thead>
                    <tbody>

         <c:choose>

            <c:when test="${empty my_review}" >

               <tr><td colspan="5" align="center">작성한 후기가 없습니다</td></tr>

            </c:when> 

            <c:when test="${!empty my_review}">


            <c:forEach var="reviewList" items="${my_review}">


                  <tr>
                     
                     <td><c:out value="${reviewList.board_id}"/></td>
                     <td><a href="review_content_view?board_id=${reviewList.board_id}">${reviewList.b_title}</a></td>
                     <td><c:out value="${reviewList.b_date}"/></td>
                     <td><a href="${pageContext.request.contextPath}/product_view?product_id=${reviewList.product_id}">${reviewList.product_name}</a></td>
                     <td><c:out value="${reviewList.like_count}"/></td>

                  </tr>

               </c:forEach>

            </c:when>

         </c:choose>
         

      </tbody>

   </table>

                
                <div class="line mb-3" style="border-bottom: solid 2px; border-bottom-color: #EBC24B;"></div>
                <a class="btn-basic post mb-2" type="button" title="글쓰기" onclick="location.href='/user/review/write_view/**'">글쓰기</a>
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