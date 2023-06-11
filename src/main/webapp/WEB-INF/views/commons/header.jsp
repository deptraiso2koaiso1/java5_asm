
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
							<c:choose>
								<c:when test="${empty user}">
									<li><a href="/login">Login </a></li>
									<li><a href="/signup">Signup </a></li>
									<li><a href="/cart" class="site-cart"> <span
											class="icon icon-shopping_cart"></span> <span class="count">${cart.size()}</span>
									</a></li>
									<li class="d-inline-block d-md-none ml-md-0"><a href="#"
										class="site-menu-toggle js-menu-toggle"><span
											class="icon-menu"></span></a></li>
								</c:when>
								<c:otherwise>
									<li><p >Hi, ${user.name}! </p></li> |
									<li><a href="/logout"> Log out</a></li>
								</c:otherwise>
							</c:choose>
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