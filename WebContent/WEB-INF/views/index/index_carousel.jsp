<script>
	carousel01 = function() {
		location.href="<%=application.getContextPath() %>/item_list/item_detail?product_id=38";
		logger.info("carousel01 실행");
	}
	
	carousel02 = function() {
		location.href="<%=application.getContextPath() %>/item_list/item_detail?product_id=32";
		logger.info("carousel01 실행");
	}
	
	carousel03 = function() {
		location.href="<%=application.getContextPath() %>/item_list/item_detail?product_id=35";
		logger.info("carousel01 실행");
	}
</script>

<%@ page  contentType="text/html; charset=UTF-8"%>

<div id="demo" class="carousel slide" data-ride="carousel">
	<ul class="carousel-indicators">
		<li data-target="#demo" data-slide-to="0" class="active" style="width:50px;"></li>
		<li data-target="#demo" data-slide-to="1" style="width:50px;" ></li>
		<li data-target="#demo" data-slide-to="2" style="width:50px;"></li>
	</ul>

	<div class="carousel-inner">
		<div class="carousel-item active">
			<img onclick="carousel01()" src= "<%=application.getContextPath() %>/resources/img/carousel01.jpg" alt="A" >
		</div>
		<div class="carousel-item">
			<img onclick="carousel02()" src= "<%=application.getContextPath() %>/resources/img/carousel02.jpg" alt="B" >
		</div>
		<div class="carousel-item">
			<img onclick="carousel03()" src= "<%=application.getContextPath() %>/resources/img/carousel03.jpg" alt="C">
		</div>
	</div>

	<a class="carousel-control-prev" href="#demo" data-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</a>
	
	<a class="carousel-control-next" href="#demo" data-slide="next">
		<span class="carousel-control-next-icon"></span>
	</a>
</div>