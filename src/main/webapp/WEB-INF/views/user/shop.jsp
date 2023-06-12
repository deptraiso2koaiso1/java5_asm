<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<style>
.form {
	display: flex;
	margin: 0 30px 0 0;
}
</style>
</head>
<body>
	<div class="site-wrap">
		<%@ include file="/WEB-INF/views/commons/header.jsp"%>
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="/home">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Shop</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">

				<div class="row mb-5">
					<div class="col-md-9 order-2">

						<div class="row">
							<div class="col-md-12 mb-5">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">Shop All</h2>
								</div>
								<div class="d-flex">
									<div class="dropdown mr-1 ml-md-auto">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownCategory" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Category</button>
										<div class="dropdown-menu" aria-labelledby="dropdownCategory">
											<a class="dropdown-item" href="/shop">All Products</a>
											<c:forEach var="category" items="${categories}">
												<a class="dropdown-item"
													href="/shop/products?category=${category.id}">${category.name}</a>
											</c:forEach>
										</div>

									</div>
									<div class="btn-group">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownSort" data-toggle="dropdown">Sort By</button>
										<div class="dropdown-menu" aria-labelledby="dropdownSort">
											<a class="dropdown-item"
												href="/shop?page=0&size=6&sortType=price&sortDir=asc">Sắp
												xếp theo giá (tăng dần)</a> <a class="dropdown-item"
												href="/shop?page=0&size=6&sortType=price&sortDir=desc">Sắp
												xếp theo giá (giảm dần)</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item"
												href="/shop?page=0&size=6&sortType=name&sortDir=asc">Sắp
												xếp theo tên (A-Z)</a> <a class="dropdown-item"
												href="/shop?page=0&size=6&sortType=name&sortDir=desc">Sắp
												xếp theo tên (Z-A)</a>
										</div>
									</div>

								</div>



							</div>
						</div>
						<div class="row mb-5">
							<c:forEach var="product" items="${products.content}">
								<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
									<div class="block-4 text-center border">
										<figure class="block-4-image">
											<a
												href="${pageContext.request.contextPath}/shop/detail/${product.id}">
												<img src="${product.image}" alt="${product.name}"
												class="img-fluid product-image">
											</a>
											<div class="price">${product.price}</div>
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a
													href="${pageContext.request.contextPath}/shop/detail/${product.id}">${product.name}</a>
											</h3>
											<p class="description">${product.description}</p>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>

						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<div>
										<!-- phân trang -->

										<ul class="pagination justify-content-center">
											<c:forEach var="index" begin="0"
												end="${ products.totalPages - 1 }">
												<li class="page-item mx-1"><a
													class="page-link ${ index==page?'bg-black text-white':'' }"
													href="/shop?page=${ index }">${ index + 1 }</a></li>
											</c:forEach>
										</ul>


									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Brands</h3>
							<ul class="list-unstyled mb-0">
								<c:forEach var="brand" items="${brands}">
									<li class="mb-1"><a href="#" class="d-flex"><span>${brand.name}:</span>
											<span class="text-black ml-auto">${brand.origin}</span></a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="border p-4 rounded mb-4">
							<form action="" class="site-block-top-search">
								<span class="icon icon-search2"></span> <input type="text"
									name="search" class="form-control border-0"
									placeholder="Search">
							</form>
						</div>

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Filter
									by Price</h3>
								<div id="slider-range" class="border-primary"></div>
								<input type="text" name="text" id="amount"
									class="form-control border-0 pl-0 bg-white" disabled="" />
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
								<label for="s_sm" class="d-flex"> <input type="checkbox"
									id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small
										(2,319)</span>
								</label> <label for="s_md" class="d-flex"> <input
									type="checkbox" id="s_md" class="mr-2 mt-1"> <span
									class="text-black">Medium (1,282)</span>
								</label> <label for="s_lg" class="d-flex"> <input
									type="checkbox" id="s_lg" class="mr-2 mt-1"> <span
									class="text-black">Large (1,392)</span>
								</label>
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
								<a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Red (2,429)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Green (2,298)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Blue (1,075)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-primary color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Purple (1,075)</span>
								</a>
							</div>

						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="site-section site-blocks-2">
							<div class="row justify-content-center text-center mb-5">
								<div class="col-md-7 site-section-heading pt-4">
									<h2>Categories</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0"
									data-aos="fade" data-aos-delay="">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img src="/images/img/women.jpg" alt="" class="img-fluid">
										</figure>
										<div class="text">

											<span class="text-uppercase">Collections</span>
											<h3>Women</h3>
										</div>
									</a>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
									data-aos="fade" data-aos-delay="100">

									<a class="block-2-item" href="#">
										<figure class="image">
											<img src="/images/img/children.jpg" alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Children</h3>
										</div>
									</a>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
									data-aos="fade" data-aos-delay="200">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img src="/images/img/men.jpg" alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Men</h3>
										</div>
									</a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/commons/footer.jsp"%>
	</div>



</body>
</html>