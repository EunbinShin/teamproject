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
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/signup.css?after" type="text/css">
</head>

<body>
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
			<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>	
		<div class="add">
		
		<div class="form-group" align="center" > 
			<form action="fileupload" method="post" enctype="multipart/form-data" class="mt-5">
				<div class="form-group">
					<label for="mid">아이디</label>
					<div class="d-flex">
						<input type="text" class="form-control" 
							id="uid" name="uid" required/>
						<a href="#" class="btn btn-danger" id="checkbtn">중복확인</a>
					</div>
					
					<small class="form-text text-muted">필수 입력 사항입니다.</small>
				</div>
				<div class="form-group">
					<label for="uname">이름</label>
					<input type="text" class="form-control" 
						name="uname" id="uname" required/>
					<small class="form-text text-muted">필수 입력 사항입니다.</small>
				</div>
				<div class="form-group">
					<label for="upassword">비밀번호</label>
					<input type="password" class="form-control"
						 id="upassword" name="upassword" required/>
					<small class="form-text text-muted">필수 입력 사항입니다.</small>
				</div>
				<div class="form-group">
					<label for="uphonenumber">전화번호</label>
					<input type="text" class="form-control" 
						name="uphonenumber" id="uphonenumber" required/>
					<small class="form-text text-muted">필수 입력 사항입니다.</small>
				</div>
				<div class="form-group">
					<label for="uemail">이메일</label>
					<input type="text" class="form-control" 
						name="uemail" id="uemail" required/>
					<small class="form-text text-muted">필수 입력 사항입니다.</small>
				</div>
				<div class="form-group">
					<label for="uaddress">주소</label>
					<input type="text" class="form-control" 
						name="uaddress" id="uaddress" required/>
				</div>
				<div class="form-group">
					<label for="uphoto">프로필사진</label><br/>
					<input type="file" id="uhoto" name="uphoto">
				</div>
				
				<button class="btn btn-secondary">저장</button>
				<a href="<%=application.getContextPath() %>/login/" class="btn btn-secondary">취소</a>
			</form>
		</div>
		
		</div> <!-- /add -->	
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div> <!-- wrapper -->	
</body>
</html>