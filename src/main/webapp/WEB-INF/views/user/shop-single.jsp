<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
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
							class="text-black">Shop</strong><span class="mx-2 mb-0">/</span> <strong
							class="text-black">${product.name }</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img src="${product.image }" alt="Image" class="img-fluid">
					</div>
					<div class="col-md-6">
						<h2 class="text-black">${product.name}</h2>
						<p>${product.description }</p>
						<p>
							<strong class="text-primary h4">${product.price }</strong>
						</p>
						<div class="mb-1 d-flex">
							<label for="option-sm" class="d-flex mr-3 mb-3"> <span
								class="d-inline-block mr-2"
								style="top: -2px; position: relative;"><input
									type="radio" id="option-sm" name="shop-sizes"></span> <span
								class="d-inline-block text-black">Small</span>
							</label> <label for="option-md" class="d-flex mr-3 mb-3"> <span
								class="d-inline-block mr-2"
								style="top: -2px; position: relative;"><input
									type="radio" id="option-md" name="shop-sizes"></span> <span
								class="d-inline-block text-black">Medium</span>
							</label> <label for="option-lg" class="d-flex mr-3 mb-3"> <span
								class="d-inline-block mr-2"
								style="top: -2px; position: relative;"><input
									type="radio" id="option-lg" name="shop-sizes"></span> <span
								class="d-inline-block text-black">Large</span>
							</label> <label for="option-xl" class="d-flex mr-3 mb-3"> <span
								class="d-inline-block mr-2"
								style="top: -2px; position: relative;"><input
									type="radio" id="option-xl" name="shop-sizes"></span> <span
								class="d-inline-block text-black"> Extra Large</span>
							</label>
						</div>
						<div class="mb-5">
							<div class="input-group mb-3" style="max-width: 120px;">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary js-btn-minus"
										type="button">&minus;</button>
								</div>
								<input type="text" class="form-control text-center" value="1"
									placeholder="" aria-label="Example text with button addon"
									aria-describedby="button-addon1">
								<div class="input-group-append">
									<button class="btn btn-outline-primary js-btn-plus"
										type="button">&plus;</button>
								</div>
							</div>

						</div>
						<p>
							<a href="cart.html" class="buy-now btn btn-sm btn-primary">Add
								To Cart</a>
						</p>

					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/commons/featured.jsp"%>

		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>



</body>
</html>