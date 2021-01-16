<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="fileName" items="${fileNames}">
	<tr>
		<th scope="col">
			<img 
			src="<%=application.getContextPath() %>/resources/img/img01-1.jpg" 
			width="100px">
		</th>
		<th scope="col">상품 정보</th>
		<th scope="col"><a class="btn btn-primary">선택</a></th>
	</tr>
</c:forEach>
