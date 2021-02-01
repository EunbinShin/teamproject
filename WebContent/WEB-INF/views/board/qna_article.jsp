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
				<div id="selectedItem" class="d-flex flex-row">
					<c:if test="${product == null}"> 
						<img height="130px"
						src="<%=application.getContextPath() %>/resources/img/defaultphoto.png">
					</c:if>
					<c:if test="${product != null}"> 
						<img height="130px"
						src="searchphoto?id=${product.product_id}">
					</c:if>
					<div id="desc_container" class="ml-5">
						<div><a>${product.product_name }</a></div>
						<div><a>${product.product_price } 원</a></div>
						<div><a href="/teamproject/item_list/item_detail?product_id=${product.product_id}" class="btn btn-sm btn-secondary">상세보기</a></div>
					</div>
				</div>
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
								<div><img src="qna_photo?image=${qna.image1}&bno=${qna.qna_bno}" width="600px"></div>
							</c:if>
							<c:if test="${qna.image2 != null}">
								<div><img src="qna_photo?image=${qna.image2}&bno=${qna.qna_bno}" width="600px"></div>
							</c:if>
							<c:if test="${qna.image3 != null}">
								<div><img src="qna_photo?image=${qna.image3}&bno=${qna.qna_bno}" width="600px"></div>
							</c:if>
							<c:if test="${qna.image4 != null}">
								<div><img src="qna_photo?image=${qna.image4}&bno=${qna.qna_bno}" width="600px"></div>
							</c:if>
							${qna.qna_content}
						</td>
					</tr>
				</table>
				<%--버튼 컨테이너 --%>
				<div id="btnContainer">
					<a href="qna?page=${page}" class="btn btn-secondary">목록</a>
					<c:if test="${loginStatus.id == qna.users_id}">
						<a href="delete_qna?bno=${qna.qna_bno}" class="btn btn-secondary">삭제</a>
						<a href="edit_qna?bno=${qna.qna_bno}" class="btn btn-secondary">수정</a>
					</c:if>
				</div>
			</div>
			
 
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>