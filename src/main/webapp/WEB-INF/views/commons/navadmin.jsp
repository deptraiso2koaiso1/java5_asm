<div class="container-fluid">

	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarText" aria-controls="navbarText"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/home">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="/shop">shop</a></li>

		</ul>
		<span class="navbar-text" id="dropAccount" role="button"
			data-bs-toggle="dropdown" aria-expanded="false"> <sec:authorize
				access="isAuthenticated()">
				<span> Welcome <sec:authentication
						property="principal.username" />
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