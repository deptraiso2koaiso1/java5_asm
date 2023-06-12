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
<title>Account</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/commons/admin.jsp"%>
			<div class="col-10 px-0">
					<nav class="navbar navbar-expand-lg shadow-sm"
					style="background-color: #ffffff">
<<<<<<< HEAD
					<%@ include file="/WEB-INF/views/commons/navadmin.jsp"%>
=======
					<div class="container-fluid">
						<button class="navbar-toggler" type="button">
							
						</button>
						<div class="collapse navbar-collapse" id="navbarText">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							</ul>
							 <span class="navbar-text" id="dropAccount" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">
								 <sec:authorize access="isAuthenticated()">
									<span> Welcome, ${user.name}!
									</span>
								</sec:authorize> <i class="fa-solid fa-user fs-4"></i>
							</span> 
							<ul class="dropdown-menu" aria-labelledby="dropAccount"
								style="left: auto; right: 10px">
								<li><a class="dropdown-item" href="/home">Home</a></li>
								<li><a class="dropdown-item" href="/logout">Log out</a></li>
							</ul>
						</div>
					</div>
>>>>>>> 484079f24053522728b8379cba22cdc4e630e03a
				</nav>
				<div class="bg-light p-3">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="/admin">Admin</a></li>
							<li class="breadcrumb-item active" aria-current="page">Accounts</li>
						</ol>
					</nav>
				</div>
				<div class="px-4 p-3">
					<div class="row">
						<div class="col-3">
							<button class="btn btn-info text-white" data-bs-toggle="modal"
								data-bs-target="#modalAdd">Add new</button>
							<!-- Modal add -->
							<div class="modal fade" id="modalAdd" data-bs-backdrop="static"
								data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">Add a
												new account</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form:form action="/admin/accounts/store" method="post"
												modelAttribute="account" name="account_form">
												<div>
													<label>Full name</label>
													<form:input path="name" class="form-control" />

												</div>
												<div>
													<label>Email</label>
													<form:input path="email" type="email" class="form-control" />

												</div>
												<div>
													<label>User name</label>
													<form:input path="username" class="form-control" />

												</div>
												<div>
													<label>Password</label>
													<form:password path="password" class="form-control" />

												</div>
												<div>
													<label>Address</label>
													<form:input path="address" class="form-control"
														 />

												</div>
												<div>
													<label>Phone</label>
													<form:input path="phone" class="form-control"
														 />

												</div>
												<div>
													<label>Admin</label>
													<form:select path="is_admin" class="form-select"
														name="admin">
														<form:option value="0">Member</form:option>
														<form:option value="1">Admin</form:option>
													</form:select>
												</div>
												<button class="btn btn-primary w-100 mt-3" id="liveToastBtn"
													type="submit">Add</button>
												<div class="position-fixed top-0 end-0 p-5"
													style="z-index: 11">
													<div style="background-color: #2ecc71" id="liveToast"
														class="toast align-items-center text-white border-0"
														role="alert" aria-live="assertive" aria-atomic="true">
														<div class="d-flex">
															<div class="toast-body">Successful !</div>
															<button type="button"
																class="btn-close btn-close-white me-2 m-auto"
																data-bs-dismiss="toast" aria-label="Close"></button>
														</div>
													</div>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-3 offset-6">
							<a type="button" class="btn btn-primary"
								href="/admin/account/excel"> <i
								class="fa-solid fa-file-excel"></i> <span>Export to excel</span>
							</a>
						</div>
						<div class="table-responsive mt-5" style="overflow-x: auto">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Full name</th>
										<th>User name</th>
										<th>Email</th>
										<th>Address</th>
										<th>phone</th>
										<th>Role</th>
										<th colspan="2">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ data }" var="acc">
										<tr>
											<td>${ acc.id }</td>
											<td>${ acc.name }</td>
											<td>${ acc.username }</td>
											<td>${ acc.email }</td>
											<td>${ acc.address }</td>
											<td>${ acc.phone }</td>
											<td>${ acc.is_admin ? "Admin" : "Member" }</td>
											<td class="text-center">
												<button class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#modalUpdate_${acc.id }">
													<i class="fa-solid fa-pen-to-square"></i>
												</button> <!-- Modal update -->
												<div class="modal fade" id="modalUpdate_${acc.id}"
													data-bs-backdrop="static" data-bs-keyboard="false"
													tabindex="-1" aria-labelledby="staticBackdropLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header bg-info">
																<h5 class="modal-title text-white"
																	id="staticBackdropLabel">Update a account</h5>
																<button type="button" class="btn"
																	data-bs-dismiss="modal" aria-label="Close">
																	<i class="fa-solid fa-xmark fs-5 text-white"></i>
																</button>
															</div>
															<div class="modal-body">
																<form:form action="/admin/accounts/update/${ acc.id }"
																	method="post" modelAttribute="account">
																	<div style="text-align: left;">
																		<label>Full name</label>
																		<form:input path="name" class="form-control"
																			value="${ acc.name }" />
																	</div>
																	<div style="text-align: left;">
																		<label>Email</label>
																		<form:input path="email" type="email"
																			class="form-control" value="${ acc.email }" />
																	</div>
																	<div style="text-align: left;">
																		<label>User name</label>
																		<form:input path="username" class="form-control"
																			value="${ acc.username }" />
																	</div>
																	<div style="text-align: left;">
																		<label>Pass word</label>
																		<form:input path="password" class="form-control"
																			value="${ acc.password }" />
																	</div>
																	<div style="text-align: left;">
																		<label>Address</label>
																		<form:input path="address" class="form-control"
																			value="${ acc.address }" />
																	</div>
																	<div style="text-align: left;">
																		<label>Phone</label>
																		<form:input path="phone" class="form-control"
																			value="${ acc.phone }" />
																	</div>
																	<div style="text-align: left;">
																		<label>Admin</label>
																		<form:select path="is_admin" class="form-select">
																			<form:option value="0"
																				selected="${ acc.is_admin == False ? 'true' : 'false' }">Member</form:option>
																			<form:option value="1"
																				selected="${ acc.is_admin == True ? 'true' : 'false' }">Admin</form:option>
																		</form:select>
																	</div>
																	<button class="btn btn-primary w-100 mt-3"
																		id="liveToastBtn">Update</button>
																	<div class="position-fixed top-0 end-0 p-5"
																		style="z-index: 11">
																		<div style="background-color: #2ecc71" id="liveToast"
																			class="toast align-items-center text-white border-0"
																			role="alert" aria-live="assertive" aria-atomic="true">
																			<div class="d-flex">
																				<div class="toast-body">Successful !</div>
																				<button type="button"
																					class="btn-close btn-close-white me-2 m-auto"
																					data-bs-dismiss="toast" aria-label="Close"></button>
																			</div>
																		</div>
																	</div>
																</form:form>
															</div>
														</div>
													</div>
												</div>
											</td>
											<td class="text-center">
												<button class="btn btn-danger" data-bs-toggle="modal"
													data-bs-target="#modalDelte_${acc.id }">
													<i class="fa-solid fa-trash-can"></i>
												</button> <!-- Modal delete -->
												<div class="modal fade" id="modalDelte_${acc.id}"
													data-bs-backdrop="static" data-bs-keyboard="false"
													tabindex="-1" aria-labelledby="staticBackdropLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header bg-danger">
																<h5 class="modal-title text-white"
																	id="staticBackdropLabel">Delete a account !</h5>
																<button type="button" class="btn"
																	data-bs-dismiss="modal" aria-label="Close">
																	<i class="fa-solid fa-xmark fs-5 text-white"></i>
																</button>
															</div>
															<div class="modal-body" style="background-color: #fff2df">
																<p>Warning : You are trying a account. This account
																	will be permanently deleted !</p>
																<a role="button"
																	href="/admin/accounts/delete/${ acc.id }"
																	class="btn btn-danger w-100 "> Delete </a>
															</div>
														</div>
													</div>
												</div>
											</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var option = {
			animation : true,
			delay : 5000
		};
		document.getElementById("liveToastBtn").onclick = function() {
			var myAlert = document.getElementById("liveToast");
			var bsAlert = new bootstrap.Toast(myAlert, option);
			bsAlert.show();
		};

		$(function() {
			/*  Submit form using Ajax */
			$('button[type=submit]').click(
					function(e) {
						//Prevent default submission of form
						e.preventDefault();
						//Remove all errors
						$('input').next().remove();
						$.post({
							url : 'save',
							data : $('form[name=account_form]').serialize(),
							success : function(res) {
								if (res.isValidated) {
									// success
									$('input').closest('div.form-control')
											.removeClass('has-error');
								} else {
									//Set error messages
									$.each(res.errorMessages, function(key,
											value) {
										$('input[name=' + key + ']').after(
												'<span class="help-block">'
														+ value + '</span>');
										$('input[name=' + key + ']').closest(
												'div.form-control').addClass(
												'has-error');
									});
								}
							}
						})
					});

		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>