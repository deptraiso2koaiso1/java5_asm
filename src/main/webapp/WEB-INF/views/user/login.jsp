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
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<style>
* {
	text-decoration: none;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/commons/header.jsp"%>
	<div class="col-md-6 col-lg-4 offset-lg-4 offset-md-3 mt-5">
		<div class="bg-light p-5 border shadow">
			<!-- Login Form -->
			<form>
				<h1 class="text-center">Welcome</h1>
				<div class="mb-4">
					<input name="username" type="text" class="form-control" placeholder="Username">
				</div>
				<div class="mb-4">
					<input name="password" type="password" class="form-control" placeholder="Password">
				</div>
				<div class="mb-4 form-check w-100" style="display: flex">
					<label style="display: inline-block;" class="form-check-label"> <input type="checkbox"
						class="form-check-input"> Remember Me
					</label> 
				</div>


				<button type="submit" class="btn btn-primary w-100 my-3 shadow">Login</button>
				<p class="text-center m-0">
					Haven't an account? <a href="/sign-up"> Sign up!</a>
				</p>
			</form>
			<!-- Login Form -->
		</div>
	</div>
	<br>
	<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
</body>
</html>