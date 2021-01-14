<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> SAGI </title>
		<link rel="icon" href="<%=application.getContextPath() %>/resources/img/logo/logo_fapicon.png">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/bestitem_list.css" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
		<script type="text/javascript">
			const gotoHome = () => {
				location.href = "/html_css_javaspring/index.html";
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
				setInterval(gliter, 250, document.getElementsByClassName("badge"));
			}
		</script>
	</head>
	
	<body onload="start()">
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
			<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>	
			
			<div id="explainList">
				<div id="explainLeft">
					총 <b>16</b>개의 상품이 검색되었습니다.
				</div>
				<h3>신상품</h3>
				<ul class="breadcrumb justify-content-center">
					<li class="breadcrumb-item"><a href="#">도자기</a></li>
					<li class="breadcrumb-item"><a href="#">식기</a></li>
					<li class="breadcrumb-item"><a href="#">유리그릇</a></li>
				</ul>
				
				<div id="explainRight">
					<ul>
						<li><a href="#">상품명</a></li>
						<li><a href="#">높은가격순</a></li>
						<li><a href="#">낮은가격순</a></li>
					</ul>
				</div>
			</div>
			<div id="row">
				<div class="column">
					<!-- 모든 태그에 a태그 추가하기 -->
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img01-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img01-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b><b>가격: 25,000</b></b></p>
				</div> 
				<div class="column">
					<a href = "/html_css_javaspring/item_detail/product02.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img02-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img02-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "/html_css_javaspring/item_detail/product03.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img03-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img03-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "/html_css_javaspring/item_detail/product04.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img04-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img04-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img05-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img05-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img06-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img06-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img07-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img07-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> <div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img08-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img08-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img09-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img09-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> <div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img10-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img10-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> <div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img11-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img11-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img12-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img12-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img13-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img13-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img14-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img14-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img15-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img15-2.jpg" class="img-top" >	
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img16-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/new/img16-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-secondary">New</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
			</div> <!-- row -->
		
			<!-- page number navigation -->
			<ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
			    <li class="page-item active"><a class="page-link" href="javascript:void(0); ">1</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">6</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">7</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">8</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">9</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">10</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
  			</ul>
  			
					<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>