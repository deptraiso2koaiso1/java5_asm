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
<title>Order detail</title>
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
							<li class="breadcrumb-item active" aria-current="page">Order
								details</li>
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
											<form:form action="/admin/order-details/store" method="post"
												modelAttribute="order-detail">
												<div>
													<label>Order ID</label>
													<form:select path="order" class="form-select">
														<c:forEach items="${ listOrder }" var="od">
															<form:option value="${ od.id }">
																${ od.id }
															</form:option>
														</c:forEach>
													</form:select>
												</div>
												<div>
													<label>Product ID</label>
													<form:select path="product" class="form-select">
														<c:forEach items="${ listProduct }" var="pro">
															<form:option value="${ pro.id }">
																${ pro.id }
															</form:option>
														</c:forEach>
													</form:select>
												</div>
												<div>
													<label>Address</label>
													<form:input path="address" class="form-control" />
												</div>
												<div>
													<label>Payment</label>
													<form:input path="paymentMethod" class="form-control" />
												</div>
												<div>
													<label>Price</label>
													<form:input path="amount" class="form-control" />
												</div>
												
												<div>
													<label>Quantity</label>
													<form:input path="quantity" class="form-control" />
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
							<a type="button" class="btn btn-primary" href="/admin/order-detail/excel">
							<i class="fa-solid fa-file-excel"></i>
							<span>Export to excel</span>
							</a>
						</div>
						<div class="table-responsive mt-5" style="overflow-x: auto">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Order ID</th>
										<th>Product ID</th>
										<th>address</th>
										<th>paymentMethod</th>
										<th>amout</th>
										<th>Quantity</th>
										<th colspan="2">Action</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${ data }" var="odetail">
											<tr>
												<td>${ odetail.id }</td>
												<td>
													<!-- Button trigger modal -->
													<button type="button" class="btn btn-warning"
														data-bs-toggle="modal"
														data-bs-target="#modal_${ odetail.order.id }">Xem
														chi tiết ${ odetail.order.id }</button> <!-- Modal -->
													<div class="modal fade" id="modal_${ odetail.order.id }"
														data-bs-backdrop="static" data-bs-keyboard="false"
														tabindex="-1" aria-labelledby="staticBackdropLabel"
														aria-hidden="true">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="staticBackdropLabel">
																		Order detail product</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body row p-5">
																	<div class="col-9">
																		<img alt="${ odetail.product.name }"
																			src="${ odetail.product.image }" width="100"
																			height="100">
																		<p>${ odetail.product.name }</p>
																	</div>
																	<c:if test="${ odetail.order.status == 1}">
																		<div class="col-3">
																			<a type="button" class="btn btn-primary"
																				href="/admin/pdf/${ odetail.order.id }">
																				<i class="fa-solid fa-file-pdf"></i>
																				<span>Export to PDF</span>
																				</a>
																		</div>
																	</c:if>
																	<div class="col-4">
																		<h5>Tên khách hàng</h5>
																		<p>${ odetail.order.customer.name }</p>
																	</div>
																	<div class="col-4">
																		<h5>Số lượng</h5>
																		<p>x ${ odetail.quantity }</p>
																	</div>
																	<div class="col-4">
																		<h5>Đơn giá</h5>
																		<p>${ odetail.amount }</p>
																	</div>
																	<div class="col-4">
																		<h5>Thành tiền</h5>
																		<p class="text-danger">${ odetail.quantity*odetail.amount }
																			VND</p>
																	</div>
																	<div class="col-4">
																		<h5>Địa chỉ nhận hàng</h5>
																		<p>${ odetail.order.customer.address }</p>
																	</div>
																	<div class="col-4">
																		<h5>Trạng thái đơn hàng</h5>
																		<c:if test="${ odetail.order.status == 1}">
																			<p class="bg-success text-white p-2">Đã thanh toán
																			</p>
																		</c:if>
																		<c:if test="${ odetail.order.status == 0}">
																			<p class="bg-secondary text-white p-2">Chưa thanh
																				toán</p>
																		</c:if>
																		<c:if test="${ odetail.order.status == 2}">
																			<p class="bg-danger text-white p-2">Đã hủy</p>
																		</c:if>
																	</div>
																	<c:if test="${ odetail.order.status == 0}">
																		<div class="col-12 mt-2">
																			<a href="/admin/payment-verify/${ odetail.order.id }"
																				type="button" class="btn btn-primary w-100"> Xác
																				nhận đơn hàng</a>
																		</div>
																	</c:if>
																</div>
															</div>
														</div>
													</div>
													<%--${ odetail.order.id } --%>
													
												</td>
												<td>${ odetail.product.id }</td>
												<td>${ odetail.address }</td>
												<td>${ odetail.paymentMethod }</td>
												<td>${ odetail.amount }</td>
												<td>${ odetail.quantity }</td>
											<td class="text-center">
												<button class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#modalUpdate_${odetail.id }">
													<i class="fa-solid fa-pen-to-square"></i>
												</button> <!-- Modal update -->
												<div class="modal fade" id="modalUpdate_${odetail.id}"
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
																<form:form
																	action="/admin/order-details/update/${ odetail.id }"
																	method="post" modelAttribute="order-detail">
																	<div style="text-align: left;">
																		<label>Order ID</label>
																		<form:select path="order" class="form-select">
																			<c:forEach items="${ listOrder }" var="od">
																				<form:option value="${ od.id }"
																					selected="${ od.id == odetail.order.id ? 'true' : 'false' }">
																				${ od.id }
																			</form:option>
																			</c:forEach>
																		</form:select>
																	</div>
																	<div style="text-align: left;">
																		<label>Product ID</label>
																		<form:select path="product" class="form-select">
																			<c:forEach items="${ listProduct }" var="pro">
																				<form:option value="${ pro.id }"
																					selected="${ pro.id == odetail.product.id ? 'true' : 'false' }">
																			${ pro.id }
																		</form:option>
																			</c:forEach>
																		</form:select>
																	</div>
																	<div style="text-align: left;">
																		<label>Price</label>
																		<form:input path="amount" class="form-control"
																			value="${ odetail.amount }" />
																	</div>
																	<div style="text-align: left;">
																		<label>Payment</label>
																		<form:input path="paymentMethod" class="form-control"
																			value="${ odetail.paymentMethod }" />
																	</div>
																	<div style="text-align: left;">
																		<label>address</label>
																		<form:input path="address" class="form-control"
																			value="${ odetail.address }" />
																	</div>
																	<div style="text-align: left;">
																		<label>Quantity</label>
																		<form:input path="quantity" class="form-control"
																			value="${ odetail.quantity }" />
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
													data-bs-target="#modalDelte_${odetail.id }">
													<i class="fa-solid fa-trash-can"></i>
												</button> <!-- Modal delete -->
												<div class="modal fade" id="modalDelte_${odetail.id}"
													data-bs-backdrop="static" data-bs-keyboard="false"
													tabindex="-1" aria-labelledby="staticBackdropLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header bg-danger">
																<h5 class="modal-title text-white"
																	id="staticBackdropLabel">Delete a order detail !</h5>
																<button type="button" class="btn"
																	data-bs-dismiss="modal" aria-label="Close">
																	<i class="fa-solid fa-xmark fs-5 text-white"></i>
																</button>
															</div>
															<div class="modal-body" style="background-color: #fff2df">
																<p>Warning : You are trying a order detail. This
																	order detail will be permanently deleted !</p>
																<a role="button"
																	href="/admin/order-details/delete/${ odetail.id }"
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