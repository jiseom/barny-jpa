<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find your own drink, Barny</title>
</head>
<body>
   <table id="createReplyView" width="500" cellpadding="0" cellspacing="0" border="1">
      	<form action="reply" modelAttribute ="createReplyView" method="post">
         <input type="hidden" name="id" value="${createReplyView.id}">
<%--         <input type="hidden" name="boardGroup" value="${createReplyView.boardGroup}">--%>
<%--         <input type="hidden" name="boardStep" value="${createReplyView.boardStep}">--%>
<%--         <input type="hidden" name="boardIndent" value="${createReplyView.boardIndent}">--%>
         <tr>
            <td> 번호 </td>
            <td> ${createReplyView.id} </td>
         </tr>

         <tr>
            <td> 제목 </td>
            <td> <input type="text" name="boardTitle" value="${createReplyView.boardTitle}"></td>
         </tr>
         <tr>
            <td> 내용 </td>
            <td> <textarea rows="10" name="boardContent" >${createReplyView.boardContent}</textarea></td>
         </tr>
         <tr >
            <td colspan="2"> <input type="submit" value="답변"> &nbsp;&nbsp; <a href="/admin/inquiries">목록</a></td>
         </tr>
      </form>
   </table>   
      

</body>
</html>
