<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/popup.css?after" type="text/css">
	</head>
	
	<body>
		<div>
			<div class="header">
				<h1>상품검색</h1>
			</div>
			<div class="content">
				<form id="searchForm" name="" action="" method="" target="_self" enctype="multipart/form-data">
					<div>
						<div id="searchBarContainer">
							<select id="search_type" name="search_type">
							<option value="product_name">상품명</option>
							<option value="prd_model">모델명</option>
							</select> 
							<input id="keyword" name="keyword"
								type="text">
							<a href="" id="searchBtn">검색</a>
						</div>
						<div>
							<p>총 <b>0</b>개 의 상품이 검색되었습니다.</p>
						</div>
					</div>
				</form>
				<div id="tableContainer">
					<table class="table">
						<caption>제품 검색결과입니다</caption>
						<tr>
							<th scope="col">상품 이미지</th>
							<th scope="col">상품 정보</th>
							<th scope="col">선택</th>
						</tr>
						<tbody class="center"></tbody>
					</table>
				</div>
	
			</div>
		</div>
	</body>
</html>