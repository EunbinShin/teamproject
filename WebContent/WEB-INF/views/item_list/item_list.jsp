<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SAGI</title>
	<link rel="icon" href="<%=application.getContextPath() %>/resources/img/logo/logo_fapicon.png">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
		rel="stylesheet">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/item_list.css" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>

<body>
	<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>

		<div id="explainList">
			<div id="explainLeft">
				총 <b>16</b>개의 상품이 검색되었습니다.
			</div>
			<h3>상품</h3>
			<ul class="breadcrumb justify-content-center">
				<li class="breadcrumb-item active"><a href="#">도자기</a></li>
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
				<!-- ëª¨ë  íê·¸ì aíê·¸ ì¶ê°íê¸° -->
				<a href="item_detail/product01?item=product01"> 
					<img src="<%=application.getContextPath() %>/resources/img/img01-1.jpg" class="img-bottom">
					<img src="<%=application.getContextPath() %>/resources/img/img01-2.jpg" class="img-top">
				</a> <a href="itemDetail">이름이름이름</a>
				<p>
					<b>가격: 25,000</b>
				</p>
			</div>
			
			<c:forEach var="product" items="${list}">
				<div class="column">
					<a href="productread?bno=${prouct.no}"> 
						<img src="pphoto?mid=${board.bwriter}" class="img-bottom">
						<img src="mphoto?mid=${board.bwriter}" class="img-top">
					</a> <a href="productread?bno=${board.bno}">${board.btitle}</a>
					<p>
						<b>가격: 25,000</b>
					</p>
				</div>
			</c:forEach>

		</div>
		<!-- row -->

		<!-- page number navigation -->
		
			<ul class="pagination justify-content-center">
				<li class="page-item<c:if test="${page == 1}"> disabled</c:if>"><a class="page-link" href="default?page=${page-1}"> 
					<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span></a></li>
			    <li class="page-item<c:if test="${page == 1}"> active</c:if>"><a class="page-link" href="default?page=1">1</a></li>
			    <li class="page-item<c:if test="${page == 2}"> active</c:if>"><a class="page-link" href="default?page=2">2</a></li>
			    <li class="page-item<c:if test="${page == 3}"> active</c:if>"><a class="page-link" href="default?page=3">3</a></li>
			    <li class="page-item<c:if test="${page == 4}"> active</c:if>"><a class="page-link" href="default?page=4">4</a></li>
			    <li class="page-item<c:if test="${page == 5}"> active</c:if>"><a class="page-link" href="default?page=5">5</a></li>
			    <li class="page-item<c:if test="${page == 6}"> active</c:if>"><a class="page-link" href="default?page=6">6</a></li>
			    <li class="page-item<c:if test="${page == 7}"> active</c:if>"><a class="page-link" href="default?page=7">7</a></li>
			    <li class="page-item<c:if test="${page == 8}"> active</c:if>"><a class="page-link" href="default?page=8">8</a></li>
			    <li class="page-item<c:if test="${page == 9}"> active</c:if>"><a class="page-link" href="default?page=9">9</a></li>
			    <li class="page-item<c:if test="${page == 10}"> active</c:if>"><a class="page-link" href="default?page=10">10</a></li>
			    <li class="page-item"><a class="page-link" href="default?page=${page+1}">
			    	<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span></a></li>
  			</ul>

		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>