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
	<script>
	document.getElementById("upassword").addEventListener("invalid", passwordCheck);

	function passwordCheck() {
	  alert("비밀번호는 6자 이상이어야 합니다.");
	}
	
	
	</script>
</head>

<body>
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
		<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>	
		<div class="add">
		
		<br/>
		
		<!-- 이미지 파일 업로드 -->
		<div class="form-group" align="center" >
		  <label class="col-md-4 control-label" for="uemail">이메일</label>  
		  <form method="post" enctype="multipart/form-data" action="fileupload">
		  		이름: <input type="text" name="uname"/><br/>
		  		
		  		아이디: <input type="text" id="uid" name="uid"  pattern=".{6,}" required/>
		  		<script>
		  		document.getElementById("uid").addEventListener("invalid", uid);
		  		function uid() {
		  			alert("아이디는 최소 6자이상 입니다");
		  		}
		  		</script>
		  		<button onclick="uid()" class="btn btn-secondary">nestedCheck</button><br/>
		  		
		  		
		  		패스워드: <input type="password" id="upassword" name="upassword" pattern=".{6,}" required/>
		  		<button onclick="passwordCheck()" class="btn btn-secondary" >비밀번호 확인</button><br/>
		  		
		  		
		  		이메일: <input type="text" name="uemail"/><br/>
		  		프로필 사진: <input type="file" name="uphoto"/><br/>
		  		<input class="btn btn-sm btn-info" type="submit" value="회원가입"/><br/>
		  </form>
		</div>
		
		</div> <!-- /add -->	
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div> <!-- wrapper -->	
</body>
</html>