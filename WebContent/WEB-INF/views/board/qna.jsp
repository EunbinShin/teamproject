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
		<script src="<%=application.getContextPath() %>/resources/js/paging.js"></script>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
		
			<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
			
			<h3>QnA</h3>
			
			<!-- QnA board Table -->
			<div id="table_container">
				<table id="boardTable" class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>제품</th>
							<th>문의</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<c:forEach var="board" items="${list}">
				  		<tr>
				      		<td class="align-middle">${board.qna_bno}</td>
				      		<td><img width="75px" class="border rounded" src="searchphoto2?id=${board.products_product_id}"></td>
				      		<td class="align-middle">${board.category_name}</td>
				      		<td class="align-middle"><a href="showqna?bno=${board.qna_bno}&page=${page}" class="text-decoration-none">${board.qna_title}</a></td>
				      		<td class="align-middle">${board.users_id}</td>
				      		<td class="align-middle"><fmt:formatDate value="${board.qna_date}" pattern="yyyy.MM.dd"/></td>
				    	</tr>
				  	</c:forEach>
				</table>
			</div>
			
			<!-- QnA board Table -->
			<div id="btnContainer">
				<c:if test="${loginStatus != null}">
					<a href="writeQnA" id="submitBtn" class="btn btn-sm btn-secondary">글쓰기</a>
				</c:if>
			</div>
			<!-- page number navigation -->
			<div class="d-flex align-items-center justify-content-center">
				<div>
					<a href="qna?page=1" class="btn btn-outline-dark btn-sm mr-1">처음</a>
					<c:if test="${pager.groupNo > 1}">
						<a href="qna?page=${pager.startPageNo-1}" class="btn btn-outline-dark btn-sm mr-1">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${i == pager.pageNo }">
							<a href="qna?page=${i}" class="btn btn-secondary btn-sm mr-1">${i}</a>
						</c:if>
						<c:if test="${i != pager.pageNo }">
							<a href="qna?page=${i}" class="btn btn-outline-secondary btn-sm mr-1">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo < pager.totalGroupNo}">
						<a href="qna?page=${pager.endPageNo+1}" class="btn btn-outline-dark btn-sm ml-1 mr-1">다음</a>
					</c:if>
					<a href="qna?page=${pager.totalPageNo}" class="btn btn-outline-dark btn-sm">맨끝</a>
				</div>
			</div>
  			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>