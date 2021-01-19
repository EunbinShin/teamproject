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
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/index_product_slide.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/index_carousel.css?after" type="text/css">
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
	
</head>

<body onload="start()">
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
		
		<!-- index_carousel --> 
		<jsp:include page="/WEB-INF/views/index/index_carousel.jsp"/>
		
		<!-- 수정: 이미지위 텍스트  --> 
		<div id="banner_row">
			<div class="banner_column">
				<a href="<%=application.getContextPath() %>/item_list/newitems">
					<img id= "col_1" src="<%=application.getContextPath() %>/resources/img/main_event03.jpg" title="New아이템 둘러보기">
				</a>
				<a href="<%=application.getContextPath() %>/item_list/bestitems">
					<img id= "col_2" src="<%=application.getContextPath() %>/resources/img/main_event04.jpg" title="Best아이템 둘러보기">
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
				<jsp:include page="/WEB-INF/views/index/index_product_slide.jsp"/>
				
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