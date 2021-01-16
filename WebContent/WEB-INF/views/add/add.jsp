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
	</script>
	
</head>

<body>
	<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
	
	<div class="add">
		<form method= "post" enctype="multipart/form-data" action="add_upload" class="form-horizontal">
			<fieldset>
			
			<!-- Form Name -->
			<legend id="form-name">제품 등록</legend>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="product_id">상품 코드</label>
				<div class="col-md-4">
					<input id="product_id" name="product_id" placeholder="상품 코드" class="form-control input-md"  type="text">
				</div>
			</div>
			
			<!-- Select Basic -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="product_categorie">상품 카테고리</label>
				<div class="col-md-4">
					<select id="product_categorie" name="product_categorie" class="form-control">
						<option value="">상품 카테고리</option>
						<option value="texnolog1">은식기 </option>
						<option value="texnolog2">나무식기 2</option>
						<option value="texnolog3">무쇠  3</option>
					</select>
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="product_name">상품명</label>
				<div class="col-md-4">
					<input id="product_name" name="product_name" placeholder="상품명" class="form-control input-md" required="" type="text">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="product_name_fr">상품 가격</label>  
				<div class="col-md-4">
					<input id="product_price" name="product_price" placeholder="상품 가격 " class="form-control input-md" required="" type="number">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="percentage_discount">상품 할인율</label>  
				<div class="col-md-4">
					<input id="percentage_discount" name="percentage_discount" placeholder="상품 할인율" class="form-control input-md" required="" type="number">
				</div>
			</div>
			
			<!-- Textarea -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="product_description">상품 설명</label>
				<div class="col-md-4">                     
					<textarea class="form-control" id="product_description" name="product_description"></textarea>
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="available_quantity">주문 가능 수량</label>  
				<div class="col-md-4">
					<input id="available_quantity" name="available_quantity" placeholder="주문 가능 수량" class="form-control input-md" required="" type="number">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="online_date">상품 개시일</label>  
				<div class="col-md-4">
					<input id="online_date" name="online_date" placeholder="ONLINE DATE" class="form-control input-md" required="" type="date">
				</div>
			</div>	
			    
			<!-- File Button --> 
			<div class="form-group" style="margin-bottom:50px;">
				<label class="col-md-4 control-label" for="filebutton">메인 이미지</label>
				<div class="col-md-4">
					<input type = "file" onchange="readURL(this);" />
					<input id="main_button" src="http://placehold.it/180" name="main_button" class="input-file" style=""/>   
				</div>
			</div>
			
			<script type="text/javascript">
			   function readURL(input) {
		           if (input.files && input.files[0]) {
		               var reader = new FileReader();

		               reader.onload = function (e) {
		                   $('#main_button')
		                       .attr('src', e.target.result);
		               };

		               reader.readAsDataURL(input.files[0]);
		           }
		       }
			</script>
			
			<div class="form-group">
				
			</div>
			
			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="singlebutton"></label>
				<div class="col-md-4">
					<button onclick="myFunction()" id="singlebutton" name="singlebutton" class="btn btn-secondary">등록</button>
					
				<script>
					function myFunction(){
						confirm("상품을 등록하겠습니까?");
						}
				</script>
				</div>
			</div>
			</fieldset>
		</form>
		</div> <!-- /add -->
		
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</div> <!-- wrapper -->	
</body>
</html>