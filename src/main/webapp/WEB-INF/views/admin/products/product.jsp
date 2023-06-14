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
<title>Product</title>
</head>
<style>
.dots {
	display: inline-block;
	width: 180px;
	height: auto;
	white-space: nowrap;
	overflow: hidden !important;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/commons/admin.jsp"%>
			<div class="col-10 px-0">
					<nav class="navbar navbar-expand-lg shadow-sm"
					style="background-color: #ffffff">
					<%@ include file="/WEB-INF/views/commons/navadmin.jsp"%>
				</nav>
				<div class="bg-light p-3">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="/admin">Admin</a></li>
							<li class="breadcrumb-item active" aria-current="page">Products</li>
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
												new product</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form:form action="/admin/products/store" method="post"
												modelAttribute="product">
												<div>
													<label>Name</label>
													<form:input path="name" class="form-control" />
												</div>
												<div>
													<label>Descriptions</label>
													<form:input path="description" class="form-control" />
												</div>
												<div>
													<label>Price</label>
													<form:input path="price" class="form-control" />
												</div>
												<div>
													<label>Image</label>
													<form:input path="image" class="form-control" />
												</div>
												<div>
													<label>Brand</label>
													<form:select path="brand" class="form-select">
														<c:forEach items="${ listBrand }" var="brand">
															<form:option value="${ brand.id }">
																${ brand.name }
															</form:option>
														</c:forEach>
													</form:select>
												</div>
												<div>
													<label>Category ID</label>
													<form:select path="category" class="form-select">
														<c:forEach items="${ listCate }" var="cate">
															<form:option value="${ cate.id }">
																${ cate.name }
															</form:option>
														</c:forEach>
													</form:select>
												</div>
												<button class="btn btn-primary w-100 mt-3" id="liveToastBtn">Add</button>
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
								href="/admin/product/excel"> <i
								class="fa-solid fa-file-excel"></i> <span>Export to excel</span>
							</a>
						</div>
						<div class="table-responsive mt-5" style="overflow-x: auto">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Price</th>
										<th>Image</th>
										<th>Brand</th>
										<th>Descriptions</th>
										<th>Category ID</th>
										<th colspan="2">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ products }" var="pro">
										<tr>
											<td>${ pro.id }</td>
											<td>${ pro.name }</td>
											<td>${ pro.price }</td>
											<td><img alt="${ pro.image }" src="${ pro.image }"
												width="50" height="50"></td>
											<td>${ pro.brand.name }</td>
											<td class="dots">${ pro.description }</td>
											<td>${ pro.category.name }</td>
											<td>
												<button class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#modalUpdate_${pro.id }">
													<i class="fa-solid fa-pen-to-square"></i>
												</button> <!-- Modal update -->
												<div class="modal fade" id="modalUpdate_${pro.id}"
													data-bs-backdrop="static" data-bs-keyboard="false"
													tabindex="-1" aria-labelledby="staticBackdropLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header bg-info">
																<h5 class="modal-title text-white"
																	id="staticBackdropLabel">Update a product</h5>
																<button type="button" class="btn"
																	data-bs-dismiss="modal" aria-label="Close">
																	<i class="fa-solid fa-xmark fs-5 text-white"></i>
																</button>
															</div>
															<div class="modal-body">
																<form:form action="/admin/products/update/${ pro.id }"
																	method="post" modelAttribute="product">
																	<div>
																		<label>Name</label>
																		<form:input path="name" class="form-control"
																			value="${ pro.name }" />
																	</div>
																	<div>
																		<label>Price</label>
																		<form:input path="price" class="form-control"
																			value="${ pro.price }" />
																	</div>
																	<div>
																		<label>Image</label>
																		<form:input path="image" class="form-control"
																			value="${ pro.image }" />
																	</div>
																	<div>
																		<label>Brand</label>
																		<form:select path="brand" class="form-select">
																			<c:forEach items="${ listBrand }" var="brand">
																				<form:option value="${ brand.id }"
																					selected="${ brand.id == pro.brand.id ? 'true' : 'false' }">
           																		 ${ brand.name } - selected="${ brand.id == pro.brand.id ? 'true' : 'false' }"
       																					 </form:option>
																			</c:forEach>
																		</form:select>

																		<form:input path="brand" class="form-control"
																			value="${ pro.brand }" />
																	</div>


																	<div>
																		<label>Descriptions</label>
																		<form:input path="description" class="form-control"
																			value="${ pro.description }" />
																	</div>
																	<div>
																		<form:select path="category" class="form-select">
																			<c:forEach items="${ listCate }" var="cate">
																				<form:option value="${ cate.id }"
																					selected="${ cate.id == pro.category.id ? 'true' : 'false' }">
																					${ cate.id } - selected="${ cate.id == pro.category.id ? 'true' : 'false' }"
																				</form:option>
																			</c:forEach>
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
													data-bs-target="#modalDelte_${pro.id }">
													<i class="fa-solid fa-trash-can"></i>
												</button> <!-- Modal delete -->
												<div class="modal fade" id="modalDelte_${pro.id}"
													data-bs-backdrop="static" data-bs-keyboard="false"
													tabindex="-1" aria-labelledby="staticBackdropLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header bg-danger">
																<h5 class="modal-title text-white"
																	id="staticBackdropLabel">Delete a product !</h5>
																<button type="button" class="btn"
																	data-bs-dismiss="modal" aria-label="Close">
																	<i class="fa-solid fa-xmark fs-5 text-white"></i>
																</button>
															</div>
															<div class="modal-body" style="background-color: #fff2df">
																<p>Warning : You are trying a product. This product
																	will be permanently deleted !</p>
																<a role="button"
																	href="/admin/products/delete/${ pro.id }"
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
						<%-- <div class="row">
							<ul class="pagination justify-content-center">
								<c:forEach var="index" begin="0" end="${ data.totalPages - 1 }">
									<li class="page-item mx-1"><a
										class="page-link ${ index==page?'bg-black text-white':'' }"
										href="/admin/products/index?page=${ index }">${ index + 1 }</a>
									</li>
								</c:forEach>
							</ul>
						</div>--%>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var option = {
			animation : true,
			delay : 5000
		}
		document.getElementById("liveToastBtn").onclick = function() {
			var myAlert = document.getElementById("liveToast");
			var bsAlert = new bootstrap.Toast(myAlert, option);
			bsAlert.show();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>