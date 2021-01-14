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
	
		<script type="text/javascript">
			const handleIdChange = () => {
				const uid = document.querySelector("#uid");
				if(uid.value.length > 10){
					alert("최대 10자 까지 입력 가능합니다!");
					uid.value = uid.value.substring(0, 10);
				}
			};
			
			const handlePasswordChange = () => {
				const upassword = document.querySelector("#upassword");
				if(upassword.value.length > 12){
					alert("최대 12자 까지 입력 가능합니다!");
					upassword.value = upassword.value.substring(0, 12);
				}
			};
			
			const handleButton = () => {
				const text = event.target.innerHTML;
				const uid = document.querySelector("#uid");
				const upassword = document.querySelector("#upassword");
				const idAlert = document.querySelector("#idAlert");
				const pwdAlert = document.querySelector("#pwdAlert");
				idAlert.innerHTML = "";
				pwdAlert.innerHTML = "";
				if(text == "로그인"){
					console.log("로그인 버튼을 눌렀습니다.");
					if(uid.value.length == 0){
						idAlert.innerHTML = "아이디를 입력해주세요.";
						idAlert.style.color="red";
					}else if(upassword.value.length == 0){
						pwdAlert.innerHTML = "비밀번호를 입력해주세요.";
						pwdAlert.style.color="red";
					}
					else{
						location.href = "/html_css_javaspring/index.html";
					}
				}
			};
			
			const gotoHome = () => {
				location.href = "/html_css_javaspring/index.html";
			}
		</script>
	</head>
	
	<body>
		<div id="mySidenav" class="sidenav">
			<a class="closebtn" onclick="closeNav()">&times;</a>
			<a href="#">Review</a>
			<a href="/html_css_javaspring/board/qna_board/qna.html">QnA</a>
		</div>
	
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
			<nav class="navbar navbar-expand-sm bg-light sticky-top">
            <i id="barIcon" onclick="fun1()" class="fas fa-bars"></i>
			<script type="text/javascript">
				const fun1 = () =>{
					document.getElementById("mySidenav").style.width = "250px";
				};
				
				const closeNav = () =>{
					document.getElementById("mySidenav").style.width = "0";
				};
			</script>
              
              <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link"
					href="/html_css_javaspring/index.html">HOME</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropbtn"
					href="/html_css_javaspring/item_list/default_itemlist/item_list.html">SHOP</a>
					<div class="dropdown-content">
						<a href="/html_css_javaspring/item_list/new_itemlist/newitem_list.html">NEW</a>
						<a href="/html_css_javaspring/item_list/best_itemlist/bestitem_list.html">BEST</a>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="/html_css_javaspring/add/add.html">ADD</a></li>
				<li class="nav-item"><a class="nav-link" href="#">EDIT</a></li>
				<li class="nav-item"><a class="nav-link" href="#">DELETE</a></li>
              </ul>
              
              <div class="dropdown">
  				<div id="myDropdown" class="search-dropdown-content" >
    				<input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
  				</div>
				<i onclick="searchBar()" id="mySearch" style="margin-right:30px" class="fas fa-search"></i>
			</div>
			
			<script type="text/javascript">
				let toggle = true;
				
				const searchBar = () =>{
					if(toggle){
						document.getElementById("myDropdown").style.display = "inline";
						toggle = !toggle;
					}else{
						document.getElementById("myDropdown").style.display = "none";
						toggle = !toggle;
					}
						
				};
	
			</script>
              
              <a style="margin-right:10px" href="/html_css_javaspring/login/login.html"><i class="fas fa-user"></i></a>
         </nav>	
		
			<h1>LOGIN</h1>
			<div id=loginCover>
				<div id="loginBox">
					<h3>회원로그인</h3>
					<!-- 입력양식을 만들 때 사용 (block)요소 -->
					<div>
						<!-- input은 inline요소 -->
						<input id="uid" name="uid" onkeyup="handleIdChange()" type="text" placeholder="아이디"/>
						<div id="idAlert"></div>
						<input id="upassword" name="upassword" onkeyup="handlePasswordChange()" type="password" placeholder="패스워드"/>
						<div id="pwdAlert"></div>
						<div class="hbox">
							<button onclick="handleButton()" type="button" class="btn btn-info">로그인</button>
						</div>
					</div>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
		
	</body>
</html>