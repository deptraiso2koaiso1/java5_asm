<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<style>
.form {
	display: flex;
	justify-content: center;
}

</style>
</head>
<body>
	<div class="site-wrap">
		<%@ include file="/WEB-INF/views/commons/header.jsp"%>
		<div class="container" style="margin-top: 10px;">
			<div class="row">
				<div class="col-sm-12 form">
					<c:forEach var="item" items="${items}">
						<div class="card" style="width: 18rem;">
							<img src="${item.image}" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">${item.name}</h5>
								<p class="card-text">${item.description}</p>
								<span class="badge bg-info badge-lg">$ ${item.price}</span>
								<a href="#" class="btn btn-primary">Add to cart</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>
</body>
</html>