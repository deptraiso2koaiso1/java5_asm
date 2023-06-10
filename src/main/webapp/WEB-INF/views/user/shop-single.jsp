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
							class="text-black">Shop</strong><span class="mx-2 mb-0">/</span>
						<strong class="text-black">${product.name}</strong>
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
							<strong class="text-primary h4">$${product.price }</strong>
						</p>

						<p>
							<a href="<c:url value="/cart/add/${product.id}"/> "
								class="buy-now btn btn-sm btn-primary">Add To Cart </a>
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