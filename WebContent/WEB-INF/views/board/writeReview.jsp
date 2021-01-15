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
			
			<h3>Review</h3>
			
			<!-- QnA board Table -->
			<form method= "post" action="submitReview" enctype="multipart/form-data" class="form-horizontal">
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
				<!-- Text input-->
				<div>
					<div>
					  <label class="col-md-4 control-label" for="review_title">제목</label>  
					  <input id="review_title" name="review_title" placeholder="제목" class="form-control input-md" required="" type="text">
					</div>
				</div>
				<!-- Text input-->
				<div>
					<div class="form-group">
					  <label class="col-md-4 control-label" for="review_writer">작성자</label>  
					  <input id="review_writer" name="review_writer" readonly="readonly"  placeholder="${loginStatus }" class="form-control input-md" required="" type="text">
					</div>
				</div>
				<!-- Textarea -->
				<div>  
					<div class="form-group">
				  		<label class="col-md-4 control-label" for="review_content">내용</label>
				    	<textarea class="form-control" id="review_content" name="review_content" rows="15" placeholder="내용">1. 제품옵션 :
2. 사용후기 :
3. 제품사진 :</textarea>
					</div>
				</div>
				<%--사진 올리기 --%>
				<div>
				 <div class="form-group">
				  	<label>추가 이미지</label><br/>
				    <input id="filebutton1" name="file1" class="input-file" type="file"><br/>
				    <input id="filebutton2" name="file2" class="input-file" type="file"><br/>
				    <input id="filebutton3" name="file3" class="input-file" type="file"><br/>
				    <input id="filebutton4" name="file4" class="input-file" type="file"><br/>
				  </div>
				</div>
				<!-- Button -->
				<div>
					<div class="form-group">
				    	<button onclick="myFunction()" id="review_submit" name="review_submit" class="btn btn-secondary">개시</button>
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