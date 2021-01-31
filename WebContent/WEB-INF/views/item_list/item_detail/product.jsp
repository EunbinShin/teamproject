<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/add.css?after" type="text/css"> 
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/product_slide.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/product.css?after" type="text/css">
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>	
		
			<section>
				<div class="img"> 
					<div>
						<img src="detail_thumbnail?product_id=${iDetail.product_id}" style="height:100%">
					</div>
				</div> <!-- cover -->
				<div class="info border-bottom border-top">
					<h5> ${iDetail.product_name} </h5>
					<h4> ${iDetail.product_price} 원 </h4>
					<div class="ml-5 d-flex flex-row bd-highlight mb-3">
						<div class="p-2 bd-highlight">배송비</div>
						<div class="p-2 bd-highlight">
							4000원 (100,000원 이상 구매 시 무료)<br/>
							제주 및 도서 산간 2000원 추가</div>
					</div>
					<input id="buy_quantity"
						name="buy_quantity" placeholder="1" type="number"
						style="width: 100px" min="1"><br/>

					<div class="Button" >
						<c:if test="${loginStatus.id != 'admin'}">
						<a id="b1" href="<%=application.getContextPath() %>/buy/buy_product" target="_blank">구매하기</a>
						</c:if>
						
						<c:if test="${loginStatus.id == 'admin'}">
						<a id="b2" href="<%=application.getContextPath() %>/product_manage/edit/delete_product?product_id=${iDetail.product_id}" target="_blank">Delete</a><p></p>
						</c:if>
						
						<c:if test="${loginStatus.id == 'admin' }">
						<a id="b2" href="<%=application.getContextPath() %>/product_manage/edit/edit_product?product_id=${iDetail.product_id}" target="_blank">Edit</a><p></p>
						</c:if>
						
						<c:if test="${loginStatus.id != 'admin'}">
						
						<a id="b3" href="/teamproject/wishlist/wishlist?item=${item}&quantity=${quantity}&name=${name}&detail=${detail}&price=${price}&discount=${discount}" target="_blank"><i class="fas fa-heart"></i></a>
						</c:if>
					</div>
				</div>	
			</section>
			
			
			<article>
				<jsp:include page="/WEB-INF/views/item_list/item_detail/product_slide.jsp"/>
				<div class="btn_detail">
					<a id="detail" class="mybtn" href="javascript:detail()">상세페이지</a>
					<a id="review" class="mybtn" href="javascript:review()">리뷰</a>
					<a id="delivery" class="mybtn" href="javascript:delivery()">배송정보</a>
				</div>
				<script>
					var id = "<c:out value='${iDetail.product_id}'/>";
					const detail = () => {
						$.ajax({
							url:"defaultform",
							method:"get",
							data: {product_id : id},
							success: (data) => {
								console.log("성공");
								$("#deatail").html(data);
							}
						})
					};
					const review = () => {
						$.ajax({
							url:"reviewform",
							method:"get",
							data: {product_id : id},
							success: (data) => {
								console.log("성공");
								$("#deatail").html(data);
							}
						})
					};
					const delivery = () => {
						$.ajax({
							url:"deliveryform",
							method:"get",
							success: (data) => {
								console.log("성공");
								$("#deatail").html(data);
							}
						})
					};
					
					$(()=>{
						console.log('실행');
						detail();
						
					});
				</script>
				<div id="deatail"></div>
			</article>
			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
</body>	
</html>