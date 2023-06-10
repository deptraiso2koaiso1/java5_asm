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
													<td>
														<form action="/cart/update/${prod.value.product.id}"
															method="get">
															<input type="text" name="quantity"
																value="${prod.value.quantity}" style="width: 30px;">
															<button class="btn btn-primary btn-sm" type="submit">Update</button>
														</form>
													</td>
													<td>${totalPrice}</td>
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
											href="<c:url value="/user/shop"> </c:url>">Continue
											shopping!</a>
									</h3>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>

<<<<<<< HEAD
				<div class="row">
					<c:if test="${not empty cart}">
						<div class="col-md-6">
							<div class="row mb-5">
								<div class="col-md-6 mb-3 mb-md-0">
									<a type="button" href="/cart/clear"
										class="btn btn-primary btn-sm btn-block">Clear Cart</a>
								</div>
								<div class="col-md-6">
									<a type="button" href="/user/shop"
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
											<h3 class="text-black h4 text-uppercase">Cart Totals</h3>
										</div>
									</div>
=======
	<%@ include file="/WEB-INF/views/commons/header.jsp" %>
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Product</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-total">Total</th>
                    <th class="product-remove">Remove</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="product-thumbnail">
                      <img src="/images/img/cloth_1.jpg" alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black">Top Up T-Shirt</h2>
                    </td>
                    <td>$49.00</td>
                    <td>
                      <div class="input-group mb-3" style="max-width: 120px;">
                        <div class="input-group-prepend">
                          <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                        </div>
                        <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                        <div class="input-group-append">
                          <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                        </div>
                      </div>

                    </td>
                    <td>$49.00</td>
                    <td><a href="#" class="btn btn-primary btn-sm">X</a></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                <button class="btn btn-primary btn-sm btn-block">Update Cart</button>
              </div>
              <div class="col-md-6">
                <button class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</button>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Coupon</label>
                <p>Enter your coupon code if you have one.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-sm">Apply Coupon</button>
              </div>
            </div>
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">Subtotal</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">$230.00</strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">$230.00</strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg py-3 btn-block" onclick="window.location='/user/cart/checkout'">Proceed To Checkout</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<%@ include file="/WEB-INF/views/commons/footer.jsp" %>
  </div>
>>>>>>> lam


									<div class="row mb-5">
										<div class="col-md-6">
											<span class="text-black">Item</span>
										</div>
										<div class="col-md-6 text-right">
											<strong class="text-black">${totalQuantity}</strong>
										</div>
									</div>
									<div class="row mb-5">
										<div class="col-md-6">
											<span class="text-black">Order Total</span>
										</div>
										<div class="col-md-6 text-right">
											<strong class="text-black">$${totalPrice}</strong>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">

											<a type="button"
												class="btn btn-primary btn-lg py-3 btn-block"
												href="<c:url value="/cart/checkout"/>">Proceed To
												Checkout</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>
	<script>
		$(document).ready(function() {
			// Xử lý sự kiện khi thay đổi giá trị của trường số lượng
			$('input[name="quantity"]').on('change', function() {
				var itemId = $(this).data('itemid');
				var itemPrice = $(this).data('itemprice');
				var quantity = $(this).val();
				var total = itemPrice * quantity;

				// Cập nhật giá trị mới cho thẻ hiển thị giá tiền của mặt hàng tương ứng
				$('#itemTotal-' + itemId).text(total);

				// Tính tổng số tiền và cập nhật giá trị trong thẻ <label>
				var sum = 0;
				$('input[name="quantity"]').each(function() {
					var price = $(this).data('itemprice');
					var qty = $(this).val();
					sum += price * qty;
				});
				$('#totalLabel').text(sum);
			});
		});
	</script>
</body>
</html>
