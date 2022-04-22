<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/static/cardbarny/card.css" />
  <link rel="stylesheet" href="/static/css/5.0bootstrap.min.css" />

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

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>

<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

  <!--게임-->
  <div id="wrapper" class="container" style="margin-top: 2%; margin-bottom: 1%;">
    <div class="title">
      <p>숨어있는 바니를 찾고 적립금을 받아가세요!</p>
    </div>
    <div id="cardground"></div>
    <br>
    <div>
      <form name="addPoint" action="/events/cardbarny/add-point" method="post">
        <input id="id" type="hidden" name="id" value="<sec:authentication property="principal.account.id"/>">
        <input id="start_btn" type="button" style="display: none" class="btn btn-lg btn-outline-warning" value='적립하기'/>
      </form>
    </div>
  </div>
  <script type="text/javascript" src="/static/cardbarny/card.js"></script>
  <script>
    window.onload = function () {
        $('#start_btn').click(function () {
          debugger;
            function convertDateFormat(LocalDate) {
                var year = LocalDate.getFullYear();
                var month = LocalDate.getMonth() + 1;
                month = month >= 10 ? month : '0' + month;
                var day = LocalDate.getDate();
                day = day >= 10 ? day : '0' + day;
                return [year, month, day].join('');
            }

            var today = convertDateFormat(new LocalDate());
            var participatedDate = '${participatedDate}';
            if (participatedDate == today) {
                alert('해당 이벤트는 하루에 한번만 참여 가능합니다.')
                return false
            }
            alert("적립되었습니다.");
            document.addPoint.submit();
        });

    };
</script>

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