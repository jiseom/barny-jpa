<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Barny:: 찾아가는 Bar</title>
</head>
<body>
	
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>공지사항 번호</td>
			<td>공지 제목</td>
			<td>게시 날짜</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr>
			<td>${vo.board_id}</td>
			<td>
				<a href="content_view?bid=${vo.board_id}">${vo.b_title}</a></td>
			<td>${vo.b_date}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="3"> <a href="write_view">글작성</a> </td>
		</tr>
	</table>
</body>
</html>