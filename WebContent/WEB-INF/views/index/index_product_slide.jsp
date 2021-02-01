<style type="text/css">

*{margin:0;padding:0;}

img>ul, li {
	list-style: none;
}

.slide {
	height: 75%;
	overflow: hidden;
	text-align: center;
}

li img{
	margin-left: 10px;
    border-radius: 20%;
}

#slide_ul {
	width: calc(100% * 4);
	display: flex;
	animation: slide 10s infinite;
} 

#slide_ul:hover {
  animation-play-state: paused;
}
		
@keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
}

</style>

<%@ page  contentType="text/html; charset=UTF-8"%>

<div class="slide">
	<ul id="slide_ul">
		<li class="slide_li">
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=57">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/img (1).jpg" style="width: 15%" />
			</a>
			
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=45">
			 	<img src="<%=application.getContextPath() %>/resources/img/index_photo/img (3).jpg" style="width: 15%" /> 
			</a>
			
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=54">
				<img src= "<%=application.getContextPath() %>/resources/img/index_photo/img (5).jpg" style="width: 15%" />
			</a>
						
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=53">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/img (7).jpg" style="width: 15%" /> 
			</a>			
		</li>

		<li class="slide_li">
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=49">
				<img src= "<%=application.getContextPath() %>/resources/img/index_photo/img (11).jpg" style="width: 15%" /> 
			</a>
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=33">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/img (13).jpg" style="width: 15%" /> 
			</a>
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=36">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/img (15).jpg" style="width: 15%" /> 
			</a>
			
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=55">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/img (9).jpg" style="width: 15%" />
			</a>
		</li>

		<li class="slide_li">
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=52">
				<img src= "<%=application.getContextPath() %>/resources/img/index_photo/cup (2).jpg" style="width: 15%" /> 
			</a>
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=50">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/img19.jpg" style="width: 15%" /> 
			</a>
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=40">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/maple.jpg" style="width: 15%" /> 
			</a>
			
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=51">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/mug.jpg" style="width: 15%" />
			</a>
		</li>

		<li class="slide_li">
						<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=39">
				<img src= "<%=application.getContextPath() %>/resources/img/index_photo/plate.jpg" style="width: 15%" /> 
			</a>
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=38">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/tray.jpg" style="width: 15%" /> 
			</a>
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=43">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/tea.jpg" style="width: 15%" /> 
			</a>
			
			<a href="<%=application.getContextPath() %>/item_list/item_detail?product_id=41">
				<img src="<%=application.getContextPath() %>/resources/img/index_photo/holder.jpg" style="width: 15%" />
			</a>
		</li>
	</ul>
</div>