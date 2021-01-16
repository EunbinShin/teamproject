<%@ page  contentType="text/html; charset=UTF-8"%>

<div id="demo" class="carousel slide" data-ride="carousel">
	<ul class="carousel-indicators">
		<li data-target="#demo" data-slide-to="0" class="active" style="width:50px;"></li>
		<li data-target="#demo" data-slide-to="1" style="width:50px;" ></li>
		<li data-target="#demo" data-slide-to="2" style="width:50px;"></li>
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