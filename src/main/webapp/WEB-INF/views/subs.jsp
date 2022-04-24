<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Find your own drink, Barny</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="/static/css/5.0bootstrap.min.css">
  <link rel="stylesheet" href="/static/css/styles.css">
  <link href="/static/main_page/css/styles.css" rel="stylesheet" />


  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />

  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico" />
  <!-- Font Awesome icons (free version)-->
  <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!--달력-->
  <link href="/static/css/calendarstyle.css" rel="stylesheet" />
  <script src="/static/js/simplecalendar.js"></script>
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700">
  <link rel="stylesheet" href="http://weloveiconfonts.com/api/?family=fontawesome">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

  <style>
    body {
      margin: 0;
    }
  </style>
</head>


<body>
  <!-- Navigation-->
  <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
  <!--메인 구독 버튼-->
  <div class="subs-container" id="main">
    <div class="contents">
      <p class="contents1">매일 밤, 찾아오는 Bar는 어떠세요?</p>
      <p class="contents2">술&안주 정기구독 서비스</p>
      <p class="contents3">특별한 가격으로 나만의 Bar를 꾸려보세요</p>

      <a class="btn btn-outline-yellow btn-lg text-uppercase mt-5" href="/products/main">구독하기</a>
    </div>
  </div>

  <!--Product Grid-->
  <section class="page-section bg-light">
    <div class="container">
      <div class="text-center">
        <div class="text-center" style="margin-bottom: 5rem;">
          <h4 class="section-heading text-uppercase">바니만의 특별한 패키지</h4>
        </div>
      </div>

      <div class="col-12 produce">
        <div class="col-4 package-img">
          <div class="packge-img">
            <img src="/static/img/image-0.png" style="flex-shrink: 0; width: 80%;">
          </div>
        </div>
        <div class="col-8 package-text">
          <div class="packge-text">
            <H3 class="packge-title" style="margin-bottom: 30px !important;">부담없이 마실 수 있는 A 패키지</H3>
            <p>가장 기본적인 아이템이자, 부담없이 즐길 수 있는 친구들로 구성되어 있습니다.<br>
              모두가 좋아하는 맥주와 안주, barny의 choice를 믿어보세요!<br>
              <br>
              구성품: 맥주, 감자칩, 머시기 저시기
            </p>
            <br>
            <br>
            <h3>29,900원</h3>
          </div>
        </div>

      </div>

      <div class="col-12 produce">
        <div class="col-4 package-img">
          <div class="packge-img">
            <img src="/static/img/image-1.png" style="flex-shrink: 0; width: 80%;">
          </div>
        </div>
        <div class="col-8 package-text">
          <div class="packge-text">
            <H3 class="packge-title" style="margin-bottom: 30px !important;">남들이 모르는 우리 술 B 패키지</H3>
            <p>전국의 장인들이 만든 술을 합리적인 가격에 맛보세요.<br>
              Barny가 자랑하는 유통 시스템, barny의 choice를 믿어보세요!<br>
              <br>
              구성품: 이달의 장인 술, 머시기 저시기
            </p>
            <br>
            <br>
            <h3>39,900원</h3>
          </div>
        </div>

      </div>

      <div class="col-12 produce">
        <div class="col-4 package-img">
          <div class="packge-img">
            <img src="/static/img/image-2.png" style="flex-shrink: 0; width: 80%;">
          </div>
        </div>
        <div class="col-8 package-text">
          <div class="packge-text">
            <H3 class="packge-title" style="margin-bottom: 30px !important;">술 하나로 전세계를 돌아다니는 C 패키지</H3>
            <p>집에 앉아서 세계 일주를 할 수 있어요.<br>
              전세계의 맛있는 와인을 추천해드려요. barny의 choice를 믿어보세요!<br>
              <br>
              구성품: 이달의 와인, 머시기 저시기
            </p>
            <br>
            <br>
            <h3>49,900원</h3>
          </div>
        </div>

      </div>

    </div>
  </section>

  <!--달력-->
  <section class="page-section bg-white">
    <div class="container-fluid">
      <div class="text-center">
        <div class="text-center" style="margin-bottom: 3rem;">
          <h4 class="section-heading text-uppercase">정기 배송 달력</h4>
        </div>
        <div class="calendar-container">
          <div class="calendar">
            <header>
              <h2 class="month"></h2>
            </header>
            <table>
              <thead>
                <tr style="text-align: center;">
                  <td>월</td>
                  <td>화</td>
                  <td>수</td>
                  <td>목</td>
                  <td>금</td>
                  <td>토</td>
                  <td>일</td>
                </tr>
              </thead>
              <tbody style="text-align: center;">
                <tr>
                  <td date-month="12" date-day="1">1</td>
                  <td date-month="12" date-day="2">2</td>
                  <td date-month="12" date-day="3">3</td>
                  <td date-month="12" date-day="4">4</td>
                  <td date-month="12" date-day="5">5</td>
                  <td date-month="12" date-day="6">6</td>
                  <td date-month="12" date-day="7">7</td>
                </tr>
                <tr>
                  <td date-month="12" date-day="8">8</td>
                  <td date-month="12" date-day="9">9</td>
                  <td date-month="12" date-day="10">10</td>
                  <td date-month="12" date-day="11">11</td>
                  <td date-month="12" date-day="12">12</td>
                  <td date-month="12" date-day="13">13</td>
                  <td date-month="12" date-day="14">14</td>
                </tr>
                <tr>
                  <td date-month="12" date-day="15">15</td>
                  <td date-month="12" date-day="16">16</td>
                  <td date-month="12" date-day="17">17</td>
                  <td date-month="12" date-day="18">18</td>
                  <td date-month="12" date-day="19">19</td>
                  <td date-month="12" date-day="20">20</td>
                  <td date-month="12" date-day="21">21</td>
                </tr>
                <tr>
                  <td date-month="12" date-day="22">22</td>
                  <td date-month="12" date-day="23">23</td>
                  <td date-month="12" date-day="24">24</td>
                  <td date-month="12" date-day="25">25</td>
                  <td date-month="12" date-day="26">26</td>
                  <td date-month="12" date-day="27">27</td>
                  <td date-month="12" date-day="28">28</td>
                </tr>
                <tr>
                  <td date-month="12" date-day="29">29</td>
                  <td date-month="12" date-day="30">30</td>
                  <td date-month="12" date-day="31">31</td>
                </tr>
              </tbody>
            </table>
            <div class="list" style="margin-left: 10%;">
              <div class="day-event" date-month="12" date-day="5">
                <a class="close fontawesome-remove"></a>
                <h2 class="title">월 초 정기배송일</h2>
                <p class="text">결제일을 기준으로 오는 가장 빠른 정기배송일에 Barny가 찾아갑니다!</p>

              </div>
              <div class="day-event" date-month="12" date-day="20">
                <a class="close fontawesome-remove"></a>
                <h2 class="title">월 말 정기배송일</h2>
                <p class="text">결제일을 기준으로 오는 가장 빠른 정기배송일에 Barny가 찾아갑니다!</p>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>

    </div>

  </section>


  <!--푸터-->
  <!--top-button-->
  <img id="myBtn" src="/static/main_page/assets/top-btn.png" onclick="topFunction()">

  <!--kakao-chat-->
  <a href="javascript:void kakaoChatStart()" class="kakaoChatPc hidden-md hidden-sm hidden-xs" id="kakao-chat">
    <img src="/static/main_page/assets/kakao-chat.png" width="50px" height="50px">
  </a>

  <!-- Footer-->
  <footer class="footer py-4">
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

  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="/static/main_page/js/scripts.js"></script>
  <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type='text/javascript'>
    Kakao.init('dab10012c7e15e9d67728cf3d50faa8a'); // 사용할 앱의 JavaScript키를 입력해 주세요.
    function kakaoChatStart() {
      Kakao.Channel.chat({
        channelPublicId: '601802' // 카카오톡 채널 홈 URL에 명시된 ID를 입력합니다.
      });
    }
  </script>

</body>

</html>