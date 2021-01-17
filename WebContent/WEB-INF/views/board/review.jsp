<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
<title>SAGI</title>
	<link rel="icon" href="/html_css_javaspring/resource/img/logo/logo_fapicon.png">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
		rel="stylesheet">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/qna.css" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
		
			<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
			
			<h3>Review</h3>
			
			<!-- QnA board Table -->
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
						<tr>
							<th>1</th>
							<th><a href="show?bno=1&type=review">그릇이 너무 좋아요</a></th>
							<th>신은빈</th>
							<th>2021-01-02</th>
						</tr>
					</tbody>
					<c:forEach var="board" items="${reviewList}">
						<tr>
							<th>${board.bNo}</th>
							<th>${board.review_title}</th>
							<th>${board.review_writer}</th>
							<th><fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd"/></th>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<!-- QnA board Table -->
			<div id="btnContainer">
				<c:if test="${loginStatus != null}">
					<a href="writeReview" id="submitBtn" class="btn btn-sm btn-secondary">글쓰기</a>
				</c:if>
			</div>
			<!-- page number navigation -->
			<ul class="pagination justify-content-center">
				<li class="page-item<c:if test="${page == 1}"> disabled</c:if>"><a class="page-link" href="review?page=${page-1}"> 
					<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span></a></li>
			    <li class="page-item<c:if test="${page == 1}"> active</c:if>"><a class="page-link" href="review?page=1">1</a></li>
			    <li class="page-item<c:if test="${page == 2}"> active</c:if>"><a class="page-link" href="review?page=2">2</a></li>
			    <li class="page-item<c:if test="${page == 3}"> active</c:if>"><a class="page-link" href="review?page=3">3</a></li>
			    <li class="page-item<c:if test="${page == 4}"> active</c:if>"><a class="page-link" href="review?page=4">4</a></li>
			    <li class="page-item<c:if test="${page == 5}"> active</c:if>"><a class="page-link" href="review?page=5">5</a></li>
			    <li class="page-item<c:if test="${page == 6}"> active</c:if>"><a class="page-link" href="review?page=6">6</a></li>
			    <li class="page-item<c:if test="${page == 7}"> active</c:if>"><a class="page-link" href="review?page=7">7</a></li>
			    <li class="page-item<c:if test="${page == 8}"> active</c:if>"><a class="page-link" href="review?page=8">8</a></li>
			    <li class="page-item<c:if test="${page == 9}"> active</c:if>"><a class="page-link" href="review?page=9">9</a></li>
			    <li class="page-item<c:if test="${page == 10}"> active</c:if>"><a class="page-link" href="review?page=10">10</a></li>
			    <li class="page-item"><a class="page-link" href="review?page=${page+1}">
			    	<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span></a></li>
  			</ul>
  			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>