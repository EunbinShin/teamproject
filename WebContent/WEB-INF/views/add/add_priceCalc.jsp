<%@ page  contentType="text/html; charset=UTF-8"%>

<div class="col-md-4">
	<input readonly id="selling_price" name="selling_price" value ="selling_price" class="form-control input-md" type="number">
	<script>
		price_Calc = function(){
		var oriprice = Number(document.getElementById("product_price").value);
		var sales = Number(document.getElementById("percentage_discount").value) / 100;
		var sellp = oriprice - (oriprice * sales);
		document.getElementById("selling_price").value = sellp.toFixed(0);
		}
	</script>
</div>