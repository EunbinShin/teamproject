<%@ page  contentType="text/html; charset=UTF-8"%>

<script>
	price_Calc = function(){
		var oriprice = Number(document.getElementById("product_price").value);
		var sales = Number(document.getElementById("percentage_discount").value) / 100;
		
		if(sales > 0.99) {
			alert("할인율은 최대 99%입니다")
			document.getElementById("percentage_discount").value = 99;
		} else {
			var sellp = oriprice - (oriprice * sales);
			document.getElementById("selling_price").value = sellp.toFixed(0);
		}
	}
</script>


<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label">상품 가격</label>  
	<div class="col-md-4">
	<input id="product_price" name="product_price" placeholder="상품 가격 " class="form-control input-md" type="number" step="1000">
		
	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label">상품 할인율</label>  
	<div class="col-md-4">
	<input onkeyup="price_Calc()"  id="percentage_discount" name="percentage_discount" placeholder="상품 할인율" class="form-control input-md" type="number" 
	step="10" min="0" max="100">	
	</div>
</div>


<!-- Text input-->
<div class="form-group">				
	<label class="col-md-4 control-label">상품 판매가 (할인 적용) </label>  
	
	<div class="col-md-4">
	<input readonly id="selling_price" name="selling_price" value ="selling_price" class="form-control input-md" type="number">
</div>
	
</div>
