<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			let change = true;
			
			const gliter = (badge) => {
				if(change){
					for(let i = 0 ; i < badge.length; i++){
						badge[i].classList.remove('badge-warning');
					}
					change = false;
				}else{
					for(let i = 0 ; i < badge.length; i++){
						badge[i].classList.add('badge-warning');
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
				<h3>Best Item</h3>
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
				<div>
				<div class="column">
					<!-- 모든 태그에 a태그 추가하기 -->
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img01-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img01-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b><b>가격: 25,000</b></b></p>
				</div> </div>
				<div class="column">
					<a href = "/html_css_javaspring/item_detail/product02.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img02-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img02-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "/html_css_javaspring/item_detail/product03.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img03-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img03-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "/html_css_javaspring/item_detail/product04.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img04-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img04-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img05-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img05-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img06-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img06-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img07-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img07-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> <div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img08-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img08-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img09-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img09-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> <div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img10-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img10-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> <div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img11-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img11-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img12-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img12-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img13-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img13-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img14-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img14-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img15-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img15-2.jpg" class="img-top" >	
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
				<div class="column">
					<a href = "html/product.html">
						<img src= "<%=application.getContextPath() %>/resources/img/img16-1.jpg" class="img-bottom">
						<img src= "<%=application.getContextPath() %>/resources/img/img16-2.jpg" class="img-top" >
					</a>
					<a href = "/html_css_javaspring/item_detail/product01.html">
						<span class="badge badge-warning">Best</span>
						이름이름이름
					</a>
					<p><b>가격: 25,000</b></p>
				</div> 
			</div> <!-- row -->
		
			<!-- page number navigation -->
			<ul class="pagination justify-content-center">
				<li class="page-item<c:if test="${page == 1}"> disabled</c:if>"><a class="page-link" href="bestitems?page=${page-1}"> 
					<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span></a></li>
			    <li class="page-item<c:if test="${page == 1}"> active</c:if>"><a class="page-link" href="bestitems?page=1">1</a></li>
			    <li class="page-item<c:if test="${page == 2}"> active</c:if>"><a class="page-link" href="bestitems?page=2">2</a></li>
			    <li class="page-item<c:if test="${page == 3}"> active</c:if>"><a class="page-link" href="bestitems?page=3">3</a></li>
			    <li class="page-item<c:if test="${page == 4}"> active</c:if>"><a class="page-link" href="bestitems?page=4">4</a></li>
			    <li class="page-item<c:if test="${page == 5}"> active</c:if>"><a class="page-link" href="bestitems?page=5">5</a></li>
			    <li class="page-item<c:if test="${page == 6}"> active</c:if>"><a class="page-link" href="bestitems?page=6">6</a></li>
			    <li class="page-item<c:if test="${page == 7}"> active</c:if>"><a class="page-link" href="bestitems?page=7">7</a></li>
			    <li class="page-item<c:if test="${page == 8}"> active</c:if>"><a class="page-link" href="bestitems?page=8">8</a></li>
			    <li class="page-item<c:if test="${page == 9}"> active</c:if>"><a class="page-link" href="bestitems?page=9">9</a></li>
			    <li class="page-item<c:if test="${page == 10}"> active</c:if>"><a class="page-link" href="bestitems?page=10">10</a></li>
			    <li class="page-item"><a class="page-link" href="bestitems?page=${page+1}">
			    	<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span></a></li>
  			</ul>
  			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>