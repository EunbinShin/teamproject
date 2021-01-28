<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				<form onsubmit="loadItems()" id="searchForm" target="_self"  enctype="multipart/form-data">
					<div>
						<div id="searchBarContainer">
							<select id="search_type" name="search_type">
							<option value="product_name">상품명</option>
							</select> 
							<input id="keyword" name="keyword"
								type="text" required>
							<button id="searchBtn">검색</button>
						</div>
						<div>
							<p>총 <b id="item_count">0</b>개 의 상품이 검색되었습니다.</p>
						</div>
					</div>
				</form>
				
				<div id="tableContainer">
					<table class="table">
						<caption id="resultcaption">제품 검색결과입니다</caption>
						<tr>
							<th scope="col">상품 이미지</th>
							<th scope="col">상품 정보</th>
							<th scope="col">선택</th>
						</tr>
						<tbody id="item_list" class="center">
							
						</tbody>
					</table>
				</div>
				<script type="text/javascript">
					const loadItems = () =>{
						event.preventDefault();
						var search_type = $("#search_type").val();
						var keyword = $("#keyword").val();
						$.ajax({
							url: "search_items",
							method: "post",
							data: {search_type:search_type, 
								keyword:keyword},
							success: (data)=>{
								console.log("load Item 실행");
								$("#item_list").html(data);
								if($(".item_result").length == 0){
									$("#item_count").html(0);
									$("#resultcaption").html('제품 검색결과입니다.');
								}else{
									$("#item_count").html($(".item_result").length);
									$("#resultcaption").html('');
								}
							}
						});
					}
					const selectItem = (product_id) => {
						console.log("select Item");
						$.ajax({
							url: "update_item",
							method: "post",
							data: {product_id:product_id},
							success: (data)=>{
								console.log("load Item 실행");
								$(opener.document).find("#ptest").text(data.product_id);
								var url = "searchphoto?id="+data.product_id+"&image="+data.thumbnail;
								$(opener.document).find("#selectImg").attr("src", url);
								$(opener.document).find("#products_product_id").val(data.product_id);
								self.close();
							}
						});
					}
				</script>
	
			</div>
		</div>
	</body>
</html>