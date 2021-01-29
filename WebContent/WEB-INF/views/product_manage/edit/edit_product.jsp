<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> SAGI </title>
	
	<link rel="icon" href="<%=application.getContextPath() %>/resource/img/logo/logo_fapicon.png">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/add.css?after" type="text/css"> 
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	
	<script type="text/javascript">
		const gotoHome = () => {
			location.href = "/html_css_javaspring/index.html";
		}	
		
		
		price_Calc = function(){
			var oriprice = Number(document.getElementById("product_price").value);
			var sales = Number(document.getElementById("percentage_discount").value);
			if(sales > 99) {
				alert("할인율은 최대 99%입니다")
				sales = 99;
			} 
			var discount = sales /100;
			var sellp = oriprice - (oriprice * discount);
			
			if(sales == 99){
				document.getElementById("percentage_discount").value = 99;	
				
				var oriprice = Number(document.getElementById("product_price").value);
				var sales = Number(document.getElementById("percentage_discount").value);
				var discount = sales /100;
				var sellp = oriprice - (oriprice * discount);
				
			}
			
			document.getElementById("selling_price").value = sellp.toFixed(0);

		}
	
		
		
		genId = function() {
			var pcate = document.getElementById("product_category").value
			var pname = document.getElementById("product_name").value
			document.getElementById("product_id").value = pcate + "-" + pname;
		}
		
		
		
		
	</script>
	
</head>

<body>
	<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
	
	<div class="add">
		<form method= "post" enctype="multipart/form-data" name="edit_productForm" action="edit_product" class="form-horizontal">
			<fieldset>
			<!-- Form Name -->
			<legend id="form-name">상품 수정</legend>

			<!-- Select Basic -->
			<div class="form-group">
				<label for="product_categorie" class="col-md-4 control-label">상품 카테고리</label>
				<div class="col-md-4">
					<input onchange="genId()" value="${pmDto.product_category}" id="product_category" name="product_category" class="form-control" type="text">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label for="product_name" class="col-md-4 control-label">상품명</label>
				<div class="col-md-4">
					<input onchange="genId()" value="${pmDto.product_name}" id="product_name" name="product_name"  class="form-control input-md" type="text">
					
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label for="product_id" class="col-md-4 control-label">상품 코드</label>
				<div class="col-md-4">
					<input readonly value="${pmDto.product_id}" id="product_id" name="product_id"  class="form-control input-md"  type="text">
					<input hidden value="${pmDto.old_product_id}" id="old_product_id" name="old_product_id"  class="form-control input-md"  type="text">
				</div>
			</div>
			
			<!-- num input-->
			<div class="form-group">
				<label for="product_price" class="col-md-4 control-label">상품 가격</label>  
				<div class="col-md-4">
				<input onchange="price_Calc()" value="${pmDto.product_price}" id="product_price" name="product_price" placeholder="상품 가격 " class="form-control input-md" type="number" step="1000">
					
				</div>
			</div>
			
			<!-- num input-->
			<div class="form-group">
				<label for="percentage_discount" class="col-md-4 control-label">상품 할인율</label>  
				<div class="col-md-4">
				<input onchange="price_Calc()" value="${pmDto.percentage_discount}" id="percentage_discount" name="percentage_discount" placeholder="상품 할인율" class="form-control input-md" type="number" 
				step="5" min="0" max="100">	
				</div>
			</div>
			
			
			<!-- num input-->
			<div class="form-group">				
				<label for="selling_price" class="col-md-4 control-label">상품 판매가 (할인 적용) </label>  
				
				<div class="col-md-4">
				<input readonly value="${pmDto.selling_price}" id="selling_price"  name="selling_price" value ="selling_price" class="form-control input-md" type="number">
			</div>

			</div>
			
			<!-- Textarea -->
			<div class="form-group">
				<label for="product_desc" class="col-md-4 control-label">상품 설명</label>
				<div class="col-md-4">                     
					<textarea class="form-control" id="product_desc" name="product_desc">${pmDto.product_desc}</textarea>
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label for="available_quantity" class="col-md-4 control-label">주문 가능 수량</label>  
				<div class="col-md-4">
					<input value="${pmDto.available_quantity}" id="available_quantity" name="available_quantity" class="form-control input-md" 
					type="number" min="0" max="100">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label for="post_date" class="col-md-4 control-label">상품 개시일</label>  
				<div class="col-md-4">
					<input value="${pmDto.post_date}" id="post_date" name="post_date" requried class="form-control input-md" type="date">					
				</div>
			</div>	

			<div class="form-group">
				<label for="best" class="col-md-4 control-label">상품 뱃지 설정</label>  
				<div class="col-md-4">
					<input value="${pmDto.best}" id="best" name="best"  class="form-control input-md" type="checkbox">					
				</div>
			</div>

			<!-- File Button -->			
			<div class="form-group">
				<label for="product_img" class="col-md-4 control-label">상품 이미지는 수정이 불가능합니다. 삭제 후 다시 상품을 등록해주실 바랍니다.</label>
			</div>
			
			<div><img src="edit_thumbphoto?product_id=${pmDto.product_id}" width="60px"></div>
			<div><img src="edit_thumbhoverphoto?product_id=${pmDto.product_id}" width="60px"></div>
			<div><img src="edit_mainphoto?product_id=${pmDto.product_id}" width="60px"></div>
			<div><img src="edit_sub1photo?product_id=${pmDto.product_id}" width="60px"></div>
			<div><img src="edit_sub2photo?product_id=${pmDto.product_id}" width="60px"></div>
			<div><img src="edit_sub3photo?product_id=${pmDto.product_id}" width="60px"></div>
	 
			<!-- Button -->
			<button type="submit" class="btn btn-warning">수정</button>
			</fieldset>
		</form>
		</div> <!-- /add -->
		
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</div> <!-- wrapper -->	
</body>
</html>