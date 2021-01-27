<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="test_slide">
	<ul>
		<li>
		<c:forEach var="fileName" items="${fileNames}">
			<img style="width: 15%" src="adphoto?photo=${fileName}&item=${item}"/>
		</c:forEach>
		</li>
	</ul>
</div>
