<%@ page contentType="text/html; charset=UTF-8"%>
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
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/writeQnA.css" type="text/css">
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
			<form method= "post" action="submitQnA" class="form-horizontal">
				<fieldset>
				<%--문의 카테고리 --%>
				<div class="form-group">
				  <label class="col-md-4 control-label" for="qna_categorie">문의내용</label>
				  <div class="col-md-4">
				    <select id="qna_categorie" name="qna_categorie" class="form-control">
							<option value="qna_delivery">배송문의</option>
							<option value="qna_item">제품문의</option>
							<option value="qna_refund">환불문의</option>
							<option value="qna_etc">기타</option>
				    </select>
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="qna_title">제목</label>  
				  <div class="col-md-4">
				  <input id="qna_title" name="qna_title" placeholder="제목" class="form-control input-md" required="" type="text">
				  </div>
				</div>
				<!-- Textarea -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="qna_content">내용</label>
				  <div class="col-md-4">                     
				    <textarea class="form-control" id="qna_content" name="qna_content" rows="15" placeholder="내용"></textarea>
				  </div>
				</div>
				<%--사진 올리기 --%>
				 <div class="form-group">
				  <label class="col-md-4 control-label" for="filebutton">추가 이미지</label>
				  <div class="col-md-4">
				    <input id="filebutton" name="filebutton" class="input-file" type="file">
				  </div>
				</div>
				<!-- Button -->
				<div class="form-group">
				  <div class="col-md-4">
				    <button onclick="myFunction()" id="qna_submit" name="qna_submit" class="btn btn-secondary">개시</button>
				    	<script>
				    		function 
				    			myFunction() {
				    			confirm("상품을 게시하겠습니까?");
							}
						</script>
				  </div>
				 </div>
				</fieldset>
			</form>
			
			<!-- QnA board Table -->
			
  			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>