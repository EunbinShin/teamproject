<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <c:forEach var="fileName" items="${fileNames}">
     <div style="display:flex; align-items=center">
     	<script>
     		$(()=>{
     			console.log('실행');
     			console.log(${product_id});
     		});
     	</script>
     	<img src= "photodownload?photo=${fileName}&productid=${product_id}" 
		      width="100px" height="100px" 
		      style="margin-right: 30px;"/>
     	<a href="photodownload?photo=${fileName}">${fileName}</a>
      </div>
   </c:forEach>
