<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> SAGI </title>

	<link rel="icon" href="<%=application.getContextPath()%>/resource/img/logo/logo_fapicon.png">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/add.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/header.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/menu_bar.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/footer.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/product_slide.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/product_slide1.css?after" type="text/css">
	
</head>

<body>
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
		<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>	
		<div class="add">
		
		
		
		<!-- 이미지 파일 업로드 -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="uemail">이메일</label>  
		  <form method="post" enctype="multipart/form-data" action="fileupload">
		  		<input type="text" name="uname"/><br/>
		  		<input type="text" name="uid"/><br/>
		  		<input type="password" name="upassword"/><br/>
		  		<input type="text" name="uemail"/><br/>
		  		<input type="file" name="uphoto"/><br/>
		  		<input class="btn btn-sm btn-info" type="submit" value="회원가입"/></br>
		  </form>
		</div>
		
		</div> <!-- /add -->	
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div> <!-- wrapper -->	
</body>
</html>