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
	<link rel="stylesheet" href="add.css?after" type="text/css"> 
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
		
		<form method= "post" action="add_item" class="form-horizontal">
		<fieldset>
		
		<!-- Form Name -->
		<legend id="form-name">제품 등록</legend>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="product_id">상품 코드</label>  
		  <div class="col-md-4">
		  <input id="product_id" name="product_id" placeholder="상품 코드" class="form-control input-md"  type="text">
		    
		  </div>
		</div>
		
		<!-- Select Basic -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="product_categorie">상품 카테고리</label>
		  <div class="col-md-4">
		    <select id="product_categorie" name="product_categorie" class="form-control">
		    		<option value="">상품 카테고리</option>
					<option value="texnolog1">은식기 </option>
					<option value="texnolog2">나무식기 2</option>
					<option value="texnolog3">무쇠  3</option>
		    </select>
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="product_name">상품명</label>  
		  <div class="col-md-4">
		  <input id="product_name" name="product_name" placeholder="상품명" class="form-control input-md" required="" type="text">
		    
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="product_name_fr">상품 가격</label>  
		  <div class="col-md-4">
		  <input id="product_price" name="product_price" placeholder="상품 가격 " class="form-control input-md" required="" type="number">
		    
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="percentage_discount">상품 할인율</label>  
		  <div class="col-md-4">
		  <input id="percentage_discount" name="percentage_discount" placeholder="상품 할인율" class="form-control input-md" required="" type="number">
		    
		  </div>
		</div>
		
		<!-- Textarea -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="product_description">상품 설명</label>
		  <div class="col-md-4">                     
		    <textarea class="form-control" id="product_description" name="product_description"></textarea>
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="available_quantity">주문 가능 수량</label>  
		  <div class="col-md-4">
		  <input id="available_quantity" name="available_quantity" placeholder="주문 가능 수량" class="form-control input-md" required="" type="number">
		    
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="online_date">상품 개시일</label>  
		  <div class="col-md-4">
		  <input id="online_date" name="online_date" placeholder="ONLINE DATE" class="form-control input-md" required="" type="date">
		    
		  </div>
		</div>
				    
		 <!-- File Button --> 
		<div class="form-group">
		  <label class="col-md-4 control-label" for="filebutton">메인 이미지</label>
		  <div class="col-md-4">
		    <input id="filebutton" name="filebutton" class="input-file" type="file">
		  </div>
		</div>
		<!-- File Button --> 
		<div class="form-group">
		  <label class="col-md-4 control-label" for="filebutton">추가 이미지</label>
		  <div class="col-md-4">
		    <input id="filebutton" name="filebutton" class="input-file" type="file">
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