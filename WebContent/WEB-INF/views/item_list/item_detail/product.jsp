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
				<div class="info">
					<h2> 이름: ${iDetail.product_name} </h2><br/>
					<h4> 가격: ${iDetail.product_price} </h4><br/>
					<h4> 할인가격: ${iDetail.product_price * product.percentage_discount} </h4><br/> 
					<h4> 수량선택: ${iDetail.available_quantity} </h4><br/>
					<h4> 총상품금액: ${iDetail.selling_price} </h4><br/>
					
					<input id="buy_quantity"
					name="buy_quantity" placeholder="4" type="number"
					style="width: 100px" min="1"><br/>

				<div class="Button" >
						<c:if test="${loginStatus != 'admin'}">
						<a id="b1" href="<%=application.getContextPath() %>/buy/buy_product" target="_blank">Buy</a>
						</c:if>
						
						<c:if test="${loginStatus == 'admin'}">
						<a id="b2" href="delete" target="_blank">Delete</a><p></p>
						</c:if>
						
						<c:if test="${loginStatus == 'admin' }">
						<a id="b2" href="edit" target="_blank">Edit</a><p></p>
						</c:if>
						
						<c:if test="${loginStatus != 'admin'}">
						<script type="text/javascript">
							$(()=>{
								console.log('실행');
								console.log('${item}');
							});
						</script>
						<a id="b3" href="/teamproject/wishlist/wishlist?item=${item}&quantity=${quantity}&name=${name}&detail=${detail}&price=${price}&discount=${discount}" target="_blank"><i class="fas fa-heart"></i></a>
						</c:if>
					</div>
				</div>	
			</section>
			
			<article>
				<jsp:include page="/WEB-INF/views/item_list/item_detail/product_slide.jsp"/>
				<div class="btn_detail">
					<a id="detail" class="btn btn-info btn-sm" href="javascript:detail()">상세페이지</a>
					<a id="review" class="btn btn-info btn-sm" href="javascript:review()">리뷰</a>
					<a id="delivery" class="btn btn-info btn-sm" href="javascript:delivery()">배송정보</a>
				</div>
				<script>
					const detail = () => {
						$.ajax({
							url:"asyncform",
							method:"get",
							error : function() {
						          alert('실패');
						        },
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
							error : function() {
						          alert('실패');
						        },
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
							error : function() {
						          alert('실패');
						        },
							success: (data) => {
								console.log("성공");
								$("#deatail").html(data);
							}
						})
					};
				</script>
				<div id="deatail"></div>
			</article>
			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
</body>	
</html>