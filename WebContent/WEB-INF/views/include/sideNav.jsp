<%@ page contentType="text/html; charset=UTF-8"%>

<div id="mySidenav" class="sidenav">
	<a class="closebtn" onclick="closeNav()">&times;</a>
	<a href="<%=application.getContextPath() %>/board/review?page=1">Review</a>
	<a href="<%=application.getContextPath() %>/board/qna?page=1">QnA</a>
</div>