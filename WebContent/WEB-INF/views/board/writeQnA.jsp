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
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/add.css" type="text/css">
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
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="percentage_discount">제목</label>  
				  <div class="col-md-4">
				  <input id="percentage_discount" name="percentage_discount" placeholder="제목" class="form-control input-md" required="" type="text">
				  </div>
				</div>
				<!-- Textarea -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="product_description">내용</label>
				  <div class="col-md-4">                     
				    <textarea class="form-control" id="product_description" name="product_description" ></textarea>
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="available_quantity">작성자</label>  
				  <div class="col-md-4">
				  <input id="available_quantity" name="available_quantity" placeholder="작성자" class="form-control input-md" required="" type="text">
				  </div>
				</div>
				<!-- Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="singlebutton"></label>
				  <div class="col-md-4">
				    <button onclick="myFunction()" id="singlebutton" name="singlebutton" class="btn btn-secondary">개시</button>
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