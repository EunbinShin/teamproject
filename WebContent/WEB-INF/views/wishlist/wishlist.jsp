<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
<title>SAGI</title>
	<link rel="icon" href="/html_css_javaspring/resource/img/logo/logo_fapicon.png">
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/wishlist.css?after" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	</head>
	
<c:if test="${loginStatus == null}" >
<h3 style="center">회원이 아닙니다</h3>
<a class="btn btn-danger btn-sm" href="<%=application.getContextPath()%>/">홈으로 돌아가기</a>
</c:if>



<c:if test="${loginStatus != null}">
<body>
	<div class="container">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-md-9">
					<div class="ibox">
						<div class="ibox-title">
							<span class="pull-right">(<strong>3</strong>) items
							</span>
							<h5>좋아요</h5>
						</div>
						<div class="ibox-content">
							<div class="table-responsive">
								<table class="table shoping-cart-table">
									<tbody>
										<tr>
											<td width="90">
												<div class="cart-product-imitation">
													<img src="<%=application.getContextPath()%>/resources/img/img01-1.jpg">
												</div>
											</td>
											<td class="desc">
												<h3>
													<a href="#" class="text-navy"> 이름 </a>
												</h3>
												<p class="small">질 좋은 전기주전자입니다</p>
												<dl class="small m-b-none">
													<dt>상태</dt>
													<dd>A 급 전기주전자입니다</dd>
												</dl>

												<div class="m-t-sm">
													<a href="#" class="text-muted"><i class="fa fa-gift"></i>
														장바구니 추가</a> | <a href="#" class="text-muted"><i
														class="fa fa-trash"></i> 제거</a>
												</div>
											</td>

											<td>21000</td>
											<td width="65"><input type="text" class="form-control"
												placeholder="1"></td>
											<td>
												<h4> 1</h4>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="ibox-content">
							<div class="table-responsive">
								<table class="table shoping-cart-table">

									<tbody>
										<tr>
											<td width="90">
												<div class="cart-product-imitation">
													<img src="<%=application.getContextPath()%>/resources/img/img02-1.jpg">
												</div>
											</td>
											<td class="desc">
												<h3>
													<a href="#" class="text-navy"> 유리 </a>
												</h3>
												<p class="small">질 좋은 유리입니다.</p>
												<dl class="small m-b-none">
													<dt>상태</dt>
													<dd>A 급 유리입니다</dd>
												</dl>

												<div class="m-t-sm">
													<a href="#" class="text-muted"><i class="fa fa-gift"></i>
														장바구니 추가</a> | <a href="#" class="text-muted"><i
														class="fa fa-trash"></i> 제거</a>
												</div>
											</td>

											<td>$130,00</td>
											<td width="65"><input type="text" class="form-control"
												placeholder="1"></td>
											<td>
												<h4>$130,00</h4>
											</td>

										</tr>
									</tbody>
								</table>
							</div>

						</div>
						<div class="ibox-content">
							<div class="table-responsive">
								<table class="table shoping-cart-table">

									<tbody>
										<tr>
											<td width="90">
												<div class="cart-product-imitation">
													<img src="<%=application.getContextPath()%>/resources/img/img03-1.jpg">
												</div>
											</td>
											<td class="desc">
												<h3>
													<a href="#" class="text-navy"> 받침대 </a>
												</h3>
												<p class="small">질 좋은 받침대 입니다.</p>
												<dl class="small m-b-none">
													<dt>상태</dt>
													<dd>A 급 받침대 입니다</dd>
												</dl>
												<div class="m-t-sm">
													<a href="#" class="text-muted"><i class="fa fa-gift"></i>
														장바구니 추가</a> | <a href="#" class="text-muted"><i
														class="fa fa-trash"></i> 제거</a>
												</div>
											</td>
											<td>$700,00</td>
											<td width="65"><input type="text" class="form-control"
												placeholder="1"></td>
											<td>
												<h4>$70,00</h4>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="ibox-content">
							<button class="btn btn-secondary pull-right"
								onclick="location.href='/teamproject/buy/buy_product'">
								<i class="fa fa fa-shopping-cart"></i> 구매
							</button>
							<button class="btn btn-white" 
								onclick="window.close();">
								<i class="fa fa-arrow-left"></i> 쇼핑몰로 돌아가기
							</button>
							
						</div>
					</div>

				</div>
				<div class="col-md-3">
					<div class="ibox">
						<div class="ibox-title">
							<h5>좋아요 요약</h5>
						</div>
						<div class="ibox-content">
							<span> 총합 </span>
							<h3 class="font-bold">$200,00 + 15,000</h3>

							<hr>
							<span class="text-muted small"> * 3만원 이상 무료배송 </span>
							<div class="m-t-sm">
								<div class="btn-group">
									<a href="#" class="btn btn-secondary btn-sm"><i
										class="fa fa-shopping-cart"></i> 구매 </a> <a href="#"
										class="btn btn-white btn-sm"> 취소 <i class="fa fa-ban"
										aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="ibox">
						<div class="ibox-title">
							<h5>광고</h5>
						</div>
						<div class="ibox-content text-center">
							<h3>
								<i class="fa fa-phone"></i> 0507-1319-0273
							</h3>
							<span class="small"> 회기 최고의 치킨집 좋수닭 </span>
						</div>
					</div>

					<div class="ibox">
						<div class="ibox-content">

							<p class="font-bold">추천상품</p>
							<hr>
							<div>
								<a href="#" class="product-name"> 상품1</a>
								<div class="cart-product-imitation">
									<img src="<%=application.getContextPath()%>/resources/img/img04-1.jpg">
								</div>
								<div class="small m-t-xs">트리</div>
								<div class="m-t text-righ">

									<a href="/html_css_javaspring/item_detail/product04.html"
										class="btn btn-secondary btn-xs">상품 보러가기 <i
										class="fas fa-heart"></i>
									</a>
								</div>
							</div>
							<hr>
							<div>
								<a href="#" class="product-name"> 상품2</a>
								<div class="cart-product-imitation">
									<img src="<%=application.getContextPath()%>/resources/img/img03-1.jpg">
								</div>
								<div class="small m-t-xs">받침대</div>
								<div class="m-t text-righ">
									<a href="/html_css_javaspring/item_detail/product03.html"
										class="btn btn-secondary btn-xs">상품 보러가기 <i
										class="fas fa-heart"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div id="left">
			Copyright ⓒ 신은빈 원지영 이영준. All rights reserved. <br />designed by
			EunBin SHIN
		</div>
		<div id="right">
			(우)05717<br /> 서울특별시 송파구 중대로 135 12층
		</div>
	</footer>
</body>
</c:if>
</html>