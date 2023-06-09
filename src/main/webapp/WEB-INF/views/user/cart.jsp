<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoppers</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
</head>
<body>
	<div class="site-wrap">
		<%@ include file="/WEB-INF/views/commons/header.jsp"%>
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Cart</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<form class="col-md-12" method="post">
						<div class="site-blocks-table">
							<c:choose>
								<c:when test="${not empty product}">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="product-thumbnail">Image</th>
												<th class="product-name">Product</th>
												<th class="product-price">Price</th>
												<th class="product-quantity">Quantity</th>
												<th class="product-total">Total</th>
												<th class="product-remove"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cart}" var="prod">
												<tr>
													<td><img src="${prod.value.product.image}"
														width="130px" height="130px"></td>
													<td>${prod.value.product.name}</td>
													<td>${prod.value.product.price}</td>
													<td><input type="number" min="0" max="5"
														value="${prod.value.quantity}"
														onchange="updateCartItem(${prod.value.product.id}, this.value)">

													</td>


													<td>${prod.value.getTotalPrice()}</td>
													<td><a
														href="<c:url value = "/cart/remove/${prod.value.product.id}"/>">Remove</a></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</c:when>
								<c:otherwise>
									<h3 class="text-center">
										Oops! You haven't any product in cart. <a
											href="<c:url value="/shop"> </c:url>">Continue
											shopping!</a>
									</h3>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>


				<div class="row">
					<c:if test="${not empty cart}">
						<div class="col-md-6">
							<div class="row mb-5">
								<div class="col-md-6 mb-3 mb-md-0">
									<a type="button" href="/cart/clear"
										class="btn btn-primary btn-sm btn-block">Clear Cart</a>
								</div>
								<div class="col-md-6">
									<a type="button" href="/shop"
										class="btn btn-outline-primary btn-sm btn-block">Continue
										Shopping</a>
								</div>
							</div>
						</div>
						<div class="col-md-6 pl-5">
							<div class="row justify-content-end">
								<div class="col-md-7">
									<div class="row">
										<div class="col-md-12 text-right border-bottom mb-5">
											<h3 class="text-black  text-uppercase">Cart Totals</h3>
										</div>
									</div>
								<div class="row">
									<div class="col-sm-6">
										<span class="text-black">Item</span>
									</div>
									<div class="col-sm-6 text-right">
										<strong class="text-black">${sessionScope.totalQuantity}</strong>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<span class="text-black">Order Total</span>
									</div>
									<div class="col-sm-6 text-right">
										<strong class="text-black">$${totalPrice}</strong>
									</div>
								</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<a type="button" class="btn btn-primary btn-lg py-3 btn-block"
											href="<c:url value="/cart/getCustomer"/>">Proceed To
											Checkout</a>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	<script>
	function updateCartItem(productId, newQuantity) {
		  $.ajax({
		    url: "/cart/update/" + productId + "/" + newQuantity,
		    type: "POST",
		    success: function(response) {
		      // update the corresponding row's price on the page
		      var rowId = "row-" + productId;
		      $("#" + rowId + " .item-total-price").text(response.itemTotalPrice);

		      // update the total price on the frontend
		      $("#total-price").text(response.totalPrice);
		    }
		  });
		}


</script>
</body>
</html>
