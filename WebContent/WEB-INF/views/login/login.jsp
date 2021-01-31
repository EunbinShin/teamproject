<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/login.css?after" type="text/css">
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
						<c:if test="${loginStatus == null}">
							<form onsubmit="login()">
								<input id="id" name="id" value="${uid}" type="text"  onkeyup="handleIdChange()" placeholder="아이디" required=""/>
								<small id="errorId" class="form-text text-danger"></small>
								<input id="password" name="password" onkeyup="handlePasswordChange()" type="password" placeholder="패스워드" required=""/>
								<small id="errorPassword" class="form-text text-danger"></small>
								
								<div id="myCheckBox">
									<input id="ucheck" name="ucheck" type="checkbox" ${remerberID}/>
									<label for="ucheck">아이디 기억하기</label>
								</div>
								
								<div class="hbox">
									<button class="btn btn-info">로그인</button>
								</div>
							</form>
						</c:if>
						<c:if test="${loginStatus != null}">
							<div>
								<c:if test="${loginStatus.profile_image != null}">
									<img width="150px" height="150px" class="rounded-circle"src="profile_image?id=${loginStatus.id}&image=${loginStatus.profile_image}">
								</c:if>
								<c:if test="${loginStatus.profile_image == null}">
									<img width="150px" height="150px" class="rounded-circle" src="<%=application.getContextPath() %>/resources/img/defaultphoto.png">
								</c:if>
							</div>
							<div>
								<h5>${loginStatus.name }님 안녕하세요!</h5>
								<a class="btn btn-danger btn-sm" href="logout" >로그아웃</a>
							</div>
						</c:if>
						<script type="text/javascript">
							const login = () =>{
								//<form>태그의 기본 이동 기능을 취소
								event.preventDefault();

								console.log("실행");
								//에러초기화
								$("#errorId").html("");
								$("#errorPassword").html("");
								var validation = true;
								//입력값 받기
								const id = $("#id").val();
								const password = $("#password").val();
								const ucheck = $("#ucheck").is(":checked");
								
								if(id===""){
									$("#errorId").html("필수 입력 사항입니다.");
									validation = false;
								}
								if(password===""){
									$("#errorPassword").html("필수 입력 사항입니다.");
									validation = false;
								}
								if(!validation){
									return;
								}
								//ajax통신
								$.ajax({
									url: "login",
									method: "post",
									data: {id:id,
											password:password,
											ucheck:ucheck},
									success: (data)=>{
										if(data.result === "success"){
											alert("로그인 성공");
											location.href="/teamproject/login/";
										}else if(data.result === "wrongMid"){
											$("#errorId").html("아이디가 존재하지 않습니다.");
										}else{
											$("#errorPassword").html("비밀번호가 틀렸습니다.");
										}
									}
								});
							}
						</script>
					</div>
					<c:if test="${loginStatus == null}">
						<a href="<%=application.getContextPath() %>/signup/signup" style="color:blue;">회원이 아니신가요?</a>
					</c:if>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
		
	</body>
</html>