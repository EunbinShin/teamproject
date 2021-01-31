<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="table_container">
	<table id="boardTable" class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${size == 0}">
				<caption>작성된 리뷰가 없습니다.</caption>
			</c:if>
			<c:forEach var="board" items="${list}">
		  		<tr>
		      		<td>${board.review_no}</td>
		      		<td><a href="<%=application.getContextPath() %>/board/showreview?bno=${board.review_no}&page=${page}" class="text-danger text-decoration-none">${board.review_title}</a></td>
		      		<td>${board.users_id}</td>
		      		<td><fmt:formatDate value="${board.review_date}" pattern="yyyy.MM.dd"/></td>
		    	</tr>
		  	</c:forEach>
	  	</tbody>
	</table>
</div>