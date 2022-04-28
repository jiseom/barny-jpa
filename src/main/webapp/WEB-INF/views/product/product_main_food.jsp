<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/static/css/styles.css" rel="stylesheet"/>
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
 .food {
	margin-left : 15%; 
	margin-right : 4%;
	margin-top : 150px; 
}
.pagination {
	margin-left: 600px;
} 
.total-1 {
	margin-left : 8%;
}
.sidebar {
	position:fixed; 
	width:175px; 
	display:inline-block; 
	right:500; /* 창에서 오른쪽 길이 */ 
	top:-5%; /* 창에서 위에서 부터의 높이 */ 
	background-color: transparent; 
	margin:0;
}  
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
	
			searchForm.submit();
	
		});
	});
	
</script>

<body id="page-top">
<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<!-- Sidebar -->

<div class="total-1">
    <div class="sidebar p-3 bg-light" style="width: 15%; margin-top:200px; ">
        <!-- <a href="/" class="sidebar align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none"> -->

        <span class="fs-4">상품보기</span>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li id="main">
            <a href="/products/main" class="nav-link link-dark ">
                구독패키지
            </a>
        </li>
        <li id="drink">
            <a href="/products/drink" class="nav-link link-dark ">
                술
            </a>
        </li>
        <li id="food">
            <a href="/products/food" class=" nav-link link-dark active">
                안주
            </a>
        </li>
    </ul>

        <hr class="my-2">
<%--        <div class="col-lg-12">--%>
<%--            <form id='searchForm1' action="/product_main_liquor" method='get' style="font-size:10px;">--%>
<%--                &lt;%&ndash;     서치&ndash;%&gt;--%>
<%--                <select name='type'>--%>
<%--                    <option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>--%>
<%--                    <option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>상품이름</option>--%>
<%--                </select>--%>

<%--                <input type='text' name='keyword' style="width:60px;" value='<c:out value="${pageMaker.cri.keyword}"/>'/>--%>
<%--                &lt;%&ndash; 			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>--%>
<%--                            <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/> &ndash;%&gt;--%>
<%--                <button class='btn btn-secondary btn-sm'>Search</button>--%>
<%--            </form>--%>
<%--        </div>--%>
    </div>
	
<!-- 안주 상품 보기 -->
  	<div class="food text-center">
   	 <div class="row">  	   
	  <c:forEach items="${products}" var="dto">
      <div class="col-4">
        <div class="card h-100">
           <a href="#"><img class="card-img" src="${pageContext.request.contextPath}/static/ProductImg/54.jpg"></a>
          	<div class="card-body">
            <h2>${dto.productName}</h2>
            <p>${dto.price} 원</p>
            <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/products/${dto.id}/detail">상품보러가기</a></p>
          	</div>
        </div>
      </div>
      </c:forEach>
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