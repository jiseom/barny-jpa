<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Find your own drink, Barny</title>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css"/>
    <!-- naver fonts -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/static/main_page/css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/styles.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

</head>

<style>
    .order {
        padding-top: 100px;
        margin-left: 500px;
    }

</style>
<body id="page-top">

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

<!-- 주문페이지  -->
<div class="order">
    <div class="order-1" style="margin-left:30%; margin-bottom:5%;">
        <h1>주문서</h1>
    </div>

    <div class="container mt-4">
        <h3>주문상품</h3>
        <div class="row">
            <div class="col-md-8">
                <form action="<c:url value='/order' />" method="post">
                    <%--                 <input name="id" type="hidden" value="<sec:authentication property="principal.cartList"/>">
                                    <td><sec:authentication property="principal.cartList"/></td>
                                  <tr>
                                  <td>상품이름</td>
                                  <td>수량</td>
                                  <td>가격</td>
                                  <td>&nbsp;</td>
                                  </tr></br>

                                  <c:forEach items="${cartList}" var="dto">
                                  <tr>
                                     <td>${dto.productName}</td>
                                     <td>${dto.quantity}</td>
                                     <%-- <td>${dto.price}</td>
                                  </tr></br>
                                  </c:forEach>	--%>

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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${cartList}" var="dto">
                                        <tr class="alert" role="alert">
                                            <td>&nbsp;</td>
                                            <td><a href="#"><img class="img" style="width:70px; height:70px;"
                                                                 src="/static/img/002.png"></a></td>
                                            <td>${dto.selectedItem.productName}</td>
                                            <td>${dto.selectedItem.price} </td>
                                            <td>${dto.quantity}</td>
                                        </tr>
                                    </c:forEach>
                                    <td id="totalPrice" colspan="5" align="right">
                                        장바구니 금액 합계 : <fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###"/>원
                                        <br>
                                        배송료 : ${map.fee} 원<br>
                                        총 주문금액 : <fmt:formatNumber value="${map.sum}" pattern="#,###,###"/>원
                                        <input id="sum" name="sum" type="hidden" value="${map.sum}">
                                    </td>
                                    <input id="orderDate" name="orderDate" type="hidden" value="${createOrderForm.orderDate}">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                    <hr class="my-4">
                </form>
            </div>
        </div>

        <h3>주문자 정보</h3>
        <div class="row">
            <div class="col-md-8">
                <form action="<c:url value='/cart' />" method="post">
                    <input name="id" type="hidden" value="<sec:authentication property="principal.account.accountId"/>">
                    <p>주문아이디 : <sec:authentication property="principal.account.accountId"/></p>
                    <input id="name" name="name" type="hidden"
                           value="<sec:authentication property="principal.account.name"/>"></p>
                    <p>주문자이름 : <sec:authentication property="principal.account.name"/></p>
                    <input id="tel" name="tel" type="hidden"
                           value="<sec:authentication property="principal.account.tel"/>"></p>
                    <p>휴대폰 : <sec:authentication property="principal.account.tel"/></p>
                    <input id="email" name="email" type="hidden"
                           value="<sec:authentication property="principal.account.email"/>"></p>
                    <p>이메일 : <sec:authentication property="principal.account.email"/></p>
                    <hr class="my-4">
                </form>
            </div>
        </div>

        <h3>적립금</h3>
        <div class="row">
            <div class="col-md-8">
                <form action="<c:url value='/cart' />" method="post">
                    <input name="id" type="hidden" value="<sec:authentication property="principal.account.id"/>">
                    <p>적립금 :&nbsp; <sec:authentication property="principal.account.point"/>&nbsp;p&nbsp;<button
                            id="point" type="button" class="btn btn-secondary btn-md">사용하기
                    </button>
                    </p>
                    <p>(5000p 이상 사용가능)
                        <input id="point1" type="hidden"
                               value="<sec:authentication property="principal.account.point"/>"></p>
                    <hr class="my-4">
                </form>
            </div>
        </div>

        <h3>배송 정보</h3>
        <div class="row">
            <div class="col-md-8">
                <form action="<c:url value='/cart' />" method="post">
                    <input name="id" type="hidden" value="<sec:authentication property="principal.account.id"/>">
                    <input id="address" name="address" type="hidden"
                           value="<sec:authentication property="principal.account.address"/>"></p>
                    <p>배송지 : <sec:authentication property="principal.account.address"/></p>
                    <hr class="my-4">
                </form>
                <!-- <button id="payment" type="button" class="btn-outline-dark btn-sm">결제하기</button> -->
            </div>
        </div>

        <h3>결제 정보</h3>
        <div class="table-wrap col-8">
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h4 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            무통장입금
                        </button>
                    </h4>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>---은행 선택---</option>
                                <option value="1">우리은행 1234567890 (주)Barny</option>
                                <option value="2">농협은행 1234567890 (주)Barny</option>
                            </select>

                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h4 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            카드결제
                        </button>
                    </h4>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <button id="payment" type="button" class="btn btn-secondary btn-sm">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- <button type="submit" class="orderPage btn-outline-dark btn-sm" href="/user/orderPage">주문하기</button> -->
<div class="text-center mb-5 mt-5">
    <input id="point2" name="point2" type="hidden" value="<sec:authentication property="principal.account.point"/>">
    <!-- <a class="btn btn-secondary btn-lg text-uppercase" href="/orderPage">주문하기!</a> -->
    <button id="order" type="button" value="<sec:authentication property="principal.account.point"/>"
            class="btn btn-secondary btn-lg text-uppercase" href="/order/order-complete">주문하기!
    </button>
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

<!-- 아임포트 -->
<script>
    $(document).ready(function () {

        var IMP = window.IMP;
        IMP.init("imp13011359");

        $("#payment").click(function (event) {

            IMP.request_pay({
                pg: 'inicis',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: 'A패키지',
                amount: 100,
                buyer_email: '5678@naver.com',
                buyer_name: '홍길삼',
                buyer_tel: '010-1234-5678',
                buyer_addr: '서울시 종로구',
                buyer_postcode: '123-456'
            }, function (rsp) {
                if (rsp.success) {
                    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                    jQuery.ajax({
                        url: "/board/purchase_list", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            imp_uid: rsp.imp_uid
                            //기타 필요한 데이터가 있으면 추가 전달
                        }
                    }).done(function (data) {
                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        if (everythings_fine) {
                            var msg = '결제가 완료되었습니다.';
                            msg += '\n고유ID : ' + rsp.imp_uid;
                            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                            msg += '\결제 금액 : ' + rsp.paid_amount;
                            msg += '카드 승인번호 : ' + rsp.apply_num;

                            alert(msg);
                        } else {
                            //[3] 아직 제대로 결제가 되지 않았습니다.
                            //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                        }
                    });
                    location.href = '${pageContext.request.contextPath}/orderPage';
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;

                    alert(msg);
                }
            });
        });
    });
</script>

<script>
    // 주문
    $(document).ready(function () {
        $("#order").click(function (event) {
            event.preventDefault();
            var id = $("#id").val();
            var sumMoney = $("#sumMoney").val();
            var orderDate = $("#orderDate").val();
            var cart = {
                id: id,
                sumMoney: sumMoney,
                orderDate: orderDate
            };
            //dataType: 'json',
            $.ajax({
                type: "POST",
                url: "/order/order-process",
                cache: false,
                contentType: 'application/json; charset=utf-8',
                data: cart,
                success: function (result) {
                    alert("결제가 완료되었습니다!");
                    location.href = "/order/order-complete";
                },

                error: function (e) {
                    alert("실패");
                    console.log(e);
                }
            });
        });
    });
</script>


<!--  <script>
	$(document).ready(function(){
			
	    var IMP = window.IMP;
	    IMP.init("imp13011359");
	    
	    var member_name = $("#name").val();
	    var tel = $("#tel").val();
	    var address = $("#address").val();
	    var email = $("#email").val();
	    var point = $("#point1").val(); 
	    var total_price =$("#total").val();

	    
/* 	 	var insertOrder = {
		    member_name : member_name,
		    tel : tel,
		    address : address,
		    mail : mail,
		    point : point + 100, 
		    total_price : total_price
		 	  }; */
	    
	    $("#payment").click(function(event) {
	    
	    IMP.request_pay({
	        pg : 'inicis',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : 'A패키지',
	        amount : /* total_price */100,
	        buyer_email : email,
	        buyer_name : member_name,
	        buyer_tel : tel,
	        buyer_addr : address,
	        buyer_postcode : '123-456'
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	
	        var insertOrder = {
			    member_name : member_name,
			    tel : tel,
			    address : address,
			    email : email,
			    point : point + 100, 
			    total_price : total_price
			 }
			 	  
	        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	        	jQuery.ajax({
	        		url: "/user/insertOrder", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {
	    	    		imp_uid : rsp.imp_uid,
	    	    		insertOrders
	    	    		//기타 필요한 데이터가 있으면 추가 전달
	        		}
	        	}).done(function(data) {
	        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	        		if ( everythings_fine ) {
	        			var msg = '결제가 완료되었습니다.';
	        			msg += '\n고유ID : ' + rsp.imp_uid;
	        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	        			msg += '\결제 금액 : ' + rsp.paid_amount;
	        			msg += '카드 승인번호 : ' + rsp.apply_num;

	        			alert(msg);
	        		} else {
	        			//[3] 아직 제대로 결제가 되지 않았습니다.
	        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	        		}
	        	});
	        	
	        	location.href='${pageContext.request.contextPath}/orderPage';
	        	
	        } else {
	            var msg = '결제에 실패하였습니다.'; 
	            msg += '에러내용 : ' + rsp.error_msg;

	            alert(msg);
	        }
	    });
	    });
	});    	    	   
</script> -->

<!-- 적립금 -->
<script type="text/javascript">
    $(document).ready(function () {

        $("#point").click(function (event) {

            var point = $("#point1").val();

            if ($("#point1") >= "5000") {
                alert("5000원 이상 사용가능합니다!")
                $button_point = $('#point').attr('disabled', true);


            }


        });
    });
</script>

<!-- 	<script>
		// 적립금 적립
		$(document).ready(function () {

			$("#insertPoint").click(function (event) {

				event.preventDefault();

				var point = $("#point2").val();


				//dataType: 'json',
				$.ajax({
					type: "GET",
					url: "/user/insertPoint",
					cache: false,
					contentType: 'application/json; charset=utf-8',
					data: point,
					success: function (result) {
						location.href='${pageContext.request.contextPath}/orderPage';
					},
					error: function (e) {
						alert("실패");
						console.log(e);
					}
				});

			});

		});
	</script> -->

<script>
    $(document).ready(function () {

        $("#insertPoint_1").click(function (event) {

            event.preventDefault();

            var insertPoint_1 = $("#point2").val();


            //dataType: 'json',
            $.ajax({
                type: "GET",
                url: "/user/insertPoint",
                cache: false,
                contentType: 'application/json; charset=utf-8',
                data: insertPoint_1,
                success: function (result) {
                    alert("100포인트가 적립되었습니다!");
                },
                error: function (e) {
                    alert("실패");
                    console.log(e);
                }
            });

        });

    });
</script>
</html>