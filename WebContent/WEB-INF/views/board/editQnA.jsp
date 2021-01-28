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
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/writeReview.css" type="text/css">
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
			<form method= "post" action="edit_qna" enctype="multipart/form-data" class="form-horizontal">
				<fieldset>
				<%--문의 카테고리 --%>
				<div>
					<div id="img_container">
						<img src="<%=application.getContextPath() %>/resources/img/noimage.jpg" width="100px" height="100px"/>
						<a href="findItem" class="btn btn-secondary" 
							onclick="window.open(this.href, '_blank', 'width=600px,height=500px,toolbars=no,scrollbars=no'); return false;">
							상품정보선택</a>
					</div>
				</div>
				<%--문의 카테고리 --%>
				<div>
				  <label class="col-md-4 control-label" for="qna_categorie">문의내용</label>
				  <div class="form-group">
				    <select id="qna_category" name="qna_category" class="form-control">
							<option value="1" <c:if test="${qna.qna_category == 1}">selected="selected"</c:if>>상품 문의</option>
							<option value="2" <c:if test="${qna.qna_category == 2}">selected="selected"</c:if>>배송 문의</option>
							<option value="3" <c:if test="${qna.qna_category == 3}">selected="selected"</c:if>>환불 문의</option>
							<option value="4" <c:if test="${qna.qna_category == 4}">selected="selected"</c:if>>기타</option>
							
				    </select>
				  </div>
				</div>
				<!-- Text input-->
				<input type="hidden" name="qna_bno" value="${qna.qna_bno}">
				<div>
				  <label class="control-label" for="qna_title">제목</label>  
				  <div class="form-group">
				  <input id="qna_title" name="qna_title" value="${qna.qna_title}" class="form-control input-md" required type="text">
				  </div>
				</div>
				<!-- Text input-->
				<div>
				  <label class="control-label" for="qna_writer">작성자</label>  
				  <div class="form-group">
				  <input readonly="readonly" id="qna_writer" name="qna_writer" placeholder="${loginStatus.id}" class="form-control input-md" required="" type="text">
				  </div>
				</div>
				<!-- Textarea -->
				<div>
				  <label class="control-label" for="qna_content">내용</label>
				  <div class="form-group">                     
				    <textarea class="form-control" id="qna_content" name="qna_content" rows="15" placeholder="내용" required>${qna.qna_content}</textarea>
				  </div>
				</div>
				<%--사진 올리기 --%>
				
				<!-- Button -->
				<div class="form-group">
				  <div class="col-md-4">
				    <button class="btn btn-secondary">수정</button>
				  </div>
				 </div>
				</fieldset>
			</form>
			
			<!-- QnA board Table -->
			
  			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>