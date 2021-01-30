<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="test_slide">
	<ul>
		<li>
		<c:forEach var="product" items="${products}">
			<a href="/teamproject/item_list/item_detail?product_id=${product.product_id}">
				<img style="width: 15%" src="thumbnail?id=${product.product_id}&image=${product.thumbnail}"/>
			</a>
		</c:forEach>
		</li>
	</ul>
</div>
