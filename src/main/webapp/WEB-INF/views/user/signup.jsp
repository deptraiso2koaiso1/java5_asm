<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sign up</title>
<head>
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
						<li><a href="/home"> Home</a></li>
						<li><a href="#">About us</a></li>
						<li><a href="/shop"> Shop</a></li>
						<li><a href="#"> New Arrivals</a></li>
						<li><a href="#"> Contact</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<div class="bg-light py-3">
			<section class="vh-100" style="background-color: #eee;">
				<div class="container h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-lg-12 col-xl-11">
							<div class="card text-black" style="border-radius: 25px;">
								<div class="card-body p-md-5">
									<div class="row justify-content-center">
										<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
											<p class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-4">Sign
												up</p>
											<p class="text-center text-danger">${message}</p>
											<form:form method="POST"
												action="${pageContext.request.contextPath}/signup"
												modelAttribute="user">
												<div class="mb-4">
													<form:input path="name" type="text" class="form-control"
														placeholder="Fullname" />
												</div>
												<div class="mb-4">
													<form:input path="phone" type="text" class="form-control"
														placeholder="Phone Number" />
												</div>
												<div class="mb-4">
													<form:input path="email" type="text" class="form-control"
														placeholder="Email" />
												</div>
												<div class="mb-4">
													<form:input path="address" type="text" class="form-control"
														placeholder="Address" />
												</div>
												<div class="mb-4">
													<form:input path="username" type="text"
														class="form-control" placeholder="Username" />
												</div>
												<div class="mb-4">
													<form:input path="password" type="password"
														class="form-control" placeholder="Password" />
												</div>
												<div class="mb-4">
													<input type="password" name="confirm"
														placeholder="Confirm your password" class="form-control" />
												</div>
												<button type="submit"
													class="btn btn-primary w-100 my-3 shadow">Login</button>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>

</body>
</html>