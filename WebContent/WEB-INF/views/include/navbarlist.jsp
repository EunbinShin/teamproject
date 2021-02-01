<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 0}">
	<div>결과가 없습니다.</div>
</c:if>
<c:forEach var="item" items="${items}">
	<div class="d-flex flex-row bd-highlight mb-3 border border-secondary">
		<div class="p-2 bd-highlight">
			<a href="/teamproject/item_list/item_detail?product_id=${item.product_id}">
				<img width="80px" height="80px" src="/teamproject/board/searchphoto?id=${item.product_id}">
			</a>
		</div>
		<div class="p-2 bd-highlight align-middle">
			<a href="/teamproject/item_list/item_detail?product_id=${item.product_id}">${item.product_name}</a>
			<br/>
			<a href="/teamproject/item_list/item_detail?product_id=${item.product_id}">${item.selling_price}원</a>
		</div>
	</div>
</c:forEach>