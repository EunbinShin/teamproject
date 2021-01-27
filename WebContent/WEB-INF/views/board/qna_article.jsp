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
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/article.css" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
		
			<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
			
			<h3>QnA</h3>
			
			<!-- QnA board Table -->
			<div id="table_container">
				<table id="article_table" class="table">
					<tr>
						<td width="150px">제목 </td>
						<td>${qna.qna_title }</td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td>${qna.users_id }</td>
					</tr>
					<tr>
						<td>날짜 </td>
						<td><fmt:formatDate value="${qna.qna_date}" pattern="yyyy.MM.dd"/></td>
					</tr>
					<tr>
						<td height="200px" colspan="2">
							<c:if test="${qna.image1 != null}">
								<img src="photo?image=${qna.image1}&bno=${qna.qna_bno}" width="600px">
							</c:if>
							<c:if test="${qna.image2 != null}">
								<img src="photo?image=${qna.image2}&bno=${qna.qna_bno}" width="600px">
							</c:if>
							<c:if test="${qna.image3 != null}">
								<img src="photo?image=${qna.image3}&bno=${qna.qna_bno}" width="600px">
							</c:if>
							<c:if test="${qna.image4 != null}">
								<img src="photo?image=${qna.image4}&bno=${qna.qna_bno}" width="600px">
							</c:if>
							<div id="photoList"></div>
							${qna.qna_content}
							
						</td>
					</tr>
				</table>
				<%--버튼 컨테이너 --%>
				<div id="btnContainer">
					<a href="qna?page=${page}" class="btn btn-secondary">목록</a>
				</div>
			</div>
			
 
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>