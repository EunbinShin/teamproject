<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="txt">
	<img src="mainphoto?product_id=${itemdetail.product_id}" style="height:100%">
	<p>${itemdetail.product_desc}<p/>
	<c:if test="${itemdetail.sub1_img != null}">
		<img src="sub1photo?product_id=${itemdetail.product_id}" style="height:100%">
	</c:if>
	<c:if test="${itemdetail.sub2_img != null}">
		<img src="sub2photo?product_id=${itemdetail.product_id}" style="height:100%">
	</c:if>
	<c:if test="${itemdetail.sub3_img != null}">
		<img src="sub3photo?product_id=${itemdetail.product_id}" style="height:100%">
	</c:if>
</div>