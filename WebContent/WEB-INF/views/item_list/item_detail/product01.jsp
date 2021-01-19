<%@ page contentType="text/html; charset=UTF-8"%>
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>	
		
			<section>
				<div class="img">
					<div>
						<img src= "<%=application.getContextPath() %>/resources/img/img01-1.jpg" style="height:100%"  >
					</div>
				</div> <!-- cover -->
				<div class="info">
					<h2> 이름이름이름 </h2><br/>
					<h4> 가격: 25,000 <input id="buy_quantity" name="buy_quantity" placeholder="주문량" required="" type="number" style="width:100px" min="1"></h4>
					<p></p>
					<h5> I'm a product detail. I'm a great place to add more information about your product such as sizing, material, care and cleaning instructions. 
						This is also a great space to write what makes this product special and how your customers can benefit from this item. </h5>
					<br/>
					
					<div class="Button" >
						<a id="b1" href="구매" target="_blank">Buy</a>
						<a id="b2" href="장바구니" target="_blank">Take a Cart <i class="fa fa-shopping-cart"></i></a>
						<a id="b3" href="/teamproject/wishlist/wishlist?item=product01" target="_blank"><i class="fas fa-heart"></i></a>
					</div>
				</div>	
			</section>
			
			<article>
				<div class="txt">
					<img src= "<%=application.getContextPath() %>/resources/img/img01-3.jpg" style="width:100%"  >
					<p></p>
					<h3>POINT</h3>
					<p> 주물 주전자의 아날로그 감성을 살린 디자인 <br> 동아시아권에서 전통적으로 찻물을 끓일 때 사용하던 무쇠 주물 주전자에서 <br> 모티브를 얻어 현대적으로 재해석한 디자인의 전기 포트입니다. <br>
						
					<p> 손잡이는 다이캐스트로 제작,  스테인리스 재질로 거친 무쇠의 느낌을 살렸습니다. <br> 균형잡힌 외관 라인과 구도 심플한 외관 라인을 위해 <br> 
							직선과 곡선이 조화롭게 보일 수 있게 디자인했으며 구도상의 균형을 위해 받침대를 넓게 제작했습니다. <br>
							
					<p>	가벼운 느낌이 아닌 묵직한 느낌의 첫인상 일반적인 전기 포트의 가벼운 느낌과는 다른 첫인상과 같은 묵직함을 느끼실 수 있습니다.  <br> 
							안정적인 곡선의 각도 추출구의 끝부분을 세밀하게 디자인하여 안정적인 각도로 물을 따를 수 있게 하였습니다. </p>
					<p></p>
					<img src= "<%=application.getContextPath() %>/resources/img/img01-4.jpg" style="width:100%"  >
					<p></p>
					<img src= "<%=application.getContextPath() %>/resources/img/img01-5.jpg" style="width:100%"  >
				</div>
			</article>
		
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
		</div>
</body>	
</html>