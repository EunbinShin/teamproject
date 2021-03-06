<style>

*{margin:0;padding:0;}

img>ul, li {
	list-style: none;
}

.slide {
	height: 75%;
	overflow: hidden;
	text-align: center;
}
.slide ul {
	width: calc(100% * 4);
	display: flex;
	animation: slide 10s infinite;
} 
.slide li {
	width: calc(100%/ 4);
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

.test_slide {
	height: 75%;
	overflow: hidden;
	text-align: center;
}

li img{
	margin-left: 10px;
    border-radius: 20%;
}

.test_slide ul {
	width: calc(100% * 4);
	display: flex;
	animation: slide2 2.5s;
	animation-play-state: running;
	
} 
.test_slide li {
	width: calc(100%/ 4);
}

@keyframes slide2 {
   	from {margin-left: 100%;}
     to {margin-left: 0%;}
}
</style>

<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="test_slide">
	<ul>
		<li>
		<c:forEach var="product" items="${products}">
			<a href="/teamproject/item_list/item_detail?product_id=${product.product_id}">
				<img style="width: 15%" src="/teamproject/board/searchphoto?id=${product.product_id}"/>
			</a>
		</c:forEach>
		</li>
	</ul>
</div>
