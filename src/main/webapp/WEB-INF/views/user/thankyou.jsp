<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row align-items-center">
						<div
							class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
						</div>
						<div
							class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
							<div class="site-logo">
								<a href="/home" class="js-logo-clone">Shoppers</a>
							</div>
						</div>
						<div class="col-6 col-md-4 order-3 order-md-3 text-right">
							<div class="site-top-icons">
								<ul>
									<li>Hi! ${user.name} |</li>
									<li><a href="/logout">Log out</a></li>
									<li><a href="/cart" class="site-cart"> <span
											class="icon icon-shopping_cart"></span> <span class="count">${cart.size()}</span>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav class="site-navigation text-right text-md-center"
				role="navigation">
				<div class="container">
					<ul class="site-menu js-clone-nav d-none d-md-block">
						<li class=""><a href="/home"> Home</a></li>
						<li class=""><a href="">About us</a></li>
						<li><a href="/shop"> Shop</a></li>
						<li><a href=""> New Arrivals</a></li>
						<li><a href=""> Contact</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="/home">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Contact</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<span class="icon-check_circle display-3 text-success"></span>
						<h2 class="display-3 text-black">Thank you!</h2>
						<p class="lead mb-5">Your order has been recorded and we hope
							you have good experience!</p>
						<p>
							<a href="/home" class="btn btn-sm btn-primary">Back to
								shop</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>
</body>

