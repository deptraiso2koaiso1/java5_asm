<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<title>Order</title>

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
			<p class="text-center h2 fw-bold mb-3 mx-1 mx-md-4 mt-4">Your
				information</p>
			<p class="text-center text-danger">${message}</p>
			<form:form method="POST"
				action="${pageContext.request.contextPath}/cart/getCustomer"
				modelAttribute="customers">
				<div class="mb-4">
					<form:input path="name" type="text" class="form-control"
						placeholder="Fullname" />
				</div>
				<div class="mb-4">
					<form:input path="phone" type="text" class="form-control"
						placeholder="Phone" />
				</div>
				<div class="mb-4">
					<form:input path="email" type="email" class="form-control"
						placeholder="Email" />
				</div>
				<div class="mb-4">
					<form:input path="address" type="text" class="form-control"
						placeholder="Address" />
				</div>
				<button type="submit" class="btn btn-danger w-100 my-3 shadow"
					onclick="if (validateForm()) { return confirmDialog(); } else { return false; }">
					Place Order</button>
			</form:form>
		</div>
	</div>
	<br>
	<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	<script>
		function validateForm() {
			let name = document.forms[0]["name"].value;
			let phone = document.forms[0]["phone"].value;
			let email = document.forms[0]["email"].value;
			let address = document.forms[0]["address"].value;

			if (name == "" || phone == "" || email == "" || address == "") {
				alert("Please complete form!");
				event.preventDefault();
				return false;
			}
			return true;
		}
		function confirmDialog() {
			let result = confirm("Are you sure want to place order?");
			if (result) {
				return true;
			} else {
				event.preventDefault();
				return false;
			}
		}
	</script>
</body>
</html>