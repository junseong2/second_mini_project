<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<header class="border-bottom border-light border-5">
<script>
$(document).ready(function() {

	$("#managerLink").on("click", function(event) {
	    event.preventDefault();  // 링크 클릭 시 페이지 이동을 막음
	    
	    var password = prompt("비밀번호를 입력하세요:");
	    if (password == 1234) {
	        location.href = "/minipj2/manager";  // 경로를 수정
	    } else {
	        alert("다시 비밀번호를 입력하세요.");
	    }
	});

});
//end ready
</script>
	<div class="container">


		<!-- 로그인 안된 경우 화면 -->

		<c:if test="${empty login}">
			<div class="row">
				<nav class="navbar navbar-expand-lg">
					<div class="collapse navbar-collapse">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="main">Home</a>
							</li>
						</ul>
					</div>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="loginForm">Login</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="signup">signup</a>
						</li>

					</ul>
		</c:if>

		<!-- 로그인된 경우 화면 -->

		<c:if test="${! empty login}">
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
						<li class="nav-item"><a class="nav-link">안녕하세요. ${login.username}님</a></li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="mypage">mypage</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="cartList">cartList</a>
						</li>
					</ul>
		</c:if>
		</nav>
	</div>
	</div>
</header>