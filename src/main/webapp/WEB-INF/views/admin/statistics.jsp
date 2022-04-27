<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="/static/admin_page/css/styles.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">


<main>
    <div class="container-fluid" style="width: 80%;">
        <h1 class="title mt-4 py-4">관리자 페이지</h1>
        <div class="row py-5">
            <div class="col-xl-3 col-md-6">
                <div class="card admin-menu text-white mb-4">
                    <div class="card-body">회원 관리</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="/admin/account-list">더보기</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card admin-menu text-white mb-4">
                    <div class="card-body">공지사항 관리</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="/admin/notices">더보기</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card admin-menu text-white mb-4">
                    <div class="card-body">1:1 문의 관리</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="/board/adminList">더보기 </a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card admin-menu text-white mb-4">
                    <div class="card-body">주문 관리</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">더보기</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="title mb-5"></div>

        <div class="row pt-5">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        일일 방문자 수
                    </div>
                    <div class="card-body">
                        <canvas id="myAreaChart" width="100%" height="40"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        일별 매출
                    </div>
                    <div class="card-body">
                        <canvas id="myBarChart_2" width="100%" height="40"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        월별 매출
                    </div>
                    <div class="card-body">
                        <canvas id="myBarChart" width="100%" height="40"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-pie me-1"></i>
                        취향테스트
                    </div>
                    <div class="card-body">
                        <canvas id="myPieChart" width="100%" height="40"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/static/admin_page/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/static/admin_page/assets/demo/chart-area-demo.js"></script>
<script src="/static/admin_page/assets/demo/chart-bar-demo.js"></script>
<script src="/static/admin_page/assets/demo/chart-bar-demo2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/static/admin_page/js/datatables-simple-demo.js"></script>
<script src="/static/admin_page/assets/demo/chart-pie-demo.js"></script>
<%--<script>--%>

<%--    function extractToMapObject(mapString) {--%>
<%--        mapString = mapString.replace('{', '');--%>
<%--        mapString = mapString.replace('}', '');--%>
<%--        let splitedMapString = mapString.split(',').map(e => e.split('='));--%>
<%--        let monthTotalPriceMap = new Map(splitedMapString);--%>
<%--        return monthTotalPriceMap;--%>
<%--    }--%>

<%--    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';--%>
<%--    Chart.defaults.global.defaultFontColor = '#292b2c';--%>


<%--    // Bar Chart Example--%>
<%--    let monthTotalPrice = "${monthTotalPrice}";--%>
<%--    let dayTotalPrice = "${dayTotalPrice}";--%>

<%--    let monthTotalPriceMap = extractToMapObject(monthTotalPrice);--%>
<%--    let dayTotalPriceMap = extractToMapObject(dayTotalPrice);--%>

<%--    console.log(monthTotalPriceMap);--%>
<%--    console.log(dayTotalPriceMap);--%>

<%--    function createNewChart(context, labels, data, unit, min, max) {--%>
<%--        return new Chart(context, {--%>
<%--            type: 'bar',--%>
<%--            data: {--%>
<%--                labels: labels,--%>
<%--                datasets: [{--%>
<%--                    // label: "Revenue",--%>
<%--                    backgroundColor: "#ff9935",--%>
<%--                    borderColor: "#ff9935",--%>
<%--                    data: data,--%>
<%--                }],--%>
<%--            },--%>
<%--            options: {--%>
<%--                scales: {--%>
<%--                    xAxes: [{--%>
<%--                        time: {--%>
<%--                            unit: unit--%>
<%--                        },--%>
<%--                        gridLines: {--%>
<%--                            display: true--%>
<%--                        },--%>
<%--                        ticks: {--%>
<%--                            maxTicksLimit: 6--%>
<%--                        }--%>
<%--                    }],--%>
<%--                    yAxes: [{--%>
<%--                        ticks: {--%>
<%--                            min: min,--%>
<%--                            max: max,--%>
<%--                            maxTicksLimit: 5--%>
<%--                        },--%>
<%--                        gridLines: {--%>
<%--                            display: true--%>
<%--                        }--%>
<%--                    }],--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    display: false--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    var dayChart = createNewChart(--%>
<%--        document.querySelector('#myBarChart_2'),--%>
<%--        Array.from(dayTotalPriceMap.keys()),--%>
<%--        Array.from(dayTotalPriceMap.values()),--%>
<%--        'day',--%>
<%--        0,--%>
<%--        Number(Array.from(dayTotalPriceMap.values()).sort().reverse()[0])--%>
<%--    );--%>


<%--    var monthChart = createNewChart(--%>
<%--        document.querySelector('#myBarChart'),--%>
<%--        Array.from(monthTotalPriceMap.keys()),--%>
<%--        Array.from(monthTotalPriceMap.values()),--%>
<%--        'month',--%>
<%--        0,--%>
<%--        Number(Array.from(monthTotalPriceMap.values()).sort().reverse()[0])--%>
<%--    );--%>

<%--</script>--%>
</body>

</html>
