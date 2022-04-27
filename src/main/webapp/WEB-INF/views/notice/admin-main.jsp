<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Find your own drink, Barny</title>

	<!--font-->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico" />

	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/static/main_page/css/styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="/static/table/css/style.css" />
	<link rel="stylesheet" href="/static/table/css/owl.carousel.min.css" />

	<!--JQuery-->
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function () {
			var searchForm = $("#searchForm");
			$("#searchForm button").on("click", function (e) {
				if (!searchForm.find("option:selected").val()) {
					alert("검색 종류를 선택하세요");
					return false;
				}
				if (!searchForm.find("input[name='keyword']").val()) {
					alert("키워드를 입력하세요");
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			});
		});
	</script>


	<%--delete by checkbox--%>
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
			var url = "${pageContext.request.contextPath}/admin/notices/delete";
			var ids = [];
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
					ids.push(list[i].value);

				}
			}
			if (ids.length === 0) {
				alert("선택된 글이 없습니다.");
			} else {
				if (confirm("해당 글을 삭제하시겠습니까? \n(삭제한 글은 복구가 불가능합니다.)")) {
					// var chk = confirm("정말 삭제하시겠습니까?");
					let data={
						ids:ids
					};
					data = JSON.stringify(data);
					$.ajax({
						url: url,
						type: 'POST',
						traditional: true,
						contentType: 'application/json',
						data: data,
						success: function (result) {
							if (result == "success") {
								alert("삭제되었습니다.");
								location.replace("/admin/notices");
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
</head>

<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>


<%--content--%>
	<div class="content">
		<div class="custom-container">
			<div class="board_name" style="text-align: center">공지사항
			</div>
			<div>
				<label class="control control--checkbox mx-2">
					<input type="checkbox" id="allCheck" name="allCheck" />
					<div class="control__indicator"></div>
				</label>
				<a class="selection" style="margin-left: 2.4rem;">전체 선택 /</a>
				<input type="button" value="선택 삭제 " class="selection" onclick="deleteValue();" />
				<a class="btn-basic post mb-2" type="button" title="글쓰기" href="/admin/notices/new">글쓰기</a>
			</div>
			<div class="table-responsive outline pb-3">
				<table class="table custom-table">
					<thead style="border-bottom: solid 1px;">
						<tr>
							<th scope="col"> </th>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vo">
							<tr style="font-weight: 400;">
								<th scope="row">
									<label class="control control--checkbox">
										<input type="checkbox" value="${vo.id}" name="RowCheck" />
										<div class="control__indicator"></div>
									</label>
								</th>
								<td>${vo.id}</td>
								<td style="text-align: left; padding-left: 2rem">
									<a class="board_title"
										href="${pageContext.request.contextPath}/admin/notices/${vo.id}/detail">${vo.boardTitle}</a>
								</td>
								<td>Barny</td>
								<td>${vo.createdDate}</td>
								<td>${vo.boardHit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


<%--			<nav aria-label="Page navigation example">--%>
<%--				<ul class="pagination justify-content-center">--%>
<%--					<c:if test="${pageMaker.prev}">--%>
<%--						<li class="page-item">--%>
<%--							<a class="page-link" href="main${pageMaker.makeQuery(pageMaker.startPage - 1) }" aria-label="Previous">--%>
<%--								<span aria-hidden="true">&laquo;</span>--%>
<%--								<span class="sr-only">Previous</span>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--					</c:if>--%>

<%--					<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">--%>
<%--						<li class="page-item "><a class="page-link" href="main${pageMaker.makeQuery(idx)}">--%>
<%--								${idx}--%>
<%--							</a>--%>
<%--						</li>--%>
<%--					</c:forEach>--%>
<%--					<!-- 페이지 메이커에 링크 걸어줌 -->--%>

<%--					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">--%>
<%--						<li class="page-item">--%>
<%--							<a class="page-link" aria-label="Next" href="main${pageMaker.makeQuery(pageMaker.endPage +1) }">--%>
<%--								<span aria-hidden="true">&raquo;</span>--%>
<%--								<span class="sr-only">Next</span>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--					</c:if>--%>
<%--				</ul>--%>
			</nav>

			<%--searching button--%>
			<div class="table-responsive outline pt-4">
				<form class="d-flex mb-3" id="searchForm" action="/notice" method='get' style="float: right;">
					<select name='type' class="searching_option">
						<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}" />>--</option>
						<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}" />>제목</option>
						<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}" />>내용</option>
					</select>
					<input class="form-control_2 me-2" type='text' name='keyword'
						value='<c:out value="${pageMaker.cri.keyword}"/>' />
					<input class="form-control_2 me-2" type='hidden' name='pageNum'
						value='<c:out value="${pageMaker.cri.pageNum}"/>' />
					<input class="form-control_2 me-2" type='hidden' name='amount'
						value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class="searching_btn btn-outline-search" type="submit">검색</button>
				</form>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/static/table/js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Core theme JS-->
	<script src="/static/main_page/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

	<!-- AJax-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>

</html>