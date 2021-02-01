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
		<li ><img
			src="<%=application.getContextPath()%>/resources/img/img01-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img02-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img03-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img04-1.jpg"
			style="width: 15%" /></li>

		<li class="slide_li"><img
			src="<%=application.getContextPath()%>/resources/img/img05-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img06-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img07-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img08-1.jpg"
			style="width: 15%"></li>

		<li class="slide_li"><img
			src="<%=application.getContextPath()%>/resources/img/img09-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img10-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img11-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img12-1.jpg"
			style="width: 15%"></li>

		<li class="slide_li"><img
			src="<%=application.getContextPath()%>/resources/img/img13-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img14-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img15-1.jpg"
			style="width: 15%" /> <img
			src="<%=application.getContextPath()%>/resources/img/img16-1.jpg"
			style="width: 15%"></li>
	</ul>
</div>