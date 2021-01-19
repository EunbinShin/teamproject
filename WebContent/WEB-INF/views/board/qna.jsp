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
							<th>문의</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<th>배송</th>
							<th><a href="show?bno=1&type=qna&page=${page}&range=${paging.range}">배송문의 드려요</a></th>
							<th>신은빈</th>
							<th>2021-01-02</th>
						</tr>
					</tbody>
					<c:forEach begin="${paging.page*15-15}" end="${paging.page*15-1}" step="1" var="idx">
						<c:if test="${qnaList[idx] != null}">
							<tr>
								<th>${qnaList[idx].bNo}</th>
								<th>${qnaList[idx].qna_categorie}</th>
								<th>${qnaList[idx].qna_title}</th>
								<th>${qnaList[idx].qna_writer}</th>
								<th><fmt:formatDate value="${qnaList[idx].date}" pattern="yyyy-MM-dd"/></th>
							</tr>
						</c:if>
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
			<ul class="pagination justify-content-center">
  				<c:if test="${paging.prev}">
  					<li class="page-item">
  						<a class="page-link" 
  						href="javascript:void(0);" 
  						onClick="prev('qna','${paging.page}', '${paging.range}', '${paging.rangeSize}')">
  						Prev</a>
  					</li>
  				</c:if>
  				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="index">
  					<li class="page-item 
  						<c:out value="${paging.page == index ? 'active' : ''}"/> ">
  						<a class="page-link" href="javascript:void(0);" onClick="pagination('qna','${index}', '${paging.range}', '${paging.rangeSize}')">
  							 ${index}
  						</a>
  					</li>
  				</c:forEach>
  				<c:if test="${paging.next}">
  					<li class="page-item">
  						<a class="page-link" 
  							href="javascript:void(0);" 
  							onClick="next('qna','${paging.range}','${paging.range}', '${paging.rangeSize}')">
  								Next</a>
  					</li>
  				</c:if>
  			</ul>
  			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>