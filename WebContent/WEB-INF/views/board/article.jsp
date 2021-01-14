<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
<title>SAGI</title>
	<link rel="icon" href="/html_css_javaspring/resource/img/logo/logo_fapicon.png">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
		rel="stylesheet">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/qna.css" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<div id="wrapper">
		
			<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
			
			<h3>Review</h3>
			
			<!-- QnA board Table -->
			<div id="table_container">
				<table class="table text-left">
					<tr>
						<td>제목 : ${board.bNo}</td>
					</tr>
					<tr>
						<td>작성자 : ${board.bWriter}</td>
					</tr>
					<tr>
						<td>날짜 : ${board.date}</td>
					</tr>
					<tr>
						<td>
							<div style="width:300px;">
								${board.bContent}
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- QnA board Table -->
			
			<!-- page number navigation -->
			<ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">6</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">7</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">8</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">9</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">10</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
  			</ul>
  			
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>