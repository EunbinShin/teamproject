<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="fileName" items="${fileNames}">
	<div style="margin-bottom: 5px;">
		<img
			src="photodownload?photo=${fileName}&bno=${bno}&type=${type}"	<%--photodownload와 매핑된 함수에서 photo가 filename과 같은 애를 http로 return--%>
		 	width="840px"/>
	</div>
</c:forEach>
