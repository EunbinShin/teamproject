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
				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<th>그릇이 너무 좋아요</th>
							<th>신은빈</th>
							<th>2021.01.02</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>2</th>
							<th>제가 그릇은 안쓰는데 여기껀 써요</th>
							<th>이영준</th>
							<th>2021.01.05</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>3</th>
							<th>이 그릇에 밥을 먹고 오병이어의 기적을 느꼈어요</th>
							<th>원지영</th>
							<th>2021.01.01</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>4</th>
							<th>그릇이 깨졌어요</th>
							<th>곽두팔</th>
							<th>2021.01.02</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>5</th>
							<th>야구선수가 던져도 안깨져요</th>
							<th>김진욱</th>
							<th>2021.01.05</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>6</th>
							<th>최고의 사이트</th>
							<th>감자바</th>
							<th>2021.01.01</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>7</th>
							<th>아 정말 데단헤</th>
							<th>신은진</th>
							<th>2021.01.02</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>8</th>
							<th>QnA에 문의 드립니다</th>
							<th>이준영</th>
							<th>2021.01.05</th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>10</th>
							<th>유튜브 협찬 문의 드립니다</th>
							<th>유듀버</th>
							<th>2021.01.01</th>
						</tr>
					</tbody>
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