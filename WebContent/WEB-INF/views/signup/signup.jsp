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
		<jsp:include page="/WEB-INF/views/item_detail/product_slide.jsp"/>
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