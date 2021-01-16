<%@ page contentType="text/html; charset=UTF-8"%>

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
	<script type="text/javascript">
		const gotoHome = () => {
			location.href="<%=application.getContextPath() %>/index.jsp";
		}	
		
		let change = true;
		
		const gliter = (badge) => {
			if(change){
				for(let i = 0 ; i < badge.length; i++){
					badge[i].classList.remove('badge-secondary');
				}
				change = false;
			}else{
				for(let i = 0 ; i < badge.length; i++){
					badge[i].classList.add('badge-secondary');
				}
				change = true;
			}	
		};
		
		const start = () => {
			console.log("start glittering");
			setInterval(gliter, 1000, document.getElementsByClassName("badge"));
		}
	</script>
	
	<style type="text/css">
	/* slide show */
	*{margin:0;padding:0;}
    img > ul,li{list-style:none;}
    .trend_slide{height: 75%;overflow:hidden;}
    .trend_slide ul{width:calc(100% * 4);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .trend_slide li{width:calc(100% / 4);height: 75%;}
	</style>
</head>

<body onload="start()">
	<div id="mySidenav" class="sidenav">
		<a class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">Review</a>
		<a href="<%=application.getContextPath() %>/board/qna_board/qna.html">QnA</a>
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
              
              <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link"
					href="<%=application.getContextPath() %>/index.jsp">HOME</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropbtn"
					href="<%=application.getContextPath() %>/item_list/default_itemlist/item_list.jsp">SHOP</a>
					<div class="dropdown-content">
						<a href="<%=application.getContextPath() %>/item_list/new_itemlist/newitem_list.jsp">NEW</a>
						<a href="<%=application.getContextPath() %>/item_list/best_itemlist/bestitem_list.jsp">BEST</a>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="<%=application.getContextPath() %>/add/add.jsp">ADD</a></li>
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
              
              <a style="margin-right:10px" href="<%=application.getContextPath() %>/login/login.jsp"><i class="fas fa-user"></i></a>
         </nav>	
		
		<!-- 수정: main home image slide --> 
		<div id="demo" class="carousel slide" data-ride="carousel">
	  		<ul class="carousel-indicators">
	    		<li data-target="#demo" data-slide-to="0" class="active"></li>
	    		<li data-target="#demo" data-slide-to="1"></li>
	    		<li data-target="#demo" data-slide-to="2"></li>
	  		</ul>
			
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src= "<%=application.getContextPath() %>/resources/img/home_a01.jpg" alt="A" >
		    	</div>
		    	<div class="carousel-item">
		    		<img src= "<%=application.getContextPath() %>/resources/img/home_a02.jpg" alt="B" >
		    	</div>
		    	<div class="carousel-item">
		    		<img src= "<%=application.getContextPath() %>/resources/img/home_a03.jpg" alt="C">
		    	</div>
		    </div>
		    
		    <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    		<span class="carousel-control-prev-icon"></span>
	  		</a>
	  		<a class="carousel-control-next" href="#demo" data-slide="next">
	 		   <span class="carousel-control-next-icon"></span>
	  		</a>
		</div>

		<!-- 수정: 목표 달성 -->
		
		<!-- 수정: 이미지위 텍스트  --> 
		<div id="banner_row">
			<div class="banner_column">
				<a href="<%=application.getContextPath() %>/item_list/new_itemlist/newitem_list.jsp">
					<img id= "col_1" src="<%=application.getContextPath() %>/resources/img/main_event03.jpg" >
				</a>
				<a href="<%=application.getContextPath() %>/item_list/best_itemlist/bestitem_list.jsp">
					<img id= "col_2" src="<%=application.getContextPath() %>/resources/img/main_event04.jpg" >
				</a>
			</div> 
		</div>

		<!-- 수정: 완료  --> 
		
		
		<div id="row">		
			<div id="row_name"> <h3>금주의 베스트 셀러</h3> </div>
			<div class="column">
				<a href = "html/product.html">
					<img  src= "<%=application.getContextPath() %>/resources/img/img01-1.jpg" class="img-bottom"  >
					<img  src= "<%=application.getContextPath() %>/resources/img/img01-2.jpg" class="img-top"  >
					<span class="badge badge-secondary">Best</span>
				</a>
			</div> 
			<div class="column">
				<a href = "html/product.html">
					<img src= "<%=application.getContextPath() %>/resources/img/img02-1.jpg" class="img-bottom" >
					<img src= "<%=application.getContextPath() %>/resources/img/img02-2.jpg" class="img-top"  >
					<span class="badge badge-secondary">New</span>
				</a>
			</div> 
			<div class="column">
				<a href = "html/product.html">
					<img src= "<%=application.getContextPath() %>/resources/img/img03-1.jpg" class="img-bottom" >
					<img src= "<%=application.getContextPath() %>/resources/img/img03-2.jpg" class="img-top" >
					<span class="badge badge-secondary">New</span>
				</a>
			</div> 
			<div class="column">
				<a href = "html/product.html">
					<img src= "<%=application.getContextPath() %>/resources/img/img04-1.jpg" class="img-bottom" >
					<img src= "<%=application.getContextPath() %>/resources/img/img04-2.jpg" class="img-top" >
					<span class="badge badge-secondary">New</span>
				</a>
			</div> 		
			<div class="column">
				<a href = "html/product.html">
					<img src= "<%=application.getContextPath() %>/resources/img/img05-1.jpg" class="img-bottom" >
					<img src= "<%=application.getContextPath() %>/resources/img/img05-2.jpg" class="img-top" >
					<span class="badge badge-secondary">New</span>
				</a>
			</div> 		
			<div class="column">
				<a href = "html/product.html">
					<img src= "<%=application.getContextPath() %>/resources/img/img06-1.jpg" class="img-bottom" >
					<img src= "<%=application.getContextPath() %>/resources/img/img06-2.jpg" class="img-top" >
					<span class="badge badge-secondary">New</span>
				</a>
			</div> 		
			<div class="column">
				<a href = "html/product.html">
					<img src= "<%=application.getContextPath() %>/resources/img/img07-1.jpg" class="img-bottom" >
					<img src= "<%=application.getContextPath() %>/resources/img/img07-2.jpg" class="img-top" >
					<span class="badge badge-secondary">New</span>
				</a>
			</div> 
			<div class="column">
				<a href = "html/product.html">
					<img src= "<%=application.getContextPath() %>/resources/img/img08-1.jpg" class="img-bottom" >
					<img src= "<%=application.getContextPath() %>/resources/img/img08-2.jpg" class="img-top" >
					<span class="badge badge-secondary">New</span>
				</a>
			</div> 
		</div> <!-- row -->
		
		<div id="trend">
			<h3># 모아보기</h3>
			<div class="trend_con">
				<table id="tag_table" class="table table-bordered">
	  				<tbody>
						<tr><td>#우드 식기</td></tr>
	  					<tr><td>#실버 식기</td></tr>
	  					<tr><td>#주방정리</td></tr>
	  				</tbody>
				</table>	
				<div id="tag_slide" class="trend_slide ">
					<ul >
						<li><img src= "<%=application.getContextPath() %>/resources/img/img01-1.jpg" style="width:15%"/>   <img src= "<%=application.getContextPath() %>/resources/img/img02-1.jpg"style="width:15%"/>  
						<img src= "<%=application.getContextPath() %>/resources/img/img03-1.jpg"style="width:15%"/>   <img src= "<%=application.getContextPath() %>/resources/img/img04-1.jpg" style="width:15%"/></li> 
						
						<li><img src= "<%=application.getContextPath() %>/resources/img/img05-1.jpg" style="width:15%"/> <img src= "<%=application.getContextPath() %>/resources/img/img06-1.jpg" style="width:15%"/> 
						<img src= "<%=application.getContextPath() %>/resources/img/img07-1.jpg"style="width:15%"/> <img src= "<%=application.getContextPath() %>/resources/img/img08-1.jpg" style="width:15%"></li>
						
						<li><img src= "<%=application.getContextPath() %>/resources/img/img09-1.jpg" style="width:15%"/> <img src= "<%=application.getContextPath() %>/resources/img/img10-1.jpg" style="width:15%"/> 
						<img src= "<%=application.getContextPath() %>/resources/img/img11-1.jpg"style="width:15%"/> <img src= "<%=application.getContextPath() %>/resources/img/img12-1.jpg" style="width:15%"></li>
						
						<li><img src= "<%=application.getContextPath() %>/resources/img/img13-1.jpg" style="width:15%"/> <img src= "<%=application.getContextPath() %>/resources/img/img14-1.jpg" style="width:15%"/> 
						<img src= "<%=application.getContextPath() %>/resources/img/img15-1.jpg"style="width:15%"/> <img src= "<%=application.getContextPath() %>/resources/img/img16-1.jpg" style="width:15%"></li>
					</ul>
				</div>  <!-- slide  -->
			</div> <!-- trend_con -->
		</div> <!-- trend  -->
		
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