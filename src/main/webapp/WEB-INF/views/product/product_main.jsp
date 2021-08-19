<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Find your own drink, Barny</title>
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
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/static/main_page/js/scripts.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<style>
  .card-img {
  width: 200px;
  height: 250px;
  object-fit: cover;

  } 

 .searchForm1 {
	position:fixed;  
	width:175px; 
	display:inline-block; 
	right:500; /* 창에서 오른쪽 길이 */ 
	top:50%; /* 창에서 위에서 부터의 높이 */ 
	background-color: transparent; 
	margin:0;
	text-align: center;
} 

 .package {
	margin-left : 15%; 
	margin-right : 4%;
	margin-top : 80px;  

}

.pagination {
	margin-left: 600px;
} 

.total-1 {
	margin-left : 8%;
}

.sidebar {
 	/* position : fixed; */ 
 	position : absolute; 
	width : 175px; 
	display : inline-block; 
	right : 500; /* 창에서 오른쪽 길이 */ 
	top : 16%; /* 창에서 위에서 부터의 높이 */ 
	background-color : transparent; 
	margin : 0; 	

}


</style>
<body id="page-top">


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

<!--슬라이더바-->

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner" style="width:100%; height: 450px !important;">
        <div class="carousel-item active">
            <img src="static/img/first.jpg" class="d-block w-100" alt="First Slide">
        </div>
        <div class="carousel-item">
            <img src="static/img/second.jpg" class="d-block w-100" alt="Second Slide">
        </div>
        <div class="carousel-item">
            <img src="static/img/third.jpg" class="d-block w-100" alt="Third Slide">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Sidebar -->
<div class="total-1">
     <div class="sidebar p-3 bg-light" style="width: 15%; margin-top:200px; "> 
      <!-- <a href="/" class="sidebar align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none"> -->
        <span class="fs-4">상품보기</span>
      </a>
      <hr>
      <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
          <a href="/product_main" class="nav-link link-dark active" >
            구독패키지
          </a>
        </li>
        <li>
          <a href="/product_main_liquor" class="nav-link link-dark" >
            술
          </a>
        </li>
        <li>
          <a href="product_main_food" class="nav-link link-dark">
            안주
          </a>
        </li>
      </ul>
      <hr class="my-2">
      <div class="col-lg-12">
		<form id='searchForm1' action="/product_main_liquor" method='get' style="font-size:10px;">
  			<select name='type' >
 				<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
				<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>상품이름</option> 
			</select>  
			<input type='text' name='keyword' style="width:60px;"value='<c:out value="${pageMaker.cri.keyword}"/>'/>
<%-- 			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/> --%>
			<button class='btn btn-secondary btn-sm'>Search</button>
		</form>
	</div>
</div>

<!-- 패키지 상품 보기 -->
<div class="package text-center"> 
    <div class="row">
        <c:forEach items="${product_main}" var="dto">
            <div class="col-4">
                <div class="card h-100">
                    <a href="#"><img class="card-img width=100" src="${dto.image_route}"></a>
                    <div class="card-body">
                        <h2>${dto.product_name}</h2>
                        <p>회원할인가</p>
                        <sup style="text-decoration:line-through; color:#999999; ">70,000 원</sup>  
                        <p> ${dto.price} 원</p>
                        <p><a class="btn btn-secondary" href="product_view?product_id=${dto.product_id}">상품보러가기</a></p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

<!-- 구독하기 버튼 -->

<!-- <div class="text-center mb-5 mt-5">
    <button type="button" class="btn btn-outline-dark btn-lg mt-5">구독하기</button>
    <a class="btn btn-secondary btn-lg text-uppercase" href="/#">구독하기</a>
</div> -->

<div style="height: auto; width: 100%; "/>
<div class="container-2">
    <div class="text-center mb-5 mt-5">
        <h3 class="display-4 mb-5">이런 상품은 어떠세요?</h3>
        <h6>구독패키지 구매 후 구매가능</h6>
    </div>
</div>

<!-- 추천 상품보기-->
<!--  <div class="container mt-4 text-center"> -->
    <div class="row">
      <div class="col-4">
        <div class="card h-100">
          <a href="#"><img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/26.jpg"></a>
          <div class="card-body">
            <h2>술1</h2>
          </div>
        </div>
      </div>

      <div class="col-4">
        <div class="card h-100">
          <a href="#"><img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/14.jpg"></a>
          <div class="card-body">
            <h2>술2</h2>
          </div>
        </div>
      </div>

      <div class="col-4">
        <div class="card h-100">
          <a href="#"><img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/32.jpg"></a>
          <div class="card-body">
            <h2>술3</h2>
          </div>
        </div>
      </div>
    </div>
<!--   </div> -->

<!--   <div class="container mt-4 text-center"> -->
    <div class="row">
      <div class="col-4">
        <div class="card h-100">
          <a href="#"><img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/34.jpg"></a>
          <div class="card-body">
            <h2>안주1</h2>
          </div>
        </div>
      </div>

      <div class="col-4">
        <div class="card h-100">
          <a href="#"><img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/35.jpg"></a>
          <div class="card-body">
            <h2>안주2</h2>
          </div>
        </div>
      </div>


      <div class="col-4">
        <div class="card h-100">
          <a href="#"><img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/60.jpg"></a>
          <div class="card-body">
            <h2>안주3</h2>
          </div>
        </div>
      </div>
    </div>
<!--   </div> -->

<!-- 상품 더보기 버튼 -->

<div class="text-center mb-5 mt-5">
    <!--  <button type="button" class="btn btn-outline-dark btn-lg mt-5">상품 더 보러가기!</button> -->
    <a class="btn btn-secondary btn-lg text-uppercase" href="/product_main_liquor">상품 더 보러가기!</a>
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