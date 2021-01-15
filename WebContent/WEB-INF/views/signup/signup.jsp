<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> SAGI </title>

	<link rel="icon" href="<%=application.getContextPath() %>/resource/img/logo/logo_fapicon.png">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/add.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	
	<script type="text/javascript">
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
	
	<header onclick="gotoHome()"> 
		<img id="sagi_logo" src="<%=application.getContextPath() %>/resources/img/logo/logo_white.png">
	SAGI</header>
	
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
			
              <ul class="navbar-nav mx-auto" style="margin: 0 auto">
				<li class="nav-item"><a class="nav-link"
					href="/html_css_javaspring/index.html">HOME</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropbtn"
					href="<%=application.getContextPath() %>/item_list/default_itemlist/item_list.jsp">SHOP</a>
					<div class="dropdown-content">
						<a href="/html_css_javaspring/item_list/new_itemlist/newitem_list.html">NEW</a>
						<a href="/html_css_javaspring/item_list/best_itemlist/bestitem_list.html">BEST</a>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="<%=application.getContextPath() %>/resources/add/add.jsp">ADD</a></li>
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
		
		<div class="add">
		
		<form method= "post" action="signup_form" class="form-horizontal">
		<fieldset>
		
		<!-- Form Name -->
		<legend id="form-name">회원 가입</legend>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="uname">이름</label>  
		  <div class="col-md-4">
		  <input id="uname" name="uname" placeholder="이름" class="form-control input-md" required="" type="text">
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="uid">아이디</label>  
		  <div class="col-md-4">
		  <input id="uid" name="uid" placeholder="아이디" class="form-control input-md" required="" type="text">
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="upassword">패스워드</label>  
		  <div class="col-md-4">
		  <input id="upassword" name="upassword" placeholder="패스워드" class="form-control input-md" required="" type="password">
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="uemail">이메일</label>  
		  <div class="col-md-4">
		  <input id="uemail" name="uemail" placeholder="이메일" class="form-control input-md" required="" type="text">
		  </div>
		</div>
		
		<!-- Button -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="singlebutton"></label>
		  <div class="col-md-4">
		    <button onclick="myFunction()" id="singlebutton" name="singlebutton" class="btn btn-secondary">회원가입</button>
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
		
		
		</div> <!-- /add -->
		
		<footer>
			<div id="left">
				Copyright ⓒ 신은빈 원지영 이영준. All rights reserved.
				<br/>designed by EunBin SHIN
			</div>
			<div id="right">
				(우)05717<br/>
				  서울특별시 송파구 중대로 135 12층 
			</div>
		</footer>

	</div> <!-- wrapper -->	
</body>
</html>