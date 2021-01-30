<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*" %>
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
				총 <b>${total_products}</b>개의 상품이 검색되었습니다.
			</div>
			<h3>상품</h3>
			<ul class="breadcrumb justify-content-center">
				<li class="breadcrumb-item active"><a href="default?ordertype=1&category=1">도자기</a></li>
				<li class="breadcrumb-item"><a href="default?ordertype=1&category=2">식기</a></li>
				<li class="breadcrumb-item"><a href="default?ordertype=1&category=3">유리그릇</a></li>
				<li class="breadcrumb-item"><a href="default?ordertype=1&category=4">장식품</a></li>
			</ul>

			<div id="explainRight">
				<ul>
					<li><a href="default?ordertype=1&category=${pager.category}">상품명</a></li>
					<li><a href="default?ordertype=2&category=${pager.category}">높은가격순</a></li>
					<li><a href="default?ordertype=3&category=${pager.category}">낮은가격순</a></li>
				</ul>
			</div>
		</div>
		
		<!-- row -->
		
		<div id="row"> 
			<c:forEach var="product" items="${products}" varStatus="status">
				<div class="column">
					<a href="item_detail?product_id=${product.product_id}"> 
						<img width="490" height="615" src="thumbnail?id=${product.product_id}&image=${product.thumbnail}" class="img-bottom">
						<img width="490" height="615" src="thumbnail_hover?id=${product.product_id}&image=${product.thumbnailhover}" class="img-top">
					</a>
					<a href="item_detail?product_id=${product.product_id}">${product.product_name}</a>
					<p>
						<b>가격: ${product.product_price} &#8361</b>
					</p>
				</div>
		  	</c:forEach>
	  	</div> 
		
		<!-- page number navigation -->
			<div class="d-flex align-items-center justify-content-center">
				<div>
					<a href="default?page=1&ordertype=${pager.type}&category=${pager.category}" class="btn btn-outline-dark btn-sm mr-1">처음</a>
					<c:if test="${pager.groupNo > 1}">
						<a href="default?page=${pager.startPageNo-1}&ordertype=${pager.type}&category=${pager.category}" class="btn btn-outline-dark btn-sm mr-1">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${i == pager.pageNo }">
							<a href="default?page=${i}&ordertype=${pager.type}&category=${pager.category}" class="btn btn-secondary btn-sm mr-1">${i}</a>
						</c:if>
						<c:if test="${i != pager.pageNo }">
							<a href="default?page=${i}&ordertype=${pager.type}&category=${pager.category}" class="btn btn-outline-secondary btn-sm mr-1">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo < pager.totalGroupNo}">
						<a href="default?page=${pager.endPageNo+1}&ordertype=${pager.type}&category=${pager.category}" class="btn btn-outline-dark btn-sm ml-1 mr-1">다음</a>
					</c:if>
					<a href="default?page=${pager.totalPageNo}&ordertype=${pager.type}&category=${pager.category}" class="btn btn-outline-dark btn-sm">맨끝</a>
				</div>
			</div>

		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>