
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
						<c:choose>
							<c:when test="${empty user}">
								<ul>
									<li><a href="/login">Login</a></li>
									<li><a href="/signup">Signup </a></li>
									<li><a href="/cart" class="site-cart"> <span
											class="icon icon-shopping_cart"></span> <span class="count">${cart.size()}</span>
									</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li>Hi! ${user.name} |</li>
									<li><a href="/logout">Log out</a></li>
									<li><a href="/cart" class="site-cart"> <span
											class="icon icon-shopping_cart"></span> <span class="count">${cart.size()}</span>
									</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
		</div>
	</div> 
	<nav class="site-navigation text-right text-md-center"
		role="navigation">
		<div class="container">
			<ul class="site-menu js-clone-nav d-none d-md-block">
				<li class=""><a href="/home"> Home</a></li>
				<li class=""><a href="">About us</a></li>
				<li><a href="/shop"> Shop</a></li>
				<li><a href=""> New Arrivals</a></li>
				<li><a href=""> Contact</a></li>
			</ul>
		</div>
	</nav>
</header>