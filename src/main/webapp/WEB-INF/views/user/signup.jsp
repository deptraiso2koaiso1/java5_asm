<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<title>Sign up</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<style>
* {
	text-decoration: none;
}
</style>
<body>

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
						
					</div>
				</div>

			</div>
		</div>
	</div>
	<nav class="site-navigation text-right text-md-center"
		role="navigation">
		<div class="container">
			<ul class="site-menu js-clone-nav d-none d-md-block">
				<li class="has-children active"><a href="/home"> Home</a></li>
				<li class="has-children"><a href="">About us</a></li>
				<li><a href="/shop"> Shop</a></li>
				<li><a href=""> New Arrivals</a></li>
				<li><a href=""> Contact</a></li>
			</ul>
		</div>
	</nav>
</header>
	<div class="col-md-6 col-lg-4 offset-lg-4 offset-md-3 mt-5">
		<div class="bg-light p-5 border shadow">
			<!-- Login Form -->
			<h1 class="text-center">Sign Up</h1>
			<p class="text-danger">${message}</p>
			<form:form method="post" action="/signup"
				modelAttribute="user" >
				<div class="mb-4" class="form-control">
					<form:input path="name" cssClass="form-control" required="true" placeholder="Fullname"/>
				</div>
				<div class="mb-4">
					<form:input path="address" cssClass="form-control" required="true" placeholder="Address"/>
				</div>
				<div class="mb-4">
					<form:input path="phone" cssClass="form-control" required="true" placeholder="Phone"/>
				</div>
				<div class="mb-4">
					<form:input path="email" cssClass="form-control" required="true" placeholder="Email"/>
				</div>
				<div class="mb-4">
					<form:input path="username" cssClass="form-control" required="true" placeholder="Username"/>
				</div>
				<div class="mb-4">
					<form:input path="password" type="password" cssClass="form-control" required="true" placeholder="Password" />
				</div>
				<div class="mb-4">
					<input name="confirm" type="password" required class="form-control"
						placeholder="Confirm password" />
				</div>
				<button type="submit" class="btn btn-primary w-100 my-3 shadow">Sign up</button>
			</form:form>
			<p class="text-center m-0">
				Have an account? <a href="/login"> Sign in!</a>
			</p>
		</div>
	</div>
	<br>
	<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
</body>
</html>