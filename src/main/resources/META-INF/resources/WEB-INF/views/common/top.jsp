<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!-- taglib 추가 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<header class="border-bottom border-light border-5">

	<div class="container" style="background-color:#f2f2f2; font-weight:700">


		<!-- 로그인 안된 경우 화면 -->

		<sec:authorize access="isAnonymous()"> 
			<div class="row">
				<nav class="navbar navbar-expand-lg">
					<div class="collapse navbar-collapse">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="main">Home</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="manager"
							id="managerLink">Manager</a></li>
						</ul>
					</div>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="loginForm">Login</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="signup">signup</a>
						</li>

					</ul>
		</sec:authorize>

		<!-- 로그인된 경우 화면 -->

		<sec:authorize access="isAuthenticated()">
			<div class="row">
				<nav class="navbar navbar-expand-lg">
					<div class="collapse navbar-collapse">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="main">Home</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="manager"
								id="managerLink">Manager</a></li>
						</ul>
					</div>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link">안녕하세요. <span style="color: blue;">${login.username}</span>님</a></li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="mypage">mypage</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="cartList">cartList</a>
						</li>
					</ul>
		</sec:authorize>
		</nav>
	</div>
	</div>
</header>

