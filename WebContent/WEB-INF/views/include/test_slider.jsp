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
