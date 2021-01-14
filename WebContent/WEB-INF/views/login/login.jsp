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
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/login.css" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/login.js"></script>
		
	</head>
	
	<body>
		
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
			
			<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
			<h1>LOGIN</h1>
			
			<div id=loginCover>
				<div id="loginBox">
					<h3>회원로그인</h3>
					<!-- 입력양식을 만들 때 사용 (block)요소 -->
					<div>
						<!-- input은 inline요소 -->
						<form method="post" action="login">
							<input id="uid" name="uid" type="text" onkeyup="handleIdChange()" placeholder="아이디"/>
							<input id="upassword" name="upassword" onkeyup="handlePasswordChange()" type="password" placeholder="패스워드"/>
							<div class="hbox">
								<button class="btn btn-info">로그인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
		
	</body>
</html>