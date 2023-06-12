<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/public/images/logo-ico.svg" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Bee Shop Admin</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/commons/admin.jsp"%>
			<div class="col-10 px-0">
				<nav class="navbar navbar-expand-lg shadow-sm"
					style="background-color: #ffffff">
					<%@ include file="/WEB-INF/views/commons/navadmin.jsp"%>
				</nav>
				<div class="row m-0 p-5 g-3">
					<div class="col-3">
						<div class="card bg-info rounded">
							<div class="card-header text-white">Total account</div>
							<div class="card-body">
								<p class="text-white">${ totalAcc }</p>
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="card bg-primary rounded">
							<div class="card-header text-white">Total product</div>
							<div class="card-body">
								<p class="text-white">${ totalPro }</p>
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="card bg-success rounded">
							<div class="card-header text-white">Total order</div>
							<div class="card-body">
								<p class="text-white">${ totalOrder }</p>
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="card bg-danger rounded">
							<div class="card-header text-white">Total payment</div>
							<div class="card-body">
								<p class="text-white">${ totalPayment }</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>