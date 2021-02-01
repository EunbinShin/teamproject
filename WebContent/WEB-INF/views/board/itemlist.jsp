<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="item" items="${items}">
	<tr class="item_result border border-secondary">
		<td><img width="80px" height="80px" src="searchphoto?id=${item.product_id}"></td>
		<td class="align-middle">
			<a>${item.product_name}</a>
			<a>${item.product_price}</a>
		</td>
		<td class="align-middle">
			<a onclick="selectItem('${item.product_id}')" class="btn btn-primary">선택</a>
		</td>
	</tr>
</c:forEach>