<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE>
<html>

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Find your own drink, Barny</title>
	<!--font-->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/static/main_page/assets/favicon-2.ico" />
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

	<!-- Core theme CSS (includes Bootstrap)-->
	<link rel="stylesheet" href="/static/table/css/style.css" />
	<link href="/static/main_page/css/styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="/static/css/styles.css">
	<link rel="stylesheet" href="/static/table/css/owl.carousel.min.css" />

</head>

<body>
	<div class="container">
		<div class="custom-container2">
			<div class="board_name" style="text-align: center">공지사항 <br>
			</div>
			<div class="table-responsive outline pt-3">

					<form  modelAttribute="updateNoticeForm"
						action="/admin/notices/${board.id}/update" method="post">
						<table class="table" style="font-size: 13px; border-top : solid 1px; border-top-color: #dee2e6;">
						<input type="hidden" id="id" value="${board.id}">
						<tr>
							<td class="content_head"> 제목</td>
							<td colspan="3"><input type="text" class="textarea-custom py-1" id="boardTitle"
												   placeholder="${board.boardTitle}" name="boardTitle"
									value="${updateNoticeForm.boardTitle}"></td>
						</tr>
						<tr>
							<td class="content_head"> 번호</td>
							<td style="width:70px; border-right : solid 1px; border-right-color: #dee2e6;"> ${board.id}
							</td>
							<td class="content_head"> 작성 일자</td>

							<td> ${updateNoticeForm.updatedDate} ${board.createdDate}  </td>
						</tr>
						<tr>
							<td class="content_head"> 내용</td>
							<td colspan="4"><textarea class="textarea-custom" rows="10" id="boardContent" name="boardContent"
													  placeholder="${board.boardContent}"
									style="padding-top: 1rem; padding-bottom: 10rem; width: 100%;">${updateNoticeForm.boardContent}</textarea>
							</td>
						</tr>
						<tr>

							<td colspan="4" class="py-3" style="text-align: right">
								<input type="submit" class="btn-basic text-uppercase" style="padding-top: 5px; padding-bottom: 5px;"
									value="수정">
								<a class="btn-basic text-uppercase" href="${pageContext.request.contextPath}/admin/notices">목록보기</a>
							</td>
						</tr>
						</table>
					</form>

			</div>
			<div class="table-responsive outline pb-3" />
		</div>
	</div>
</body>

</html>