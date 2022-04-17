<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Find your own drink, Barny</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;300;400;500;600&family=Nanum+Gothic:wght@400;700;800&display=swap"
          rel="stylesheet">
    <!-- naver fonts -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/static/main_page/css/styles.css" rel="stylesheet"/>



</head>
<body id="page-top">
<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<!-- Masthead-->
<header class="masthead">
    <div class="container">
        <div class="masthead-subheading">당신만을 위한 맞춤형 바텐더</div>
        <div class="masthead-heading text-uppercase">지금 당신의 취향을 찾아보세요</div>
        <a class="btn btn-primary btn-xl text-uppercase" href="/drink_test">취향테스트</a>
    </div>
</header>

<!-- Services-->
<section class="page-section" id="services">
    <div class="container">
        <div class="text-center" style="margin-bottom: 5rem;">
            <h4 class="section-heading text-uppercase">바니와 시작하세요</h4>
        </div>
        <div class="row text-center">
            <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-poll-h fa-stack-1x fa-inverse"></i>
                        </span>
                <h4 class="my-3">맞춤형 서비스</h4>
                <p class="text-muted">간단한 취향 테스트를 통해 나에게 맞는 패키지를 찾기</p>
            </div>
            <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shipping-fast fa-stack-1x fa-inverse"></i>
                        </span>
                <h4 class="my-3">정기 구독</h4>
                <p class="text-muted">한달에 두번, 정기적으로 오는 찾아오는 서비스</p>
            </div>
            <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-gifts fa-stack-1x fa-inverse"></i>
                        </span>
                <h4 class="my-3">다양한 구성</h4>
                <p class="text-muted">주류를 포함한 밀키트, 특별 구성품까지</p>
            </div>
        </div>

    </div>
</section>


<!--Product Grid-->
<section class="page-section bg-light" id="portfolio">
    <div class="container">
        <div class="text-center">
            <div class="text-center" style="margin-bottom: 5rem;">
                <h4 class="section-heading text-uppercase">바니만의 특별한 패키지</h4>
            </div>

            <div class="row">
                <div class="col-lg-4 col-sm-6 mb-4">
                    <div class="card">
                        <a href="#"><img class="card-img-top" src="/static/img/image-0.png"></a>
                        <div class="card-title mt-4">심플함을 원할 땐</div>
                        <div class="card-body">
                            <h5>A 패키지</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 mb-5">
                    <div class="card">
                        <a href="#"><img class="card-img-top" src="/static/img/image-1.png"></a>
                        <div class="card-title mt-4">주당을 위한</div>
                        <div class="card-body">
                            <h5>B 패키지</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 mb-4">
                    <div class="card">
                        <a href="#"><img class="card-img-top" src="/static/img/image-2.png"></a>
                        <div class="card-title mt-4">새로운 영역으로 가기위한</div>
                        <div class="card-body">
                            <h5>C 패키지</h5>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <a class="btn btn-secondary btn-xl text-uppercase" href="/product_main">상품 정보 더보기</a>
        </div>
    </div>
</section>

<!-- Review-->
<section class="page-section" id="about">
    <div class="container">
        <div class="text-center">
            <h4 class="section-heading text-uppercase" style="margin-bottom: 5rem;">
                많은 분들이 이미 바니와 함께하고 계십니다</h4>


        </div>
        <ul class="timeline">
            <li>
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="static/main_page/assets/img/review/review-1.png"
                                                 alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>퇴근 후 혼술이 즐거워졌어요</h4>
                        <h6 class="subheading">조아희 30세, 직장인</h6>
                    </div>
                    <div class="timeline-body"><p class="text-muted">"퇴근 후 마트에서 아무 술이나 집어 스트레스를 해결하곤 했어요.
                        이제는 바니를 통해 내 취향에 맞는 술을 즐길 수 있어요."</p></div>
                </div>
            </li>
            <li class="timeline-inverted">
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="static/main_page/assets/img/review/review-2.png"
                                                 alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>전통주를 집에서도 즐길 수 있어요</h4>
                        <h6 class="subheading">박재유 35세, 프리랜서</h6>
                    </div>
                    <div class="timeline-body"><p class="text-muted">"전통주를 좋아하는데 시중에서는 구하기가 힘들어 곤란했어요.
                        하지만 이제는 손쉽게 집에서 마실 수 있습니다."</p></div>
                </div>
            </li>
            <li>
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="static/main_page/assets/img/review/review-3.png"
                                                 alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>밀키트까지 있어서</h4>
                        <h4>친구들과 파티할 때 좋아요</h4>
                        <h6 class="subheading">문지영 24세, 대학생</h6>
                    </div>
                    <div class="timeline-body"><p class="text-muted">"자취하면서 친구들을 초대할 때 항상 준비가 힘들었는데 바니 덕분에
                        음식과 술은 이제 걱정없습니다!" </p></div>
                </div>
            </li>
            <li class="timeline-inverted">
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="static/main_page/assets/img/review/review-4.png"
                                                 alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>삶의 질이 상승했어요</h4>
                        <h6 class="subheading">임성식 31세, 직장인</h6>
                    </div>
                    <div class="timeline-body"><p class="text-muted">"바니를 구독한 이후로 와인에 관심이 생겨서 동호회까지 가입하게 되었어요.
                        바니가 제 시야를 넓혀주었습니다."</p></div>
                </div>
            </li>
            <li class="timeline-inverted">
                <div class="timeline-image">
                    <h4>
                        지금
                        <br/>
                        바니와
                        <br/>
                        시작하세요!
                    </h4>
                </div>
            </li>
        </ul>
    </div>
</section>


<section class="page-section" id="outro">
    <div class="container">
        <div>지나친 음주는 건강에 해롭습니다</div>
        <div>바니는 건전한 술 문화를 지향합니다</div>
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

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/static/main_page/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</body>
</html>
