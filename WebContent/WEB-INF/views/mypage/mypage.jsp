<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> SAGI </title>

	<link rel="icon" href="<%=application.getContextPath() %>/resources/img/logo/logo_fapicon.png">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/index.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/mypage.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/add.css?after" type="text/css">
	
</head>


<body onload="start()">
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
		
		<div class="add">

<form method= "post" enctype="multipart/form-data" name="edit_userForm" action="mypage" class="form-horizontal">
	<fieldset>
	<!-- Form Name -->
	<legend id="form-name">마이페이지</legend>
	
	<!-- 프로필 사진 multifile input-->
	<label for="photo_file" class="col-md-4 control-label">프로필 사진</label>
	<div>
		<img src="edit_photo_file?id=${mpDto.id}" width="100px;" height="100px;"> 
		<input type="file" id="photo_file" name="photo_file"  class="input-file"/>
	</div>

	<!-- 아이디 Text input-->
	<div class="form-group">
		<label for="id" class="col-md-4 control-label">아이디</label>
		<div class="col-md-4">
			<input readonly value="${mpDto.id}" id="id" name="id"  class="form-control input-md" type="text">
		</div>
	</div>
	
	<!-- 패스워드 password input-->
	<div class="form-group">
		<label for="password" class="col-md-4 control-label">패스워드</label>
		<div class="col-md-4">
			<input value="${mpDto.password}" id="password" name="password"  class="form-control input-md" type="password">
			<input onkeyup = "vpas()" id="password2" name="password2"  class="form-control input-md" type="password">
		</div>
	</div>
	
	<!-- 이름 Text input-->
	<div class="form-group">
		<label for="name" class="col-md-4 control-label">이름</label>
		<div class="col-md-4">
			<input value="${mpDto.name}" id="name" name="name"  class="form-control input-md" type="text">
		</div>
	</div>
	
	<!-- 전화번호  password input-->
	<div class="form-group">
		<label for="cellphone" class="col-md-4 control-label">전화번호</label>
		<div class="col-md-4">
			<input value="${mpDto.cellphone}" id="cellphone" name="cellphone"  class="form-control input-md" type="text">
		</div>
	</div>
	
	<!-- 이메일 text input-->
	<div class="form-group">
		<label for="email" class="col-md-4 control-label">이메일</label>
		<div class="col-md-4">
			<input value="${mpDto.email}" id="email" name="email"  class="form-control input-md" type="text">
		</div>
	</div>
	
	<!-- 주소 text input-->
	<div class="form-group">
		<label for="product_name" class="col-md-4 control-label">주소</label>
		<div class="col-md-4">
			<input value="${mpDto.address}" id="address" name="address"  class="form-control input-md" type="text">
		</div>
	</div>

	<!-- Button -->
	<button id="edit_userinfo" name="edit_userinfo" class="btn btn-primary">수정 저장</button>
	</fieldset>
</form>

		</div> <!-- /add -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

	</div> <!-- wrapper -->	
</body>
</html>